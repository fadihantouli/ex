import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/course_cubit/state.dart';
import 'package:xvisa/controller/hotel_and_room/room_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomCubit extends Cubit<RoomState>{
  RoomCubit() : super(RoomInitialState());
  static RoomCubit get(context) => BlocProvider.of(context);
  String? getRoomErrorMessage;
  String? getOneRoomErrorMessage;
  getRoom(){
    emit(GetRoomLoadingState());
    DioHelper.getData(
      url: AppConstant.getRoomEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetRoomSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getRoomErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getRoomErrorMessage = error.message!;
        }
      } else {
        getRoomErrorMessage = error.toString();
      }
      emit(GetRoomErrorState(error.toString()));
    });
  }
  getOneRoom(id){
    emit(GetOneRoomLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getRoomEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneRoomSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneRoomErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneRoomErrorMessage = error.message!;
        }
      } else {
        getOneRoomErrorMessage = error.toString();
      }
      emit(GetOneRoomErrorState(error.toString()));
    });
  }
}