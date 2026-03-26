import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/visa_booking_cubit/cubit.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_visa_confirm_data/best_visa_confirm_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../generated/l10n.dart';

import '../../controller/visa_cubit/cubit.dart';

class BestVisaFormFourScreen extends StatefulWidget {
  var selectedCountries;
  BestVisaFormFourScreen(this.selectedCountries);

  @override
  State<BestVisaFormFourScreen> createState() => _BestVisaFormFourScreenState();
}

class _BestVisaFormFourScreenState extends State<BestVisaFormFourScreen> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => VisaBookingCubit(),),

      BlocProvider(create: (context) => VisaCubit(),),
      BlocProvider(create: (context) => CountryAndCityCubit()..getCountry(),),
    ],child: BlocConsumer<CountryAndCityCubit, CountryAndCityState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<VisaBookingCubit, VisaBookingState>(
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
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(S.of(context)!.expensesSponsorData,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                                textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                              ),
                              const SizedBox(height: 10,),
                              Text(S.of(context)!.pleaseEnterCorrectInformationForSponsorData,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:
                                Color(0xff333333)
                                  // const Color(0xff00A6E7)
                                ),
                                textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                              ),
                              const SizedBox(height: 30,),
                              Text(S.of(context)!.fromTheOwnerOfTheAccount, style: Theme.of(context).textTheme.bodyMedium,),
                              const SizedBox(height: 20,),
                              buildTextField(S.of(context)!.ownerOfTheAccountStatement, cubit.ownerOfTheAccountStatementController, validator: "ادخل من صاحب كشف الحساب والتعريف بالمصاريف"),
                              const SizedBox(height: 20,),
                            ],
                          ),
                          ),
                           ButtonId(onPressed: ()async{
                            await cubit.getImage(
                                context,
                                image1: cubit.attachmentAccoutStatementPathImage,
                                image2: cubit.XImageFileAccoutStatementPath,
                                list2: cubit.listXAccoutStatementPathImage,
                                one: false,
                                list: cubit.listAccoutStatementPathImage);
                          }, title: S.of(context)!.accountStatement),
                           const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.listAccoutStatementPathImage.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                                  itemBuilder: (c, i) {
                                    return buildCustomContainer(
                                        file: cubit.listAccoutStatementPathImage[i]['view']);
                                  },
                                ),
                                const SizedBox(height: 20,),
                                Text(S.of(context)!.attachAAccountStatement, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          ButtonId(onPressed: ()async{
                            await cubit.getImage(
                                context,
                                image1: cubit.attachmentSalaryImagePathImage,
                                image2: cubit.XImageFileSalaryImagePath,
                                list2: cubit.listXSalaryImagePathImage,
                                one: false,
                                list: cubit.listSalaryImagePathImage);
                          }, title: S.of(context)!.salaryImage),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.listSalaryImagePathImage.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                                  itemBuilder: (c, i) {
                                    return buildCustomContainer(
                                        file: cubit.listSalaryImagePathImage[i]['view']);
                                  },
                                ),
                                const SizedBox(height: 20,),
                                Text(S.of(context)!.attachASalary, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DefaultCustomButton(title: S.of(context)!.submitNow, onPressed: ()async {


                              navigateTo(
                                  context: context,
                                  screen: BestVisaConfirmDataScreen(widget.selectedCountries)
                              );
                            },),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            );
          },
        );
      },
    ),
    );
  }
}
