import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/airport_and_ticket/airport_cubit/states.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirportCubit extends Cubit<AirportState>{
  AirportCubit() : super(AirportInitialStates());
  static AirportCubit get(context) => BlocProvider.of(context);

  String? getAirportErrorMessage;
  String? getOneAirportErrorMessage;
  getAirport(){
    emit(GetAirportLoadingState());
    DioHelper.getData(
      url: AppConstant.getAirportEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetAirportSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getAirportErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getAirportErrorMessage = error.message!;
        }
      } else {
        getAirportErrorMessage = error.toString();
      }
      emit(GetAirportErrorState(error.toString()));
    });
  }
  getOneAirport(id){
    emit(GetOneAirportLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getAirportEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneAirportSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneAirportErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneAirportErrorMessage = error.message!;
        }
      } else {
        getOneAirportErrorMessage = error.toString();
      }
      emit(GetOneAirportErrorState(error.toString()));
    });
  }
}