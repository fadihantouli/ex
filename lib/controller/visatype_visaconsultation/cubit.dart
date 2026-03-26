import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/airport_and_ticket/ticket_cubit/states.dart';
import 'package:xvisa/controller/visatype_visaconsultation/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class VisaTypeAndConsultationCubit extends Cubit<VisaTypeAndConsultationState>{
  VisaTypeAndConsultationCubit() : super(VisaTypeAndConsultationInitialStates());
  static VisaTypeAndConsultationCubit get(context) => BlocProvider.of(context);

  String? getVisaTypeAndConsultationErrorMessage;
  String? getOneVisaTypeAndConsultationErrorMessage;

  List visaType = [];
  getVisaType(){
    emit(GetVisaTypeLoadingState());
    DioHelper.getData(
      url: "auth/visaConsultationTypes",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetVisaTypeSuccessState());
      visaType = value.data['data'];
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getVisaTypeAndConsultationErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getVisaTypeAndConsultationErrorMessage = error.message!;
        }
      } else {
        getVisaTypeAndConsultationErrorMessage = error.toString();
      }
      emit(GetVisaTypeErrorState(error.toString()));
    });
  }
  postVisaConsultation(email, name, phone, visaType_id, context){
    emit(PostVisaConsultationLoadingState());
    DioHelper.postData(
      url: AppConstant.postVisaConsultationEndPoint,
      token: CacheHelper.getString("token"),
      data: {
        "visaType_id" : visaType_id,
        "name" : name,
        "phone" : phone,
        "email" : email
      }
    ).then((value){
      emit(PostVisaConsultationSuccessState());
      AlertsService.success(
          context: context,
          message: S.of(context)!.createSuccessfully,
          title: S.of(context)!.success);
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneVisaTypeAndConsultationErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneVisaTypeAndConsultationErrorMessage = error.message!;
        }
      } else {
        getOneVisaTypeAndConsultationErrorMessage = error.toString();
      }
      AlertsService.error(
          context: context,
          message: getOneVisaTypeAndConsultationErrorMessage!,
          title: S.of(context)!.failed);
      emit(PostVisaConsultationErrorState(error.toString()));
    });
  }
}