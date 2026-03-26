import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/contactus_cubit/state.dart';
import 'package:xvisa/controller/setting_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingStates>{
  SettingCubit() : super(SettingInitialState());
  static SettingCubit get(context) => BlocProvider.of(context);
  String? getSettingErrorMessage;
  getSetting({name, email, phone, description}){
    emit(GetSettingLoadingState());
    DioHelper.postData(
        url: AppConstant.getSettingEndPoint,
        token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetSettingSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getSettingErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getSettingErrorMessage = error.message!;
        }
      } else {
        getSettingErrorMessage = error.toString();
      }
      emit(GetSettingErrorState(error.toString()));
    });
  }
}