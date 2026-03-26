import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/faq_and_question/question_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCubit extends Cubit<QuestionStates>{
  QuestionCubit() : super(QuestionInitialState());
  static QuestionCubit get(context) => BlocProvider.of(context);
  String? getQuestionErrorMessage;
  getQuestion({name, email, phone, description}){
    emit(GetQuestionLoadingState());
    DioHelper.postData(
        url: AppConstant.getQuestionEndPoint,
        token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetQuestionSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getQuestionErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getQuestionErrorMessage = error.message!;
        }
      } else {
        getQuestionErrorMessage = error.toString();
      }
      emit(GetQuestionErrorState(error.toString()));
    });
  }
}