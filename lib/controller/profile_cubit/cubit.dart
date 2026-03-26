import 'dart:io';
import '../../generated/l10n.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xvisa/controller/profile_cubit/state.dart';
import 'package:xvisa/model/get_profile_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  String? getProfileErrorMessage;
  String? getBookingErrorMessage;
  GetProfileModel? getProfileModel;
  XFile? XImageFileAttachmentPersonal;
  File? attachmentPersonalImage;
  List listAttachmentPersonalImage = [];
  List<XFile> listXAttachmentPersonalImage = [];
  final picker = ImagePicker();
  List visaBooking = [];
  List academyBooking = [];
  //List visaBooking = [];
  getProfile(){
    getProfileModel = null;
    emit(GetProfileLoading());
    DioHelper.getData(
      url: AppConstant.GetProfileEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetProfileSuccess());
      CacheHelper.setString(key: "user-name", value: value.data['data']['name']['ar']);
      CacheHelper.setString(key: "user-email", value: value.data['data']['email']);
      CacheHelper.setString(key: "user-phone", value: value.data['data']['phone']);
      getProfileModel = GetProfileModel.fromJson(value.data);
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getProfileErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getProfileErrorMessage = error.message!;
        }
      } else {
        getProfileErrorMessage = error.toString();
      }
      emit(GetProfileError(error.toString()));
    });
  }
  getBooking(){
    emit(GetBookingLoading());
    DioHelper.getData(
      url: AppConstant.GetBookingEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetBookingSuccess());
      visaBooking = value.data['data']['visa_checkouts'];
      academyBooking = value.data['data']['academy_checkouts'];
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getBookingErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getBookingErrorMessage = error.message!;
        }
      } else {
        getBookingErrorMessage = error.toString();
      }
      emit(GetBookingError(error.toString()));
    });
  }
  logout(){
    emit(LogoutLoading());
    DioHelper.postData(
      url: AppConstant.getLogoutEndPoint,
      token: CacheHelper.getString("token"),
    ).then((value){
      emit(LogoutSuccess());
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getBookingErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getBookingErrorMessage = error.message!;
        }
      } else {
        getBookingErrorMessage = error.toString();
      }
      emit(LogoutError(error.toString()));
    });
  }
  editProfile({nameEn, email , phone, address, context, List<XFile>? imagePath})async{
    emit(UpdateProfileLoading());
    if(imagePath != null && imagePath.isNotEmpty){
      FormData formData = FormData.fromMap({
        "name[en]" : nameEn,
        "email" : email,
        "phone" : phone,
        "address" : address,
        "image_path": imagePath != null
            ? await Future.wait(imagePath.map((file) async => await MultipartFile.fromFile(file.path, filename: file.name)).toList()) : null,
      });
      DioHelper.postWithImageData(
          url: "auth/updateProfile",
          token: CacheHelper.getString("token"),
          formdata: formData
      ).then((value){
        emit(UpdateProfileSuccess());
        AlertsService.success(
            context: context,
            message: "تم التحديث بنجاح",
            title: S.of(context)!.success);
        print(value.data);
      }).catchError((error){
        if (error is DioError) {
          if (error.response != null) {
            getProfileErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
          } else {
            getProfileErrorMessage = error.message!;
          }
        } else {
          getProfileErrorMessage = error.toString();
        }
        AlertsService.error(
            context: context,
            message: getProfileErrorMessage.toString(),
            title: S.of(context)!.failed);
        emit(UpdateProfileError(error.toString()));
      });
    }else {
      DioHelper.postData(
          url: "auth/updateProfile",
          token: CacheHelper.getString("token"),
          data: {
            "name[en]": nameEn,
            "email": email,
            "phone": phone,
            "address": address,
          }
      ).then((value) {
        emit(UpdateProfileSuccess());
        AlertsService.success(
            context: context,
            message: "تم التحديث بنجاح",
            title: S.of(context)!.success);
        print(value.data);
      }).catchError((error) {
        if (error is DioError) {
          if (error.response != null) {
            getProfileErrorMessage =
                error.response?.data['message'] ?? 'Something went wrong';
          } else {
            getProfileErrorMessage = error.message!;
          }
        } else {
          getProfileErrorMessage = error.toString();
        }
        AlertsService.error(
            context: context,
            message: getProfileErrorMessage.toString(),
            title: S.of(context)!.failed);
        emit(UpdateProfileError(error.toString()));
      });
    }
  }
  Future<void> getProfileImageByCam(
      {image1, image2, list, list2, one}) async {
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
  Future<void> getProfileImageByGallery(
      {image1, image2, list, list2, one}) async {
    XFile? imageFileProfile =
    await picker.pickImage(source: ImageSource.gallery);
    if (imageFileProfile == null) return null;
    image1 = File(imageFileProfile.path);
    image2 = imageFileProfile;
    if(one == false) list.add({"image": image2, "view": image1});
    if(one == false)list2.add(image2);
    print("LISTS IS --> ${list}");
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
}