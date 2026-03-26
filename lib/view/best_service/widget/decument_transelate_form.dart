
import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

class DecumentTranselateForm extends StatefulWidget {
  const DecumentTranselateForm({super.key});

  @override
  State<DecumentTranselateForm> createState() => _DecumentTranselateFormState();
}

class _DecumentTranselateFormState extends State<DecumentTranselateForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Text(S.of(context)!.approximateNumberOfPages, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectApproximateNumberOfPages = value;
                  });
                },
                hint: S.of(context)!.approximateNumberOfPages,
                item: [19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1].map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)
                              .withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectApproximateNumberOfPages),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.attachTheFileToBeTranslated,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: ()async{
                await cubit.getImage(
                    context,
                    image1: cubit.attachmentImage,
                    image2: cubit.XImageFileAttachment,
                    list2: cubit.listXAttachmentImage,
                    one: false,
                    list: cubit.listAttachmentImage);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFFF5F5F5))),
                child: Text(
                  S.of(context)!.selectFile,
                  style: TextStyle(
                      fontFamily: 'HeadlandOne',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)),
                ),
              ),
            ),
            Text(
              S.of(context)!.typeOfContentToTranslate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectContentToBeTranslated = value;
                  });
                },
                hint: S.of(context)!.contentToBeTranslated,
                item: [S.of(context)!.salaryDefinition,
                  S.of(context)!.medicalReport,
                  S.of(context)!.legalDocuments,
                  S.of(context)!.universityResearch,
                  S.of(context)!.officialPapers,
                  S.of(context)!.other].map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000)
                              .withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectContentToBeTranslated),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.providerName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextField(CacheHelper.getString("language") == "ar" ?"مثلا : نايف" : "ex : Nayf", cubit.yourNameController),
            const SizedBox(
              height: 15,
            ),
            Text(S.of(context)!.phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildTextField("**********", cubit.yourPhoneController,isPhone: true, inputType: TextInputType.number),
            const SizedBox(height: 15,),
            Text(S.of(context)!.email, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildTextField("abc@xyz.com", cubit.emailController),
          ],
        );
      },
    );
  }
}
