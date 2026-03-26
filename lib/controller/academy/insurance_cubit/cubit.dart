import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/controller/academy/accreditation_cubit/state.dart';
import 'package:xvisa/controller/academy/house_cubit/states.dart';
import 'package:xvisa/controller/academy/insurance_cubit/state.dart';
import 'package:xvisa/controller/home_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsuranceCubit extends Cubit<InsuranceState>{
  InsuranceCubit() : super(InsuranceInitialState());
  static InsuranceCubit get(context) => BlocProvider.of(context);
  String? getInsuranceErrorMessage;
  String? getOneInsuranceErrorMessage;
  getInsurance(){
    emit(GetInsuranceLoadingState());
    DioHelper.getData(
      url: AppConstant.getInsuranceEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetInsuranceSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getInsuranceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getInsuranceErrorMessage = error.message!;
        }
      } else {
        getInsuranceErrorMessage = error.toString();
      }
      emit(GetInsuranceErrorState(error.toString()));
    });
  }
  getOneInsurance(id){
    emit(GetOneInsuranceLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getInsuranceEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneInsuranceSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneInsuranceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneInsuranceErrorMessage = error.message!;
        }
      } else {
        getOneInsuranceErrorMessage = error.toString();
      }
      emit(GetOneInsuranceErrorState(error.toString()));
    });
  }
}