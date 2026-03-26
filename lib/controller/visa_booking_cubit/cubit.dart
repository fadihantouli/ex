import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

class VisaBookingCubit extends Cubit<VisaBookingState> {
  VisaBookingCubit() : super(VisaBookingInitialStates());

  static VisaBookingCubit get(context) => BlocProvider.of(context);
  String? errorMessage;
  bool? selectHaveVisaBefore;
  bool? selectTravelAmericaBefore;
  bool? selectDeniedOrCancelled;
  String? selectMaritalStatus;
  bool? selectRelativesLivingCountry;
  String? selectRelativesLivingCountryPebole;
  String? selectRelativesLivingAmerica;
  String? selectCountry;
  String? selectYear;
  bool? selectHaveDriverLicence;
  String? selectAppointment;
  String? selectCountryType;
  String? selectVisaType;
  String? selectTravelDate;
  String? selectPassengerNumber;
  bool check = false;
  String? selectOwnName;
  XFile? XImageFileAttachmentBank;
  File? attachmentBankImage;
  List listAttachmentBankImage = [];
  List<XFile> listXAttachmentBankImage = [];
  final picker = ImagePicker();
  DateTime? selectedDateUnder;
  var selectedDate;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstMotherNameController = TextEditingController();
  TextEditingController lastMotherNameController = TextEditingController();
  TextEditingController nationalityMotherController = TextEditingController();
  TextEditingController periodStayController = TextEditingController();
  TextEditingController refusedExplainController = TextEditingController();
  TextEditingController ownerOfTheAccountStatementController =
      TextEditingController();
  XFile? XImageFileAttachmentPassport;
  File? attachmentPassportImage;
  List listAttachmentPassportImage = [];
  List<XFile> listXAttachmentPassportImage = [];
  XFile? XImageFileCountryVisaPath;
  File? attachmentCountryVisaPathImage;
  List listCountryVisaPathImage = [];
  List<XFile> listXCountryVisaPathImage = [];
  XFile? XImageFileTravelAmericaBeforePath;
  File? attachmentTravelAmericaBeforePathImage;
  List listTravelAmericaBeforePathImage = [];
  List<XFile> listXTravelAmericaBeforePathImage = [];
  XFile? XImageFileAccoutStatementPath;
  File? attachmentAccoutStatementPathImage;
  List listAccoutStatementPathImage = [];
  List<XFile> listXAccoutStatementPathImage = [];
  XFile? XImageFileSalaryImagePath;
  File? attachmentSalaryImagePathImage;
  List listSalaryImagePathImage = [];
  List<XFile> listXSalaryImagePathImage = [];
  XFile? XImageFileAttachmentPersonal;
  File? attachmentPersonalImage;
  List listAttachmentPersonalImage = [];
  List<XFile> listXAttachmentPersonalImage = [];

  Future<void> selectDate(BuildContext context,
      {selectedDate, selectedDateUnder}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    // && picked != selectedDateUnder
    if (picked != null ) {
      selectedDateUnder = picked;
      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(selectedDateUnder!);
      selectedDate = outputDate;
      emit(VisaSelectDateStates());
      print(selectedDate);
    }
  }

