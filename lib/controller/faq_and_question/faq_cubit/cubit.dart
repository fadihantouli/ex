import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/faq_and_question/faq_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQCubit extends Cubit<FAQStates>{
  FAQCubit() : super(FAQInitialState());
  static FAQCubit get(context) => BlocProvider.of(context);
  String? getFAQErrorMessage;
  getFAQ({name, email, phone, description}){
    emit(GetFAQLoadingState());
    DioHelper.postData(
        url: AppConstant.getFAQEndPoint,
        token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetFAQSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getFAQErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getFAQErrorMessage = error.message!;
        }
      } else {
        getFAQErrorMessage = error.toString();
      }
      emit(GetFAQErrorState(error.toString()));
    });
  }
}