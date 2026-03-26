import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/reception_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceptionCubit extends Cubit<ReceptionState>{
  ReceptionCubit() : super(ReceptionInitialState());
  static ReceptionCubit get(context) => BlocProvider.of(context);
  String? getReceptionErrorMessage;
  String? getOneReceptionErrorMessage;
  getReception(){
    emit(GetReceptionLoadingState());
    DioHelper.getData(
      url: AppConstant.getReceptionEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetReceptionSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getReceptionErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getReceptionErrorMessage = error.message!;
        }
      } else {
        getReceptionErrorMessage = error.toString();
      }
      emit(GetReceptionErrorState(error.toString()));
    });
  }
  getOneReception(id){
    emit(GetOneReceptionLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getReceptionEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneReceptionSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneReceptionErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneReceptionErrorMessage = error.message!;
        }
      } else {
        getOneReceptionErrorMessage = error.toString();
      }
      emit(GetOneReceptionErrorState(error.toString()));
    });
  }
}