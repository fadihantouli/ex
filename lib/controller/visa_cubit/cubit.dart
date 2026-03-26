import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/visa_cubit/states.dart';
import 'package:xvisa/model/get_one_visa_checkout_model.dart';
import 'package:xvisa/model/get_visa_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../generated/l10n.dart';

class VisaCubit extends Cubit<VisaState> {
  VisaCubit() : super(VisaInitialStates());

  static VisaCubit get(context) => BlocProvider.of(context);
  int adultCount = 0;
  int childCount = 0;
  String? errorMessage;
  TextEditingController couponController = TextEditingController();
  String? selectVisaType;
  String? selectVisaInterview;
  String? selectTypeRelationshipTravelers;
  var selectTypeRelationshipTravelersId;
  DateTime? _selectedDate;
  var selectedDate;
  var selectedCountry;
  List cities = [];
  VisaModel? visaModel;
  GetOneVisaCheckoutModel? getOneVisaCheckoutModel;

  void updateData(var newData) {
    emit(selectedCountry(newData));
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(_selectedDate!);
      selectedDate = outputDate;
      emit(VisaSelectDateStates());
      print(selectedDate);
    }
  }

  postVisaCheckout1(
      {context,
      visa_type_id,
      finger_print_id,
      visa_id,
      city_id,
      user_id,
      start_date,
      coupon,
      coupon_price,
      quantity_adult,
      quantity_child,
      total_price,
      type_relationship_travelers}) {
    emit(PostVisa1LoadingStates());
    DioHelper.postData(
        url: "visa-checkout",
        token: CacheHelper.getString("token"),
        data: {
          "visa_type_id": visa_type_id,
          "visa_id": visa_id,
          // if (finger_print_id != null)
            "finger_print_id": finger_print_id,
          "city_id": city_id,
          "user_id": user_id,
          "end_date": start_date,
          if (coupon != null) "coupon": coupon,
          if (coupon_price != null) "coupon_price": coupon_price,
          "quantity_adult": quantity_adult,
          "quantity_child": quantity_child,
          "total_price": total_price,
          "type_relationship_travelers": type_relationship_travelers
        }).then((value) {
      emit(PostVisa1SuccessStates());
      CacheHelper.setInt(key: "visa-id", value: value.data['data']['id']);
      AlertsService.success(
          context: context,
          message: S.of(context)!.service_register_sucess,
          title: S.of(context)!.success);
    }).catchError((e) {
      emit(PostVisa1ErrorStates(e.toString()));
      if (e is DioError) {
        if (e.response != null) {
          errorMessage = e.response?.data['message'] ?? 'Something went wrong';
        } else {
          errorMessage = e.message!;
        }
      } else {
        errorMessage = e.toString();
      }
      if (errorMessage == "The selected finger print id is invalid.") {
        AlertsService.error(
            context: context,
            message:
                "لا يوجد مقابلات متاحه في هذه المدينه حاليا اختر مدينه اخري",
            title: 'فشل!');
      } else {
        AlertsService.error(
            context: context, message: errorMessage!, title: 'فشل!');
      }
    });
  }

  var couponStatus;
  var couponMessage;
  var couponRatio;

  getOneVisa({id}) {
    emit(GetOneVisaLoadingStates());
    DioHelper.getData(
            url: "visa-checkout/$id", token: CacheHelper.getString("token"))
        .then((value) {
      emit(GetOneVisaSuccessStates());
      getOneVisaCheckoutModel = GetOneVisaCheckoutModel.fromJson(value.data);
      print(value.data);
    }).catchError((e) {
      print(e.toString());
      emit(GetOneVisaErrorStates(e.toString()));
    });
  }

  postVisaCoupon({context, visaId, visaTypeId}) {
    print("ID IS --> ${visaTypeId}");
    emit(PostVisaCouponLoadingStates());
    DioHelper.postData(
        url: "coupon/checkCoupon",
        token: CacheHelper.getString("token"),
        data: {
          "promo_code": couponController.text,
          "visaId": visaId,
          "visaTypeId": visaTypeId,
        }).then((value) {
      emit(PostVisaCouponSuccessStates());
      couponStatus = value.data['data']['promo_code_price_status'];
      couponMessage = value.data['message'];
      if (couponStatus == true) {
        couponRatio = value.data['data']['ratio'];
        AlertsService.success(
            context: context,
            message: couponMessage,
            title: S.of(context)!.success);
      } else {
        AlertsService.error(
            context: context,
            message: couponMessage,
            title: S.of(context)!.failed);
      }
    }).catchError((e) {
      emit(PostVisaCouponErrorStates(e.toString()));
      if (e is DioError) {
        if (e.response != null) {
          errorMessage = e.response?.data['message'] ?? 'Something went wrong';
        } else {
          errorMessage = e.message!;
        }
      } else {
        errorMessage = e.toString();
      }
      AlertsService.error(
          context: context, message: errorMessage!, title: 'فشل!');
    });
  }

  getOneVisaCheckout({id}) {
    emit(GetOneVisaLoadingStates());
    DioHelper.getData(
            url: "visa-checkout/$id", token: CacheHelper.getString("token"))
        .then((value) {
      emit(GetOneVisaSuccessStates());
      getOneVisaCheckoutModel = GetOneVisaCheckoutModel.fromJson(value.data);
      print(value.data);
    }).catchError((e) {
      print(e.toString());
      emit(GetOneVisaErrorStates(e.toString()));
    });
  }

  getCities() {
    emit(GetCitiesLoadingStates());
    DioHelper.getData(
      url: "city",
      token: CacheHelper.getString("token"),
    ).then((value) {
      emit(GetCitiesSuccessStates());
      cities = value.data['data'];
    }).catchError((e) {
      emit(GetCitiesErrorStates(e.toString()));
      print(e.toString());
    });
  }

  getVisa({search}) {
    emit(GetVisaLoadingStates());
    DioHelper.getData(
      url: "visa",
      query: {if (search != null) "search": search},
      token: CacheHelper.getString("token"),
    ).then((value) {
      emit(GetVisaSuccessStates());
      print(value.data);
      if (VisaModel.fromJson(value.data).data!.length == 0) {
        visaModel = null;
      } else
        visaModel = VisaModel.fromJson(value.data);
      // getVisas();

      print("SUUCCEE"+"  "+ value.data.toString());
    }).catchError((e) {
      emit(GetVisaErrorStates(e.toString()));
      print(e.toString());
    });
  }

  getVisas({search}) {
    emit(GetVisaLoadingStates());
    DioHelper.getData(
      url: "visa",
      // url:"visapublic",
      query: {if (search != null) "search": search},
      token: CacheHelper.getString("token"),
    ).then((value) {
      emit(GetVisaSuccessStates());
      print(value.data);
      if (VisaModel.fromJson(value.data).data!.length == 0) {
        visaModel = null;
      } else
        visaModel = VisaModel.fromJson(value.data);

      print("SUUCCEE"+"  "+ value.data.toString());
    }).catchError((e) {
      emit(GetVisaErrorStates(e.toString()));
      print(e.toString());
    });
  }

}
