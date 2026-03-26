import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/controller/academy/accreditation_cubit/state.dart';
import 'package:xvisa/controller/home_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccreditationCubit extends Cubit<AccreditationState>{
  AccreditationCubit() : super(AccreditationInitialState());
  static AccreditationCubit get(context) => BlocProvider.of(context);
  String? getAccreditationErrorMessage;
  String? getOneAccreditationErrorMessage;
  getAccreditation(){
    emit(GetAccreditationLoadingState());
    DioHelper.getData(
      url: AppConstant.getAccreditationEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetAccreditationSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getAccreditationErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getAccreditationErrorMessage = error.message!;
        }
      } else {
        getAccreditationErrorMessage = error.toString();
      }
      emit(GetAccreditationErrorState(error.toString()));
    });
  }
  getOneAccreditation(id){
    emit(GetOneAccreditationLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getAccreditationEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneAccreditationSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneAccreditationErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneAccreditationErrorMessage = error.message!;
        }
      } else {
        getOneAccreditationErrorMessage = error.toString();
      }
      emit(GetOneAccreditationErrorState(error.toString()));
    });
  }
}