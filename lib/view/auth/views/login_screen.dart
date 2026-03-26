import 'package:xvisa/controller/login_cubit/cubit.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/assets.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/validate.dart';
import 'package:xvisa/view/auth/views/forget_password_screen.dart';
import 'package:xvisa/view/auth/views/register_screen.dart';
import 'package:xvisa/view/auth/views/verification_screen.dart';
import 'package:xvisa/view/best_vise_form1/best_visa_form_one_screen.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/view/home/main_screen.dart';

class LoginScreen extends StatefulWidget {
  final fromSplash;

  LoginScreen({required this.fromSplash});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhoneSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.loginBackground),
                fit: BoxFit.cover, // تغطي الشاشة كاملة
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: BlocConsumer<AuthCubit, AuthStates>(
                    listener: (context, state) {
                      if (state is LoginSuccessStates) {
                        if (state.loginMessage != "Successfully Send Otp") {
                          CacheHelper.setString(
                                  key: 'token', value: state.token)
                              .then((v) {
                            CacheHelper.setInt(key: "user_id", value: state.id);
                            if (widget.fromSplash == true) {
                              finishNavigate(
                                  context: context, screen: MainScreen());
                            } else {
                              finishNavigate(
                                  context: context,
                                  screen: const BestVisaFormOneScreen());
                            }
                          });
                        } else {
                          CacheHelper.setInt(key: "user_id", value: state.id);
                          if (widget.fromSplash == true) {
                            navigateTo(
                                context: context,
                                screen: VerificationScreen(code: "yes"));
                          } else {
                            navigateTo(
                                context: context,
                                screen: const BestVisaFormOneScreen());
                          }
                        }
                      }
                    },
                    builder: (context, state) {
                      var cubit = AuthCubit.get(context);
                      if (state is! LoginLoadingStates) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 25.h),
                            Image.asset('assets/images/logo.png'),
                            SizedBox(height: 30.h),
                            Text(
                              S.of(context)!.loginToday,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(height: 15.h),
                            // اختيار Phone / Email
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.brown, width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.phoneLoginEditingController
                                            .clear();
                                        cubit.emailLoginEditingController
                                            .clear();
                                        cubit.passwordLoginEditingController
                                            .clear();
                                        setState(() {
                                          isPhoneSelected = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isPhoneSelected
                                              ? Colors.brown
                                              : Colors.white,
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(8)),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context)!.phoneNumber,
                                          style: TextStyle(
                                            color: isPhoneSelected
                                                ? Colors.white
                                                : Colors.brown,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.phoneLoginEditingController
                                            .clear();
                                        cubit.emailLoginEditingController
                                            .clear();
                                        cubit.passwordLoginEditingController
                                            .clear();
                                        setState(() {
                                          isPhoneSelected = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isPhoneSelected
                                              ? Colors.white
                                              : Colors.brown,
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(8)),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context)!.email,
                                          style: TextStyle(
                                            color: isPhoneSelected
                                                ? Colors.brown
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.h),
                            // الحقول
                            if (!isPhoneSelected)
                              PrimaryTextField(
                                controller: cubit.emailLoginEditingController,
                                validator: (value) =>
                                    AppValidator.validateEmail(value),
                                hint: 'youremail@mail.com',
                                padding: EdgeInsets.only(bottom: 20.h),
                                textColor: const Color(0xffBDBDBD),
                                inputType: TextInputType.emailAddress,
                                suffix: const Icon(
                                  Icons.mail_outline_sharp,
                                  color: AppColors.textAndBackgroundColorButton,
                                ),
                              ),
                            if (!isPhoneSelected)
                              PrimaryTextField(
                                controller:
                                    cubit.passwordLoginEditingController,
                                validator: (value) =>
                                    AppValidator.validatePassword(value),
                                hint: S.of(context)!.password,
                                padding: EdgeInsets.zero,
                                textColor: const Color(0xffBDBDBD),
                                suffix: const Icon(
                                  Icons.mail_outline_sharp,
                                  color: AppColors.textAndBackgroundColorButton,
                                ),
                                isObscureText: true,
                              ),
                            // if (isPhoneSelected)
                            //   PrimaryTextField(
                            //     controller: cubit.phoneLoginEditingController,
                            //     validator: (value) =>
                            //         AppValidator.validatePhone(value),
                            //     hint: S.of(context)!.phoneNumber,
                            //     padding: EdgeInsets.zero,
                            //     textColor: const Color(0xffBDBDBD),
                            //     inputType: TextInputType.phone,
                            //     suffix:   Padding(
                            //       padding: EdgeInsets.only(top: 10),
                            //       child: Text(S.of(context).code,style: TextStyle(color: Colors.white),),
                            //     ),
                            //   ),

                            if (isPhoneSelected)
                              CacheHelper.getString("language") == "ar"
                                  ? Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.white, width: 1.5),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: cubit
                                                  .phoneLoginEditingController,
                                              validator: (value) =>
                                                  AppValidator.validatePhone(
                                                      value),
                                              keyboardType: TextInputType.phone,
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                hintText:
                                                    S.of(context).phoneNumber,
                                                hintStyle: const TextStyle(
                                                    color: Color(0xffBDBDBD)),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 18),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 14),
                                            // decoration: BoxDecoration(
                                            //    borderRadius: CacheHelper.getString("language") == "ar"
                                            //       ? const BorderRadius.only(
                                            //     topRight: Radius.circular(8),
                                            //     bottomRight: Radius.circular(8),
                                            //   )
                                            //       : const BorderRadius.only(
                                            //     topLeft: Radius.circular(8),
                                            //     bottomLeft: Radius.circular(8),
                                            //   ),
                                            // ),
                                            child: Text(
                                              S.of(context).code,
                                              // هنا يظهر رمز الدولة مثل +962
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.white, width: 1.5),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 14),
                                            // decoration: BoxDecoration(
                                            //    borderRadius: CacheHelper.getString("language") == "ar"
                                            //       ? const BorderRadius.only(
                                            //     topRight: Radius.circular(8),
                                            //     bottomRight: Radius.circular(8),
                                            //   )
                                            //       : const BorderRadius.only(
                                            //     topLeft: Radius.circular(8),
                                            //     bottomLeft: Radius.circular(8),
                                            //   ),
                                            // ),
                                            child: Text(
                                              S.of(context).code,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: cubit
                                                  .phoneLoginEditingController,
                                              validator: (value) =>
                                                  AppValidator.validatePhone(
                                                      value),
                                              keyboardType: TextInputType.phone,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                hintText:
                                                    S.of(context).phoneNumber,
                                                hintStyle: const TextStyle(
                                                    color: Color(0xffBDBDBD)),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 18),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment:
                                  CacheHelper.getString("language") == "ar"
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                              children: [
                                DefaultTextButton(
                                  onPressed: () {
                                    navigateTo(
                                        context: context,
                                        screen: const ForgetPasswordScreen());
                                  },
                                  text: S.of(context)!.forgotPassword,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // زر الدخول
                            CustomActionButton(
                              onTap: () async {
                                if (cubit.emailLoginEditingController.text
                                        .isNotEmpty &&
                                    cubit.passwordLoginEditingController.text
                                        .isNotEmpty) {
                                  await cubit.login(context,
                                      type: "password", methoud: "email");
                                }
                                if (cubit.emailLoginEditingController.text
                                        .isEmpty &&
                                    cubit.passwordLoginEditingController.text
                                        .isEmpty &&
                                    cubit.phoneLoginEditingController.text
                                        .isNotEmpty) {
                                  await cubit.login(context,
                                      type: "otp", methoud: "phone");
                                }
                              },
                              text: S.of(context)!.login,
                              borderRadius: BorderRadius.circular(12.r),
                              backGroundColor:
                                  AppColors.textAndBackgroundColorButton,
                              height: 60.h,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 30),
                            // رابط التسجيل
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context)!.didntAccount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.white),
                                ),
                                DefaultTextButton(
                                  onPressed: () {
                                    navigateTo(
                                        context: context,
                                        screen: RegisterScreen());
                                  },
                                  textColor: Colors.white,
                                  text: S.of(context)!.signupHere,
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white));
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
