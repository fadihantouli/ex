import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/airport_and_ticket/ticket_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketCubit extends Cubit<TicketState>{
  TicketCubit() : super(TicketInitialStates());
  static TicketCubit get(context) => BlocProvider.of(context);

  String? getTicketErrorMessage;
  String? getOneTicketErrorMessage;
  getTicket(){
    emit(GetTicketLoadingState());
    DioHelper.getData(
      url: AppConstant.getTicketEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetTicketSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getTicketErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getTicketErrorMessage = error.message!;
        }
      } else {
        getTicketErrorMessage = error.toString();
      }
      emit(GetTicketErrorState(error.toString()));
    });
  }
  getOneTicket(id){
    emit(GetOneTicketLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getTicketEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneTicketSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneTicketErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneTicketErrorMessage = error.message!;
        }
      } else {
        getOneTicketErrorMessage = error.toString();
      }
      emit(GetOneTicketErrorState(error.toString()));
    });
  }
}