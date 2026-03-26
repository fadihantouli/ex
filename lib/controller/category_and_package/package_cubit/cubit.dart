import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/category_and_package/category_cubit/state.dart';
import 'package:xvisa/controller/category_and_package/package_cubit/state.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageCubit extends Cubit<PackageState>{
  PackageCubit() : super(PackageInitialState());
  static PackageCubit get(context) => BlocProvider.of(context);
  String? getPackageErrorMessage;
  String? getOnePackageErrorMessage;
  getPackage(){
    emit(GetPackageLoadingState());
    DioHelper.getData(
      url: AppConstant.getPackageEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetPackageSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getPackageErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getPackageErrorMessage = error.message!;
        }
      } else {
        getPackageErrorMessage = error.toString();
      }
      emit(GetPackageErrorState(error.toString()));
    });
  }
  getOnePackage(id){
    emit(GetOnePackageLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getPackageEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOnePackageSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOnePackageErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOnePackageErrorMessage = error.message!;
        }
      } else {
        getOnePackageErrorMessage = error.toString();
      }
      emit(GetOnePackageErrorState(error.toString()));
    });
  }
}