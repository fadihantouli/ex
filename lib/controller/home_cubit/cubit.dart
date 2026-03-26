import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/home_cubit/state.dart';
import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  String? getHomeErrorMessage;
  ViewHomeModel? viewHomeModel;
  List visas = [];
  List services = [];
  getHome(){
    emit(GetHomeLoadingState());
    DioHelper.getData(
        url: AppConstant.getHomeEndPoint,
    ).then((value){
      emit(GetHomeSuccessState());
      services = value.data['data']['serviceTypes'];
      visas = value.data['data']['visas'];
      viewHomeModel = ViewHomeModel.fromJson(value.data);
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getHomeErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getHomeErrorMessage = error.message!;
        }
      } else {
        getHomeErrorMessage = error.toString();
      }
      emit(GetHomeErrorState(error.toString()));
    });
  }
}