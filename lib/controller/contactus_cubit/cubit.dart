import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/contactus_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class ContactUsCubit extends Cubit<ContactUsStates>{
  ContactUsCubit() : super(ContactUsInitialState());
  static ContactUsCubit get(context) => BlocProvider.of(context);
  String? getContactUsErrorMessage;
  postContactUs(context,{name, email, phone, description}){
    emit(PostContactUsLoadingState());
    DioHelper.postData(
        url: AppConstant.postContactUsEndPoint,
        token: CacheHelper.getString("token"),
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "description": description,
        "type": "Genaral"
      }
    ).then((value){
      emit(PostContactUsSuccessState());
      print(value.data);
      AlertsService.success(
          context: context,
          message: "تم بنجاح",
          title: S.of(context)!.success);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getContactUsErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getContactUsErrorMessage = error.message!;
        }
      } else {
        getContactUsErrorMessage = error.toString();
      }
      AlertsService.error(
          context: context,
          message: getContactUsErrorMessage!,
          title: S.of(context)!.failed);
      emit(PostContactUsErrorState(error.toString()));
    });
  }
}