import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/drawer_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<DrawerStates>{
  DrawerCubit() : super(DrawerInitialStates());
  static DrawerCubit get(context) => BlocProvider.of(context);

  String? getFaqErrorMessage;
  List faqs = [];
  getFaq(){
    emit(GetFaqLoadingStates());
    DioHelper.getData(
        url: "frequentlyAskedQuestion",
        token: CacheHelper.getString("token")
    ).then((value){
      emit(GetFaqSuccessStates());
      print(value.data);
      faqs = value.data['data'];
    }).catchError((error){
      if (error.response != null) {
        getFaqErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
      } else {
        getFaqErrorMessage = error.message!;
      }
    emit(GetFaqErrorStates(error.toString()));
    });
  }
}