import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/course_cubit/state.dart';
import 'package:xvisa/controller/hotel_and_room/hotel_cubit/state.dart';
import 'package:xvisa/model/get_hotel_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HotelCubit extends Cubit<HotelState>{
  HotelCubit() : super(HotelInitialState());
  static HotelCubit get(context) => BlocProvider.of(context);
  String? getHotelErrorMessage;
  String? getOneHotelErrorMessage;
  String? selectLocation;
  String? selectStudyWeek;
  String? selectStartDate;
  String? selectNeedHouse;
  String? selectGetFromAirport;
  String? selectStudyInsurance;
  String? selectLeaveDate;
  String? selectLeaveType;
  DateTime? _selectedDate;
  DateTime? _selectedDate2;
  int adultCount = 0;
  int childCount = 0;
  int roomCount = 0;
  var selectedDate;
  var selectedDate2;
  GetHotelModel? getHotelModel;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(_selectedDate!);
      selectedDate = outputDate;
      emit(HotelAraiveState());
      print(selectedDate);
    }
  }
  Future<void> selectDateOnther(BuildContext context) async {
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pick != null && pick != _selectedDate2) {
      _selectedDate2 = pick;
      var outputFormats = DateFormat('yyyy-MM-dd');
      var outputDates = outputFormats.format(_selectedDate2!);
      selectedDate2 = outputDates;
      emit(HotelLeftDateState());
      print(selectedDate2);
    }
  }
  getHotel({filterCheck, countryId, startDate, endDate, countRoom}){
    emit(GetHotelLoadingState());
    DioHelper.postData(
      url: "hotel/list",
      token: CacheHelper.getString("token"),
      data: {
        if(filterCheck != null)"filterCheck" :filterCheck,
        if(countryId != null) "country_id" :countryId,
        if(startDate != null)"start_date" : startDate,
        if(endDate != null) "end_date" : endDate,
        if(countRoom != null) "count_room" : countRoom
      }
    ).then((value){
      getHotelModel = GetHotelModel.fromJson(value.data);
      print("HET ---> ${getHotelModel!.data!.length}");
      emit(GetHotelSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getHotelErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getHotelErrorMessage = error.message!;
        }
      } else {
        getHotelErrorMessage = error.toString();
      }
      emit(GetHotelErrorState(error.toString()));
    });
  }
  getOneHotel(id){
    emit(GetOneHotelLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getHotelEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneHotelSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneHotelErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneHotelErrorMessage = error.message!;
        }
      } else {
        getOneHotelErrorMessage = error.toString();
      }
      emit(GetOneHotelErrorState(error.toString()));
    });
  }

}