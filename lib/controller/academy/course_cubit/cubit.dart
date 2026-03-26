import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/course_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState>{
  CourseCubit() : super(CourseInitialState());
  static CourseCubit get(context) => BlocProvider.of(context);
  String? getCourseErrorMessage;
  String? getOneCourseErrorMessage;
  getCourse(){
    emit(GetCourseLoadingState());
    DioHelper.getData(
      url: AppConstant.getCourseEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetCourseSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getCourseErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getCourseErrorMessage = error.message!;
        }
      } else {
        getCourseErrorMessage = error.toString();
      }
      emit(GetCourseErrorState(error.toString()));
    });
  }
  getOneCourse(id){
    emit(GetOneCourseLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getCourseEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneCourseSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneCourseErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneCourseErrorMessage = error.message!;
        }
      } else {
        getOneCourseErrorMessage = error.toString();
      }
      emit(GetOneCourseErrorState(error.toString()));
    });
  }
}