import 'package:xvisa/controller/visa_booking_cubit/cubit.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_vise_form2/best_visa_form_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class BestVisaFormOneScreen extends StatefulWidget {
  const BestVisaFormOneScreen({super.key});

  @override
  State<BestVisaFormOneScreen> createState() => _BestVisaFormOneScreenState();
}

class _BestVisaFormOneScreenState extends State<BestVisaFormOneScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => VisaBookingCubit(),
      child: BlocConsumer<VisaBookingCubit, VisaBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = VisaBookingCubit.get(context);
          return defaultScaffold(
              context: context,
              body: Directionality(
                textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                            children: [
                              Text(S.of(context)!.pleaseFillDocument,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                                textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                              ),
                              const SizedBox(height: 10,),
                              Text(S.of(context)!.personalInfo,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                   color:  Color(0xff333333)
                                    // color: const Color(0xff00A6E7)
                                     ),
                                textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                              ),
                              const SizedBox(height: 15,),
                              Text(S.of(context)!.firstName, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.firstName, cubit.firstNameController, validator: S.of(context)!.firstName),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.lastName, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.lastName, cubit.lastNameController, validator: S.of(context)!.lastName),
                             Text(S.of(context)!.email, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.email, cubit.emailController, validator: S.of(context)!.lastName),
                               Text(S.of(context)!.phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.phoneNumber, cubit.phoneController, validator: S.of(context)!.lastName),
                              const SizedBox(height: 30,),
                              Text(S.of(context)!.motherData,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Color(0xff333333)
                                    // color: const Color(0xff00A6E7)
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.firstMotherName, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.firstMotherName, cubit.firstMotherNameController, validator: S.of(context)!.firstMotherName),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.lastMotherName, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.lastMotherName, cubit.lastMotherNameController, validator: S.of(context)!.lastMotherName),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.motherNationality, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.motherNationality, cubit.nationalityMotherController, validator: S.of(context)!.motherNationality),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.attachAPhotoOfPasport, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),),
                            ],
                          ),
                        ),
                      ),
                       ButtonId(onPressed: ()async{
                        await cubit.getImage(
                          context,
                            image1: cubit.attachmentPassportImage,
                            image2: cubit.XImageFileAttachmentPassport,
                            list2: cubit.listXAttachmentPassportImage,
                            one: false,
                            list: cubit.listAttachmentPassportImage);
                      }, title: S.of(context)!.addAttachment),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.listAttachmentPassportImage.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                              itemBuilder: (c, i) {
                                return buildCustomContainer(
                                    file: cubit.listAttachmentPassportImage[i]['view']);
                              },
                            ),
                            const SizedBox(height: 20,),
                            Text(S.of(context)!.attachAPersonalPhoto, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      ButtonId(onPressed: ()async{
                        await cubit.getImage(
                            context,
                            image1: cubit.attachmentPersonalImage,
                            image2: cubit.XImageFileAttachmentPersonal,
                            list2: cubit.listXAttachmentPersonalImage,
                            one: false,
                            list: cubit.listAttachmentPersonalImage);
                      }, title: S.of(context)!.addAttachment),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.listAttachmentPersonalImage.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                              itemBuilder: (c, i) {
                                return buildCustomContainer(
                                    file: cubit.listAttachmentPersonalImage[i]['view']);
                              },
                            ),
                            const SizedBox(height: 20,),

                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:  DefaultCustomButton(title: S.of(context)!.nextStep, onPressed: ()async {
                          navigateTo(
                              context: context,
                              screen: const BestVisaFormTwoScreen()
                          );
                      },),
                      ),
                      const SizedBox(height: 15,)
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
