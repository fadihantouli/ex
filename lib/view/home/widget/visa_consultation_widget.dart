import 'package:xvisa/controller/visatype_visaconsultation/cubit.dart';
import 'package:xvisa/controller/visatype_visaconsultation/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xvisa/view/login_dialog.dart';
import '../../../generated/l10n.dart';

class VisaConsultationWidget extends StatefulWidget {
  @override
  State<VisaConsultationWidget> createState() => _VisaConsultationWidgetState();
}

class _VisaConsultationWidgetState extends State<VisaConsultationWidget> {
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  String? selectVisaType;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisaTypeAndConsultationCubit, VisaTypeAndConsultationState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                S.of(context)!.freeVisaConsultation,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color:   Colors.black),
              ),
              const CustomSizedBox(),
              defaultTextFormField(
                  controller: nameController,
                  hintText: S.of(context)!.yourName
              ),
              const SizedBox(width: 5,),
              defaultTextFormField(
                  controller: emailController,
                  hintText: S.of(context)!.email
              ),
              defaultTextFormField(
                  controller: phoneController,
                  hintText: S.of(context)!.phoneNumber
              ),
              const SizedBox(width: 5,),
              defaultDropdownField(
                  value: selectVisaType,
                  title: S.of(context)!.selectVisaType,
                  items: VisaTypeAndConsultationCubit.get(context).visaType.map((value) {
                    return DropdownMenuItem(
                      value: value['id'].toString(),
                      child: Text(
                        CacheHelper.getString("language") == "en" ?
                        value['title']['en'].toString():value['title']['ar'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:const Color(0xff000000)
                                .withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value){
                    setState(() {
                      selectVisaType =value;
                    });
                  }
              ),
              const CustomSizedBox(),
              if(state is PostVisaConsultationLoadingState)const Center(
                child: CircularProgressIndicator(color: AppColors.textAndBackgroundColorButton,),
              ),
              if(state is! PostVisaConsultationLoadingState)CustomActionButton(
                onTap: (){
              if(checkIfHaveToken())
                VisaTypeAndConsultationCubit.get(context).postVisaConsultation(
                    emailController.text,
                    nameController.text,
                    phoneController.text,
                    selectVisaType.toString(),
                    context
                );
              else

                showLoginDialog(context);
                },
                text: S.of(context)!.sendNow,
                borderRadius: BorderRadius.circular(12.r),
                backGroundColor: AppColors.textAndBackgroundColorButton,
                height: 49.h,
                width: double.infinity,
              ),
              const CustomSizedBox(),
              Text(S.of(context)!.copyRight,
                style: TextStyle(
                    color: Color(0xff8B8B8B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
              const CustomSizedBox(),
            ],
          ),
        );
      },
    );
  }
}
bool checkIfHaveToken(){
  String token=  CacheHelper.getString("token");
  return token.isNotEmpty;
}