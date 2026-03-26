import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';

class AcademyCubit extends Cubit<AcademyStates>{
  AcademyCubit() : super(AcademyInitialStates());
  static AcademyCubit get(context) => BlocProvider.of(context);
  String? getAcademyErrorMessage;
  String? bookAcademyErrorMessage;
  String? getOneAcademyErrorMessage;
  var generalCourseCheckId;
  var generalCourseCheckPrice = "0";
  var generalCourseCheckStartDate;
  var selectAirportMeet;
  var selectInsurance;
  var generalHouseCheckId;
  var generalHouseCheckPrice= "0";
  var generalInsuranceCheckId;
  var generalInsuranceCheckPrice  = "0";
  var generalReceptionCheckId;
  var generalReceptionCheckPrice= "0";
  List academy = [];
  List attach = [];
  List docs = [];
  List images = [];

 getAcademy({country_id, start_date, housing, study_weeks, insurance, reception}){
    emit(GetAcademyLoadingStates());
    DioHelper.postData(
      url: "academy/list",
      token: CacheHelper.getString("token"),
      data: {
      if(country_id != null)  "country_id": country_id,
        if(start_date != null) "start_date": start_date,
        if(housing != null)   "housing": housing == true ? 1 : 0 , // 1 or 0
        if(insurance != null)   "insurance": insurance == true ? 1 : 0 , // 1 or 0
        if(reception != null)   "reception": reception == true ? 1 : 0 , // 1 or 0
        if(study_weeks != null)   "study_weeks": int.parse(study_weeks),
      }
    ).then((value){
      academy = value.data['data'];
      print(value.data);
      emit(GetAcademySuccessStates());
      if(value.data['data'].isNotEmpty){
        print("EEE");
        value.data['data'].forEach((e){
          print("E1 is -> $e");
          if(e["attachment"].isNotEmpty){
            e["attachment"].forEach((e){
              print("E2 is -> $e");
              if(e['images']!.isNotEmpty){
                images.clear();
                images=e['images'];
              }
            });
          }
        });
      }
      print("LENGHT __> ${images.length}");
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getAcademyErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getAcademyErrorMessage = error.message!;
        }
      } else {
        getAcademyErrorMessage = error.toString();
      }
      emit(GetAcademyErrorStates(error.toString()));
    });
  }
  var imagePath;
  var nameAr;
  var nameEn;
  var lat;
  var long;
  var addressCountryAr;
  var addressCountryEn;
  var addressCityAr;
  var addressCityEn;
  var descriptionAr;
  var descriptionEn;
  List accreditation = [];
  List academyServices = [];
  List courses = [];
  List housings = [];
  List insurances = [];
  List receptions = [];
  List attachment = [];
  getOneAcademy(id){
    emit(GetOneAcademyLoadingStates());
    DioHelper.getData(
      url: "${AppConstant.getAcademyEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneAcademySuccessStates());
      imagePath = value.data['data']['image_path'];
      lat = value.data['data']['late'];
      long = value.data['data']['lang'];
      nameAr = value.data['data']['title']['ar'];
      nameEn = value.data['data']['title']['en'];
      addressCountryAr = value.data['data']['country']['name']['ar'];
      addressCountryEn = value.data['data']['country']['name']['en'];
      addressCityAr = value.data['data']['city']['name']['ar'];
      addressCityEn = value.data['data']['city']['name']['en'];
      accreditation = value.data['data']['accreditation'];
      descriptionAr = value.data['data']['description']['ar'];
      descriptionEn = value.data['data']['description']['en'];
      academyServices = value.data['data']['academy_services'];
      courses = value.data['data']['course'];
      housings = value.data['data']['housing'];
      insurances = value.data['data']['insurance'];
      receptions = value.data['data']['reception'];
      attachment = value.data['data']['attachment'];
      print("MODEL IS --> $housings");
      print("ATTACHS is --> ${attachment}");
     if(value.data['data']['attachment'].isNotEmpty){
         value.data['data']['attachment'].forEach((e){
           print("ATTACHS is --> ${attachment}");
           if(e.images!.isNotEmpty){
             images.clear();
             images =e.images!;
           }
         });
     }
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneAcademyErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneAcademyErrorMessage = error.message!;
        }
      } else {
        getOneAcademyErrorMessage = error.toString();
      }
      print("ERROR IS ${getOneAcademyErrorMessage}");
      emit(GetOneAcademyErrorStates(error.toString()));
    });
  }
  bookAcademy({user_id, academy_id, start_date, end_date, course_id, housing_id,
    reception_id, insurance_id, total_price, context}){
    emit(BookAcademyLoadingStates());
    DioHelper.postData(
        url: "academyBooking",
        token: CacheHelper.getString("token"),
        data: {
      if(user_id!=null)    "user_id" :user_id,
          "academy_id" : academy_id,
          "start_date" : start_date,
          "end_date" : end_date,
          "course_id" : course_id,
          "housing_id" : housing_id,
          "reception_id" : reception_id,
          "insurance_id" : insurance_id,
         if(total_price != null) "total_price" : total_price
        }
    ).then((value){
      emit(BookAcademySuccessStates());
      print(value.data);
      AlertsService.success(
          context: context,
          message: S.of(context)!.booked!,
          title: S.of(context)!.success);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          bookAcademyErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          bookAcademyErrorMessage = error.message!;
        }
      } else {
        bookAcademyErrorMessage = error.toString();
      }
      AlertsService.error(
          context: context,
          message: S.of(context)!.fill_data,
          title: S.of(context)!.failed);
      emit(BookAcademyErrorStates(error.toString()));
    });
  }
}