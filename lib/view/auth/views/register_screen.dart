import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:xvisa/controller/login_cubit/cubit.dart';
import 'package:xvisa/controller/login_cubit/state.dart';
import 'package:xvisa/utills/assets.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/utills/validate.dart';
import 'package:xvisa/view/auth/views/login_screen.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/view/drawer_screens/privacy_screen.dart';

import 'create_account_controler.dart';



class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    CreateAccountControler controller = Get.put(CreateAccountControler());
TextEditingController phoneControler=TextEditingController();
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.registerBackground),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if(state is RegisterSuccessStates){
                  finishNavigate(
                    context: context,
                    screen: LoginScreen(fromSplash: true,)
                  );
                }
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                if(state is RegisterLoadingStates){
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  );
                }else if(state is! RegisterLoadingStates){
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: cubit.registerFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 75.h),
                          Image.asset('assets/images/logo.png'),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Text(
                                S.of(context)!.registerNow,
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          // PrimaryTextField(
                          //   controller: cubit.nameRegisterEditingController,
                          //   validator: (value) => AppValidator.validateName(value),
                          //   hint: S.of(context)!.yourName,
                          //   padding: EdgeInsets.only(bottom: 20.h),
                          //   textColor: AppColors.white,
                          //   suffix: const Icon(
                          //     CupertinoIcons.person,
                          //     color: AppColors.textAndBackgroundColorButton,
                          //   ),
                          // ),
                          // PrimaryTextField(
                          //   controller: cubit.nameArRegisterEditingController,
                          //   validator: (value) => AppValidator.validateName(value),
                          //   hint: S.of(context)!.yourNameAr,
                          //   padding: EdgeInsets.only(bottom: 20.h),
                          //   textColor: AppColors.white,
                          //   suffix: const Icon(
                          //     CupertinoIcons.person,
                          //     color: AppColors.textAndBackgroundColorButton,
                          //   ),
                          // ),
                          PrimaryTextField(
                            controller: cubit.nameEnRegisterEditingController,
                            validator: (value) => AppValidator.validateName(value),
                            hint: S.of(context)!.yourNameEn,
                            padding: EdgeInsets.only(bottom: 20.h),
                            textColor: AppColors.white,
                            suffix: const Icon(
                              CupertinoIcons.person,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                          ),
                          PrimaryTextField(
                            controller: cubit.emailRegisterEditingController,
                            validator: (value) => AppValidator.validateEmail(value),
                            hint: 'youremail@mail.com',
                            padding: EdgeInsets.only(bottom: 20.h),
                            textColor: AppColors.white,
                            inputType: TextInputType.emailAddress,
                            suffix: const Icon(
                              Icons.mail_outline_sharp,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                          ),
                          PrimaryTextField(
                            controller: cubit.passwordRegisterEditingController,
                            validator: (value) => AppValidator.validatePassword(value),
                            hint: S.of(context)!.password,
                            padding: EdgeInsets.zero,
                            textColor: AppColors.white,
                            suffix: const Icon(
                              Icons.mail_outline_sharp,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                            isObscureText: true,
                          ),
                          SizedBox(height: 20.h,),
                          Text(S.of(context).phone_required,style: TextStyle(color: Colors.white,fontSize: 13),),
                          SizedBox(height: 10,),

                          // PrimaryTextField(
                          //   controller: cubit.phoneRegisterEditingController,
                          //   validator: (value) => AppValidator.validatePhone(value),
                          //   hint: S.of(context)!.phoneNumber,
                          //   inputType: TextInputType.number,
                          //   padding: EdgeInsets.zero,
                          //   prefix: Text("966  ", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          //     color: Colors.white,
                          //   ),),
                          //   textColor: AppColors.white,
                          //   suffix: const Icon(
                          //     Icons.mail_outline_sharp,
                          //     color: AppColors.textAndBackgroundColorButton,
                          //   ),
                          //   isObscureText: false,
                          // ),
                          Row(
                            children: [
                              /// 👇 لايبل لاختيار الدولة
                              Obx(() => InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      controller.selectedCountryCode.value = "${country.phoneCode}";
                                      controller.selectedFlag.value = country.flagEmoji;
                                      cubit.phoneRegisterEditingController.text=controller.selectedCountryCode.value;
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${controller.selectedFlag.value}  ${controller.selectedCountryCode.value}",
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      const Icon(Icons.arrow_drop_down, color: Colors.white),
                                    ],
                                  ),
                                ),
                              )),

                              const SizedBox(width: 12),

                              Expanded(
                                child: TextField(
                                  controller: phoneControler,
                                  keyboardType: TextInputType.number,
                                  maxLength: 9,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    border:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(

                                          color: Colors.white),
                                    ),
                                    hintText: S.of(context).phoneNumber,
                                    counterText: '',
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),
                          CustomActionButton(
                            onTap: () async {
                              cubit.phoneRegisterEditingController.text=controller.selectedCountryCode.value+phoneControler.text;
                              await cubit.register(context);
                            },
                            text: S.of(context)!.signUp,
                            borderRadius: BorderRadius.circular(12.r),
                            backGroundColor: AppColors.textAndBackgroundColorButton,
                            height: 60.h,
                            width: double.infinity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context)!.ifYouHaveAnAccount,
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  finishNavigate(
                                    context: context,
                                    screen: LoginScreen(fromSplash: true)
                                  );
                                },
                                  textColor: Colors.white,
                                text: S.of(context)!.signinHere
                              ),
                            ],
                          ),
                          // Text(
                          //   S.of(context)!.byClickingSingUp,
                          //   textAlign: TextAlign.center,
                          //   style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextButton(
                                onPressed: () {

                                },
                                textColor: Colors.white,
                                text: S.of(context)!.terms,
                              ),
                              Text(
                                S.of(context)!.and,
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                              ),
                              DefaultTextButton(
                                onPressed: () {
                                  navigateTo(
                                    context: context,
                                    screen: PrivacyScreen()
                                  );
                                },
                                textColor: Colors.white,
                                text: S.of(context)!.privacyPolicy,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }else{
                  return const Center();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
