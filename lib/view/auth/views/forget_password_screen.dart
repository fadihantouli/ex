import 'package:xvisa/controller/login_cubit/cubit.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/auth/views/verification_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if(state is ForgetPasswordSuccessStates){
              navigateTo(
                context: context,
                screen: VerificationScreen(email: AuthCubit.get(context).emailForgetPasswordEditingController.text)
              );
            }
            if(state is ForgetPasswordErrorStates){
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
            final cubit = AuthCubit.get(context);
            if(state is ForgetPasswordLoadingStates){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is! ForgetPasswordLoadingStates){
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
                          S.of(context)!.forgotPassword,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.black,
                            fontSize: 28.sp,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          S.of(context)!.enterInformations,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.greySearchText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: cubit.forgetPasswordFormKey,
                    child: PrimaryTextField(
                      hintColor: Colors.black,
                      controller: cubit.emailForgetPasswordEditingController,
                      hint: S.of(context)!.email,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     DefaultTextButton(
                  //       onPressed: () {},
                  //       text: AppStrings.tryAnotherWay,
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                      top: 30.h,
                    ),
                    child: CustomActionButton(
                      text: S.of(context)!.send,
                      borderRadius: BorderRadius.circular(16.r),
                      backGroundColor: AppColors.textAndBackgroundColorButton,
                      onTap: () async {
                        await cubit.forget(context);
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
