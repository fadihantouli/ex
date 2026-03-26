import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/controller/academy/accreditation_cubit/state.dart';
import 'package:xvisa/controller/academy/house_cubit/states.dart';
import 'package:xvisa/controller/home_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HouseCubit extends Cubit<HouseState>{
  HouseCubit() : super(HouseInitialState());
  static HouseCubit get(context) => BlocProvider.of(context);
  String? getHouseErrorMessage;
  String? getOneHouseErrorMessage;
  getHouse(){
    emit(GetHouseLoadingState());
    DioHelper.getData(
      url: AppConstant.getHouseEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetHouseSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getHouseErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getHouseErrorMessage = error.message!;
        }
      } else {
        getHouseErrorMessage = error.toString();
      }
      emit(GetHouseErrorState(error.toString()));
    });
  }
  getOneHouse(id){
    emit(GetOneHouseLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getHouseEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneHouseSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneHouseErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneHouseErrorMessage = error.message!;
        }
      } else {
        getOneHouseErrorMessage = error.toString();
      }
      emit(GetOneHouseErrorState(error.toString()));
    });
  }
}