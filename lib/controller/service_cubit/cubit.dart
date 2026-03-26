import 'dart:convert';
import 'dart:io';
import '../../generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/servise_type_model.dart';

class ServiceCubit extends Cubit<ServiceState>{
  ServiceCubit() : super(ServiceInitialStates());
  static ServiceCubit get(context) => BlocProvider.of(context);
  DateTime? _selectedDate;
  var selectedDate;
  ServiseTypeModel? serviseTypeModel;
  String? selectCountry;
  String? selectLicenseCount;
  String? selectLicenseCardCount;
  String? selectPassportCount;
  String? selectContentToBeTranslated;
  String? selectModelType;
  String? selectApproximateNumberOfPages;
  String? selectLicenseReceive;
  String? selectAirportServiceType;
  String? selectRequiredServiceId;
  String? selectRequiredServicePrice;
  String? selectIELTESCertificate;
  String? selectPreferredCallTime;
  String? selectYourEducation;
  String? selectYourLastEducation;
  String? selectFlightDurationInDays;
  String? selectUniversityPaymentWay;
  TextEditingController nationalityController = TextEditingController();
  TextEditingController placeOfPickupController = TextEditingController();
  TextEditingController placeOfDeliveryController = TextEditingController();
  TextEditingController requiredSpecializationController = TextEditingController();
  TextEditingController yourNameController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? getServiceErrorMessage;
  String? getOneServiceErrorMessage;
  String? getServiceTypeErrorMessage;
  String? postServiceErrorMessage;
  XFile? XImageFileAttachment;
  File? attachmentImage;
  List listAttachmentImage = [];
  List<XFile> listXAttachmentImage = [];
  XFile? XImageFileAttachment2;
  File? attachmentImage2;
  List listAttachmentImage2 = [];
  List<XFile> listXAttachmentImage2 = [];
  final picker = ImagePicker();
  Future<void> getProfileImageByCam({image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
    await picker.pickImage(source: ImageSource.camera);
    if (imageFileProfile == null) return;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if(one == false)list.add({"image": image2, "view": image1});
    if(one == false)list2.add(image2);
    emit(GetProfileImageByCamStates());
    print(image1);
  }
  Future<void> getProfileImageByGallery({image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
    await picker.pickImage(source: ImageSource.gallery);
    if (imageFileProfile == null) return null;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if(one == false) list.add({"image": image2, "view": image1});
    if(one == false)list2.add(image2);
    emit(GetProfileImageByGalleryStates());
  }
  Future<void> getProfileImageByCam2({image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
    await picker.pickImage(source: ImageSource.camera);
    if (imageFileProfile == null) return;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if(one == false)list.add({"image": image2, "view": image1});
    if(one == false)list2.add(image2);
    emit(GetProfileImageByCamStates());
    print(image1);
  }
  Future<void> getProfileImageByGallery2({image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
    await picker.pickImage(source: ImageSource.gallery);
    if (imageFileProfile == null) return null;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if(one == false) list.add({"image": image2, "view": image1});
    if(one == false)list2.add(image2);
    emit(GetProfileImageByGalleryStates());
  }
  Future<void> getImage( context, {image1, image2, list, bool one = true, list2}) =>
      showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Select Photo",
                      style: TextStyle(
                          fontSize: 20, color: Color(0xFF011A51)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                await getProfileImageByGallery(
                                    image1: image1,
                                    image2: image2,
                                    list: list,
                                    list2: list2,
                                    one: one
                                );
                                await image2 == null
                                    ? null
                                    : Image.asset(
                                    "assets/images/profileImage.png");
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.image,
                                  color: Color(0xFF011A51),
                                ),
                              ),
                            ),
                            Text("Gallery",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF011A51)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await getProfileImageByCam(
                                    image1: image1,
                                    image2: image2,
                                    list: list,
                                    list2: list2,
                                    one: one
                                );
                                print(image1);
                                print(image2);
                                await image2 == null
                                    ? null
                                    : Image.asset(
                                    "assets/images/profileImage.png");
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera,
                                  color: Color(0xFF011A51),
                                ),
                              ),
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
  Future<void> getImage2( context, {image1, image2, list, bool one = true, list2}) =>
      showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Select Photo",
                      style: TextStyle(
                          fontSize: 20, color: Color(0xFF011A51)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                await getProfileImageByGallery2(
                                    image1: image1,
                                    image2: image2,
                                    list: list,
                                    list2: list2,
                                    one: one
                                );
                                await image2 == null
                                    ? null
                                    : Image.asset(
                                    "assets/images/profileImage.png");
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.image,
                                  color: Color(0xFF011A51),
                                ),
                              ),
                            ),
                            Text("Gallery",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF011A51)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await getProfileImageByCam2(
                                    image1: image1,
                                    image2: image2,
                                    list: list,
                                    list2: list2,
                                    one: one
                                );
                                print(image1);
                                print(image2);
                                await image2 == null
                                    ? null
                                    : Image.asset(
                                    "assets/images/profileImage.png");
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera,
                                  color: Color(0xFF011A51),
                                ),
                              ),
                            ),
                            Text(
                              "Camera",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
  getService(){
    emit(GetServiceLoadingState());
    DioHelper.getData(
      url: AppConstant.getServiceEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetServiceSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getServiceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getServiceErrorMessage = error.message!;
        }
      } else {
        getServiceErrorMessage = error.toString();
      }
      emit(GetServiceErrorState(error.toString()));
    });
  }
  var serviceId;
  postPayment({visa_checkout_id, InvoiceValue, CustomerName, CustomerEmail, CustomerMobile, type}){

  emit(PostPaymentLoadingState());
    DioHelper.postData(
      url: AppConstant.postPaymentEndPoint,
      token: CacheHelper.getString("token"),
      data: {
        if(type == "visa") "visa_checkout_id":visa_checkout_id,
        if(type == "service")"serviceId" : CacheHelper.getInt("serviceId"),
        if(type == "academy") "academyBookingId": CacheHelper.getString("academyBookingId"),
        "InvoiceValue": InvoiceValue,
        "CustomerName":"test",
        "CustomerEmail": CustomerEmail.toString().trim(),
        "CustomerMobile": CustomerMobile.toString(),
        "type": "visa"

      }
    ).then((value){
      emit(PostPaymentSuccessState(url: value.data['url']));
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getServiceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getServiceErrorMessage = error.message!;
        }
      } else {
        getServiceErrorMessage = error.toString();
      }
      emit(PostPaymentErrorState(error.toString()));
    });
  }
  var postServiceId;
  postService(context,{DUOLINGO_test_city_id,Fill_out_travel_forms,airport_receipt_location,travel_model_type,name,email, phone,airport_type,airport_place_of_delivery,airport_date,driver_country,
    driver_trip_duration_in_days, driver_receipt_date,licence_count,licence2_count,licence_receipt_location,licence2_receipt_location,
    university_country,university_nationality,university_payment_method,university_specialization,university_preferred_call_time,
    university_educational_qualification,university_academic_last_certificate, university_IELTS_TOEFL,translation_count,translation_type_preferred
    ,List<XFile>? translation_file,passports_count,passports_country,uae_visa_count,b_visa_count,q_visa_count,IELTS_test_city_id,
    PTE_test_city_id,List<XFile>? insurance_licence_driver_file,List<XFile>? insurance_licence_car_file,visa_children_count,visa_children_country_id,service_type_id})async{
    emit(PostServiceLoadingState());
    FormData formData = FormData.fromMap(
        {
          if(travel_model_type != null)"travel_model_type" :travel_model_type,
          if(airport_receipt_location != null)"airport_receipt_location" :airport_receipt_location,
          if(Fill_out_travel_forms != null)"Fill_out_travel_forms" :Fill_out_travel_forms,
          if(DUOLINGO_test_city_id != null)"DUOLINGO_test_city_id" :DUOLINGO_test_city_id,
          if(name != null)"name" : name,
          if(email != null)"email" : email,
          if(phone != null)"phone" : phone,
          if(airport_type != null)"airport_type" : airport_type,
          if(airport_place_of_delivery != null)"airport_place_of_delivery" : airport_place_of_delivery,
          if(airport_date != null)"airport_date" : airport_date,
          if(driver_country != null)"driver_country" : driver_country,
          if(driver_trip_duration_in_days != null)"driver_trip_duration_in_days" : driver_trip_duration_in_days,
          if(driver_receipt_date != null) "driver_receipt_date" : driver_receipt_date,
          if(licence_count != null) "licence_count" :licence_count,
          if(licence2_count != null)"licence2_count" : licence2_count,
          if(licence_receipt_location != null) "licence_receipt_location" : licence_receipt_location,
          if(licence2_receipt_location != null) "licence2_receipt_location" : licence2_receipt_location,
          if(university_country != null)"university_country" : university_country,
          if(university_nationality != null)"university_nationality" : university_nationality,
          if(university_payment_method != null)"university_payment_method" : university_payment_method,
          if(university_specialization != null)"university_specialization" : university_specialization,
          if(university_educational_qualification != null)"university_educational_qualification" : university_educational_qualification,
          if(university_academic_last_certificate != null)"university_academic_last_certificate" : university_academic_last_certificate,
          if(university_IELTS_TOEFL != null)"university_IELTS_TOEFL" : university_IELTS_TOEFL,
          if(university_preferred_call_time != null)"university_preferred_call_time" : university_preferred_call_time,
          if(translation_count != null)"translation_count" : translation_count,
          if(translation_type_preferred != null)"translation_type_preferred" : translation_type_preferred,
          if(translation_file != null)"translation_file" :  translation_file != null
        ? await Future.wait(translation_file.map((file) async => await MultipartFile.fromFile(file.path, filename: file.name)).toList()) : null,
          if(passports_count != null)"passports_count" : passports_count,
          if(passports_country != null)"passports_country" : passports_country,
          if(uae_visa_count != null)"uae_visa_count" : uae_visa_count,
          if(b_visa_count != null)"b_visa_count" : b_visa_count,
          if(q_visa_count != null)"q_visa_count" : q_visa_count,
          if(IELTS_test_city_id != null)"IELTS_test_city_id" : IELTS_test_city_id,
          if(PTE_test_city_id != null)"PTE_test_city_id" : PTE_test_city_id,
          if(insurance_licence_driver_file != null)"insurance_licence_driver_file" : insurance_licence_driver_file != null
        ? await Future.wait(insurance_licence_driver_file.map((file) async => await MultipartFile.fromFile(file.path, filename: file.name)).toList()) : null,
           if(insurance_licence_car_file != null)"insurance_licence_car_file" : insurance_licence_car_file != null
        ? await Future.wait(insurance_licence_car_file.map((file) async => await MultipartFile.fromFile(file.path, filename: file.name)).toList()) : null,
          if(visa_children_count != null)"visa_children_count" : visa_children_count,
          if(visa_children_country_id != null)"visa_children_country_id" : visa_children_country_id,
          if(service_type_id != null)"service_type_id" : service_type_id
        }
    );
    DioHelper.postWithImageData(
      url: AppConstant.postServiceEndPoint,
      token: CacheHelper.getString("token"),
      formdata: formData
    ).then((value){
      emit(PostServiceSuccessState(value.data['data']['id']));
      CacheHelper.setInt(value: value.data['data']['id'], key: "serviceId");
      AlertsService.success(
          context: context,
          message: S.of(context)!.createSuccessfully,
          title: S.of(context)!.success);
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          postServiceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          postServiceErrorMessage = error.message!;
        }
      }
      else {
        postServiceErrorMessage = error.toString();
      }
      AlertsService.error(
          context: context,
          message: postServiceErrorMessage!,
          title: S.of(context)!.failed);
      emit(PostServiceErrorState(error.toString()));
    });
  }
  getServiceType(context){
    emit(GetServiceTypeLoadingState());
    DioHelper.getData(
      url: AppConstant.getServiceTypeEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetServiceTypeSuccessState());
      serviseTypeModel = ServiseTypeModel.fromJson(value.data);
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getServiceTypeErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getServiceTypeErrorMessage = error.message!;
        }
      } else {
        getServiceTypeErrorMessage = error.toString();
      }
      AlertsService.error(
          context: context,
          message: getServiceTypeErrorMessage!,
          title: S.of(context)!.failed);
      emit(GetServiceTypeErrorState(error.toString()));
    });
  }
  getOneService(id){
    emit(GetOneServiceLoadingState());
    DioHelper.getData(
      url: "${AppConstant.getServiceEndPoint}/$id",
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetOneServiceSuccessState());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getOneServiceErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getOneServiceErrorMessage = error.message!;
        }
      } else {
        getOneServiceErrorMessage = error.toString();
      }
      emit(GetOneServiceErrorState(error.toString()));
    });
  }
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
        emit(ServiceSelectDateStates());
        print(selectedDate);
    }
  }
}