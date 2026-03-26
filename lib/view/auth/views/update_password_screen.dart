import 'package:xvisa/controller/login_cubit/cubit.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/auth/views/login_screen.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/view/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if(state is UpdatePasswordSuccessStates){
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => PopScope(
                  canPop: false,
                  child: CustomDialog(
                    title: S.of(context)!.changePasswordSuccess,
                    subtitle: S.of(context)!.success,
                    labelText: S.of(context)!.backToHomepage,
                    color: AppColors.redAppColor,
                    onTap: () {
                      finishNavigate(context: context, screen: LoginScreen(fromSplash: true));
                    },
                  ),
                ),
              );
            }
            if(state is UpdatePasswordErrorStates){
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
            if(state is UpdatePasswordLoadingStates){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is! UpdatePasswordLoadingStates){
             return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 30.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                      children: [
                        Text(
                          S.of(context)!.updatePassword,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.black,
                            fontSize: 28.sp,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          S.of(context)!.youCanNowUpdateYourPassword,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.greySearchText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: cubit.updatePasswordFormKey,
                    child: Column(
                      children: [
                        PrimaryTextField(
                          hintColor: Colors.black,
                          controller: cubit.passwordUpdatePasswordEditingController,
                          hint: S.of(context)!.newPassword,
                          isObscureText: true,
                        ),
                        PrimaryTextField(
                          hintColor: Colors.black,
                          controller: cubit.passwordConfirmUpdatePasswordEditingController,
                          isObscureText: true,
                          hint: S.of(context)!.enterPassword,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: S.of(context)!.updatePassword,
                      borderRadius: BorderRadius.circular(16.sp),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await cubit.updatePassword(context);
                      },
                      width: double.infinity,
                      height: 50.h,
                    ),
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
