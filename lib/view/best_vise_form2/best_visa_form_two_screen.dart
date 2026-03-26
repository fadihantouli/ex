import 'package:xvisa/controller/visa_booking_cubit/cubit.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_visa_form3/best_visa_form_three_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class BestVisaFormTwoScreen extends StatefulWidget {
  const BestVisaFormTwoScreen({super.key});

  @override
  State<BestVisaFormTwoScreen> createState() => _BestVisaFormTwoScreenState();
}

class _BestVisaFormTwoScreenState extends State<BestVisaFormTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => VisaBookingCubit(),
      child: BlocConsumer<VisaBookingCubit, VisaBookingState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = VisaBookingCubit.get(context);
          return defaultScaffold(
              context: context,
              body: Directionality(
                textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,
                child: SingleChildScrollView(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                      children: [
                        Text(S.of(context)!.passengerInformation,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                          textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                        ),
                        const SizedBox(height: 10,),
                        Text(S.of(context)!.pleaseEnterCorrectInformationForAllPassengers,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:
                          Color(0xff333333)
                          // const Color(0xff00A6E7)
                          ),
                          textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                        ),
                        const SizedBox(height: 30,),
                        Text(S.of(context)!.haveYouEverObtainedAVisaToAmericaBefore, style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 20,),
                        buildDropdownButton(
                            onChange: (value) {
                              setState(() {
                                if(value == S.of(context)!.yes){
                                  cubit.selectHaveVisaBefore = true;
                                }else if(value == S.of(context)!.no){
                                  cubit.selectHaveVisaBefore = false;
                                }

                              });
                            },
                            hint: S.of(context)!.haveYouEverObtainedAVisaToAmericaBefore,
                            item: [S.of(context)!.yes, S.of(context)!.no].map((value) {
                              return DropdownMenuItem(
                                value: value.toString(),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)
                                          .withOpacity(0.74)),
                                ),
                              );
                            }).toList(),
                            value: cubit.selectHaveVisaBefore == true ? S.of(context)!.yes : cubit.selectHaveVisaBefore == false ? S.of(context)!.no : null),
                       const SizedBox(height: 20,),
                   ButtonId(onPressed: ()async{
                          await cubit.getImage(
                              context,
                              image1: cubit.attachmentTravelAmericaBeforePathImage,
                              image2: cubit.XImageFileTravelAmericaBeforePath,
                              list2: cubit.listXTravelAmericaBeforePathImage,
                              one: false,
                              list: cubit.listTravelAmericaBeforePathImage);
                        }, title: S.of(context)!.countryVisaImage),
                         const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.listTravelAmericaBeforePathImage.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                                itemBuilder: (c, i) {
                                  return buildCustomContainer(
                                      file: cubit.listTravelAmericaBeforePathImage[i]['view']);
                                },
                              ),
                              const SizedBox(height: 20,),
                              Text(S.of(context)!.attachAPersonalPhoto, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text(S.of(context)!.haveYouEverTraveledToAmerica, style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 20,),
                        buildDropdownButton(
                            onChange: (value) {
                              setState(() {
                                if(value == S.of(context)!.yes){
                                  cubit.selectTravelAmericaBefore = true;
                                }else if(value == S.of(context)!.no){
                                  cubit.selectTravelAmericaBefore = false;
                                }
                              });
                            },
                            hint: S.of(context)!.haveYouEverTraveledToAmerica,
                            item: [S.of(context)!.yes, S.of(context)!.no].map((value) {
                              return DropdownMenuItem(
                                value: value.toString(),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)
                                          .withOpacity(0.74)),
                                ),
                              );
                            }).toList(),
                            value: cubit.selectTravelAmericaBefore == true ? S.of(context)!.yes : cubit.selectTravelAmericaBefore == false ? S.of(context)!.no : null),
                          const SizedBox(height: 20,),
                        buildTextFieldDate(labelText: cubit.selectedDate??S.of(context)!.date, onTap: ()async{
                          await cubit.selectDate(context, selectedDate: cubit.selectedDate, selectedDateUnder: cubit.selectedDateUnder);
                        }, ),
                         const SizedBox(height: 20,),
                         buildTextField(S.of(context)!.periodStay, cubit.periodStayController, validator: "ادخل مده الاقامه"),
                         const SizedBox(height: 20,),
                         Text(S.of(context)!.didYouGetADriverLicense, style: Theme.of(context).textTheme.bodyMedium,),
                         const SizedBox(height: 20,),
                         buildDropdownButton(
                            onChange: (value) {
                              setState(() {
                                if(value == S.of(context)!.yes){
                                  cubit.selectHaveDriverLicence = true;
                                }else if(value == S.of(context)!.no){
                                  cubit.selectHaveDriverLicence = false;
                                }
                              });
                            },
                            hint: S.of(context)!.didYouGetADriverLicense,
                            item: [S.of(context)!.yes, "No"].map((value) {
                              return DropdownMenuItem(
                                value: value.toString(),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)
                                          .withOpacity(0.74)),
                                ),
                              );
                            }).toList(),
                            value: cubit.selectHaveDriverLicence == true ? S.of(context)!.yes : cubit.selectHaveDriverLicence == false ? S.of(context)!.no : null),
                        const SizedBox(height: 30,),
                        DefaultCustomButton(title: S.of(context)!.nextStep, onPressed: ()async {
                          navigateTo(
                            context: context,
                            screen: const BestVisaFormThreeScreen()
                          );
                        },)
                      ],
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
