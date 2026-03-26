import 'package:xvisa/controller/contactus_cubit/cubit.dart';
import 'package:xvisa/controller/contactus_cubit/state.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';

class SendMessageScreen extends StatelessWidget {
  TextEditingController fullNameEditingController = TextEditingController();
  TextEditingController messageEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ContactUsCubit(),
        child: BlocConsumer<ContactUsCubit, ContactUsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ContactUsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  S.of(context)!.sendMessage,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1D1B23),
                      fontSize: 16),
                ),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey,
                        child: Container(
                          height: 76,
                          width: 76,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xff61461B), shape: BoxShape.circle),
                          child: Text(
                            S.of(context)!.me,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PrimaryTextField(
                        controller: fullNameEditingController,
                        hint: S.of(context)!.fullName,
                        hintColor: Colors.black,
                        //validator: (value) => AppValidator.validateName(value),
                      ),
                      PrimaryTextField(
                        controller: emailEditingController,
                        hint: S.of(context)!.email,
                        inputType: TextInputType.emailAddress,
                        hintColor: Colors.black,
                        //validator: (value) => AppValidator.validateEmail(value),
                      ),
                      PrimaryTextField(
                        controller: phoneEditingController,
                        hint: S.of(context)!.phoneNumber,
                        inputType: TextInputType.emailAddress,
                        hintColor: Colors.black,
                        //validator: (value) => AppValidator.validateEmail(value),
                      ),
                      PrimaryTextField(
                        controller: messageEditingController,
                        hint: S.of(context)!.message,
                        isTextAria: true,
                        hintColor: Colors.black,
                        inputType: TextInputType.emailAddress,
                        //validator: (value) => AppValidator.validateEmail(value),
                      ),
                      if (state is PostContactUsLoadingState)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if (state is! PostContactUsLoadingState)
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                            top: 30.h,
                          ),
                          child: CustomActionButton(
                            text: S.of(context)!.sendMessage,
                            borderRadius: BorderRadius.circular(16.r),
                            backGroundColor: Color(0xff61461B),
                            onTap: () async {
                              cubit.postContactUs(
                                context,
                                  email: emailEditingController.text,
                                  name: fullNameEditingController.text,
                                  phone: phoneEditingController.text,
                                  description: messageEditingController.text);
                            },
                            width: double.infinity,
                            height: 50.h,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