  postVisaBooking(void Function() onSucess, context,
      {visa_checkout_id,
      first_name,
      last_name,
      first_name_for_mother,
      last_name_for_mother,
      nationality_for_mother,
      List<XFile>? passport_path,
      List<XFile>? personal_photo_path,
      List<XFile>? country_visa_path,
      country_visa,
      travel_country,
      date,
      period_stay,
      driver_license,
      refusal_travel_country,
      countries,
      marital_status,
      relatives_living_in_country,
      genre_relatives_living_in_country,
      explain,
      sponsor_name,
      List<XFile>? account_statement_path,
      List<XFile>? salary_statement_path}) async {
    emit(PostVisaBookingLoadingStates());
    FormData formData = FormData.fromMap({
      "visa_checkout_id": visa_checkout_id,
      "first_name": first_name,
      "last_name": last_name,
      "first_name_for_mother": first_name_for_mother,
      "last_name_for_mother": last_name_for_mother,
      "nationality_for_mother": nationality_for_mother,
      "passport_path": passport_path != null
          ? await Future.wait(passport_path
              .map((file) async =>
                  await MultipartFile.fromFile(file.path, filename: file.name))
              .toList())
          : null,
      "personal_photo_path": personal_photo_path != null
          ? await Future.wait(personal_photo_path
              .map((file) async =>
                  await MultipartFile.fromFile(file.path, filename: file.name))
              .toList())
          : null,
      "country_visa": country_visa,
      // 1 or 0 هل سبق وطلعت تأشيره لهذه الدوله
      if (country_visa == true)
        "country_visa_path": country_visa_path != null
            ? await Future.wait(country_visa_path
                .map((file) async => await MultipartFile.fromFile(file.path,
                    filename: file.name))
                .toList())
            : null,
      // if country_visa = 1
      "travel_country": travel_country,
      // 1 or 0هل سبق وسافرت هذه الدوله
      if (travel_country == true) "date": date,
      // if travel_country = 1
      if (travel_country == true) "period_stay": period_stay,
      // if travel_country = 1
      if (travel_country == true) "driver_license": driver_license,
      // if travel_country = 1
      "refusal_travel_country": refusal_travel_country,
      // 1 or 0
      if (refusal_travel_country == true) "explain": explain,
      // if refusal_travel_country = 1
      "countries": countries,
      "marital_status": marital_status,
      "relatives_living_in_country": relatives_living_in_country,
      // 1 or 0
      "genre_relatives_living_in_country": genre_relatives_living_in_country,
      "sponsor_name": sponsor_name,
      "user_id": CacheHelper.getInt("user_id"),
      // "date":"2026-01-31",
      "account_statement_path": account_statement_path != null
          ? await Future.wait(account_statement_path
              .map((file) async =>
                  await MultipartFile.fromFile(file.path, filename: file.name))
              .toList())
          : null,
      "salary_statement_path": salary_statement_path != null
          ? await Future.wait(salary_statement_path
              .map((file) async =>
                  await MultipartFile.fromFile(file.path, filename: file.name))
              .toList())
          : null,
    });
    DioHelper.postWithImageData(
            url: "visaBooking",
            token: CacheHelper.getString("token"),
            formdata: formData)
        .then((value) {
      emit(PostVisaBookingSuccessStates());
      print(value.data);
      // CacheHelper.deleteData(key: "visa-id");
      onSucess();

      AlertsService.success(
          context: context,
          message: S.of(context)!.service_register_sucess,
          title: S.of(context)!.success);
    }).catchError((e) {
      if (e is DioError) {
        if (e.response != null) {
          errorMessage = e.response?.data['message'] ?? 'Something went wrong';
        } else {
          errorMessage = e.message!;
        }
      } else {
        errorMessage = e.toString();
      }
      AlertsService.error(
          context: context,
          message: errorMessage!,
          title: S.of(context)!.failed);
    });
  }

  Future<void> getProfileImageByCam({image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
        await picker.pickImage(source: ImageSource.camera);
    if (imageFileProfile == null) return;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if (one == false) list.add({"image": image2, "view": image1});
    if (one == false) list2.add(image2);
    emit(GetVisaBookingImageByCamStates());
    print(image1);
  }

  Future<void> getProfileImageByGallery(
      {image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageFileProfile == null) return null;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if (one == false) list.add({"image": image2, "view": image1});
    if (one == false) list2.add(image2);
    emit(GetVisaBookingImageByGalleryStates());
  }

  Future<void> getImage(context,
          {image1, image2, list, bool one = true, list2}) =>
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
                    Text(
                      "Select Photo",
                      style: TextStyle(fontSize: 20, color: Color(0xFF011A51)),
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
                                    one: one);
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
                            Text(
                              "Gallery",
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
                                    one: one);
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

  changeCheck() {
    check = !check;
    emit(ChangeCheckStates());
  }
}
