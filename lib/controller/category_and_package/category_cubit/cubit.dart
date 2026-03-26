import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/category_and_package/category_cubit/state.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryInitialState());
  static CategoryCubit get(context) => BlocProvider.of(context);
  String? getCategoryErrorMessage;
  String? getOneCategoryErrorMessage;
  getCategory(){
    emit(GetCategoryLoadingState());
    DioHelper.getData(
      url: AppConstant.getCategoryEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetCategorySuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getCategoryErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getCategoryErrorMessage = error.message!;
        }
      } else {
        getCategoryErrorMessage = error.toString();
      }
      emit(GetCategoryErrorState(error.toString()));
    });
  }
  getOneCategory(id){
    emit(GetOneCategoryLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getCategoryEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneCategorySuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneCategoryErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneCategoryErrorMessage = error.message!;
        }
      } else {
        getOneCategoryErrorMessage = error.toString();
      }
      emit(GetOneCategoryErrorState(error.toString()));
    });
  }
}