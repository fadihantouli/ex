import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/alert_widget.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialStates());

  static AuthCubit get(context) => BlocProvider.of(context);
  String code = '';
  String loginMessage = '';
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailLoginEditingController =
      TextEditingController();
  final TextEditingController passwordLoginEditingController =
      TextEditingController();
  final TextEditingController phoneLoginEditingController =
      TextEditingController();

  final TextEditingController nameArRegisterEditingController =
      TextEditingController();
  final TextEditingController nameEnRegisterEditingController =
      TextEditingController();
  final TextEditingController nameRegisterEditingController =
      TextEditingController();
  final TextEditingController usernameRegisterEditingController =
      TextEditingController();
  final TextEditingController emailRegisterEditingController =
      TextEditingController();
  final TextEditingController passwordRegisterEditingController =
      TextEditingController();
  final TextEditingController phoneRegisterEditingController =
      TextEditingController();
  final TextEditingController passwordUpdatePasswordEditingController =
      TextEditingController();
  final TextEditingController passwordConfirmUpdatePasswordEditingController =
      TextEditingController();

  final TextEditingController emailForgetPasswordEditingController =
      TextEditingController();

  login(context, {type, methoud}) {
    emit(LoginLoadingStates());
    DioHelper.postData(url: AppConstant.loginEndPoint, data: {
      "type": type,
      "methoud": methoud,
       if (type == "otp") "phone": phoneLoginEditingController.text,
      if (type == "password") "email": emailLoginEditingController.text,
      if (type == "password") "password": passwordLoginEditingController.text
      // 'is'
    }).then((value) {
      print(value.data);
      emit(LoginSuccessStates(value.data['data']['token'],
          value.data['data']['user']['id'], value.data['message']));
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(LoginErrorStates(errorMessage));
    });
  }

  verifyLogin(context) {
    emit(LoginVerifyLoadingStates());
    DioHelper.postData(
            url: AppConstant.loginVerifyEndPoint,
            data: {"otp": code, "userId": CacheHelper.getInt("user_id")})
        .then((value) {
      print(value.data);
      loginMessage = value.data['message'];
      emit(LoginVerifySuccessStates(value.data['data']['token'],
          value.data['data']['id'], value.data['message']));
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(LoginVerifyErrorStates(errorMessage));
    });
  }

  register(context) {
    if (nameEnRegisterEditingController.text.isEmpty ||
        passwordRegisterEditingController.text.isEmpty ||
        emailRegisterEditingController.text.isEmpty||phoneRegisterEditingController.text.isEmpty) {
      AlertsService.error(
          context: context,
          message: S.of(context).fill_data,
          title: S.of(context)!.failed);
      return;
    }
    if (phoneRegisterEditingController.text.startsWith("0")) {
      phoneRegisterEditingController.text =
          phoneRegisterEditingController.text.substring(1);
    }
    emit(RegisterLoadingStates());
    DioHelper.postData(url: AppConstant.registerEndPoint, data: {
      "name_en": nameEnRegisterEditingController.text,
      "name_ar": nameEnRegisterEditingController.text,
      "username": nameEnRegisterEditingController.text,
      "password": passwordRegisterEditingController.text,
      "email": emailRegisterEditingController.text,
      "phone": "${phoneRegisterEditingController.text}",
     }).then((value) {
      print(value.data);
      emit(RegisterSuccessStates());
      if (value.data['is_success'] == false) {
        AlertsService.error(
            context: context,
            message: value.data['message'],
            title: S.of(context)!.failed);
      } else {
        AlertsService.success(
            context: context,
            message: S.of(context)!.createSuccessfully,
            title: S.of(context)!.success);
      }
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(RegisterErrorStates(errorMessage));
    });
  }

  updatePassword(context) {
    emit(UpdatePasswordLoadingStates());
    DioHelper.postData(
        url: AppConstant.confirmPasswordEndPoint,
        token: CacheHelper.getString("forgetToken"),
        data: {
          "password": passwordUpdatePasswordEditingController.text,
          "password_confirmation":
              passwordConfirmUpdatePasswordEditingController.text,
        }).then((value) {
      print(value.data);
      emit(UpdatePasswordSuccessStates());
      AlertsService.success(
          context: context,
          message: S.of(context)!.createSuccessfully,
          title: S.of(context)!.success);
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(UpdatePasswordErrorStates(errorMessage));
    });
  }

  verification(context, {email}) {
    emit(VerificationPasswordLoadingStates());
    DioHelper.postData(url: AppConstant.verificationEmailEndPoint, data: {
      "email": email.toString(),
      "code": code.toString(),
    }).then((value) {
      print(value.data);
      CacheHelper.setString(
          key: "forgetToken", value: value.data['data']['token']);
      emit(VerificationPasswordSuccessStates());
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(VerificationPasswordErrorStates(errorMessage));
    });
  }

  forget(context) {
    emit(ForgetPasswordLoadingStates());
    DioHelper.postData(url: AppConstant.forgetPasswordEndPoint, data: {
      "email": emailForgetPasswordEditingController.text,
    }).then((value) {
      print(value.data);
      emit(ForgetPasswordSuccessStates());
    }).catchError((e) {
      String errorMessage;
      if (e is DioError && e.response != null) {
        errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
      } else {
        errorMessage = 'An error occurred: ${e.toString()}';
      }
      AlertsService.error(
          context: context,
          message: errorMessage,
          title: S.of(context)!.failed);
      emit(ForgetPasswordErrorStates(errorMessage));
    });
  }
}
