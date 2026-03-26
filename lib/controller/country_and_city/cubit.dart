import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryAndCityCubit extends Cubit<CountryAndCityState>{
  CountryAndCityCubit() : super(CountryAndCityInitialState());
  static CountryAndCityCubit get(context) => BlocProvider.of(context);
  String? getCountryErrorMessage;
  String? getCityErrorMessage;
  List countries = [];
  getCountry(){
    emit(GetCountryLoadingState());
    DioHelper.getData(
      url: AppConstant.getCountryEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetCountrySuccessState());
      countries = value.data['data'];
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getCountryErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getCountryErrorMessage = error.message!;
        }
      } else {
        getCountryErrorMessage = error.toString();
      }
      emit(GetCountryErrorState(error.toString()));
    });
  }
  getCity(){
    emit(GetCityLoadingState());
    DioHelper.getData(
      url: AppConstant.getCityEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetCitySuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getCityErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getCityErrorMessage = error.message!;
        }
      } else {
        getCityErrorMessage = error.toString();
      }
      emit(GetCityErrorState(error.toString()));
    });
  }
}