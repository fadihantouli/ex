import 'package:xvisa/controller/login_cubit/cubit.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/auth/views/update_password_screen.dart';
import 'package:xvisa/view/auth/views/widgets/custom_otp_text_field.dart';
import 'package:xvisa/view/home/home_screen.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utills/colors.dart';
import '../../home/main_screen.dart';


class VerificationScreen extends StatelessWidget {
  final String? email;
  final String? code;

  const VerificationScreen({super.key, this.email, this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if(state is LoginVerifySuccessStates){
              CacheHelper.setString(key: 'token', value: state.token).then((v){
                finishNavigate(
                    context: context,
                    screen: MainScreen()
                );
              });
            }
            if(state is VerificationPasswordSuccessStates){
              finishNavigate(
                context: context,
                screen: const UpdatePasswordScreen()
              );
            }
            if(state is VerificationPasswordErrorStates){
              // showDialog(
              //   context: context,
              //   builder: (context) => CustomDialog(
              //     title: state.error,
              //     subtitle: S.of(context)!.sorry,
              //     labelText: S.of(context)!.close,
              //     color: AppColors.redAppColor,
              //   ),
              // );
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            if(state is VerificationPasswordLoadingStates){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is! VerificationPasswordLoadingStates){
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                  top: 0.h,
                ),
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 30.h),
                  Text(
                    S.of(context)!.verify,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomOTPTextField(
                    onCompleted: (code) {
                      cubit.code = code;
                    },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextButton(
                        onPressed: () {},
                        text: S.of(context)!.didYouReceiveAnyCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if(state is LoginVerifyLoadingStates || state is VerificationPasswordLoadingStates )Center(
                    child: CircularProgressIndicator(),
                  ),
                  if(state is! LoginVerifyLoadingStates &&state is! VerificationPasswordLoadingStates )CustomActionButton(
                    text: S.of(context)!.verify,
                    borderRadius: BorderRadius.circular(16.sp),
                    backGroundColor: AppColors.textAndBackgroundColorButton,
                    onTap: () async {
                      if(code != null){
                        await cubit.verifyLogin(context);
                      }else{
                        await cubit.verification(context,email: email);
                      }
                    },
                    width: double.infinity,
                    height: 50.h,
                  ),
                ],
              );
            }else{
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
