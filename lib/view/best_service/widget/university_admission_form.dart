import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class UniversityAdmissionForm extends StatefulWidget {
  const UniversityAdmissionForm({super.key});

  @override
  State<UniversityAdmissionForm> createState() => _UniversityAdmissionFormState();
}

class _UniversityAdmissionFormState extends State<UniversityAdmissionForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
      },
        builder: (context, state) {
        var cubit = ServiceCubit.get(context);
          return Column(
            crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
            children: [
              Text(S.of(context)!.chooseTheCountryYouWantToStudy, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              BlocConsumer<CountryAndCityCubit, CountryAndCityState>(
                  listener: (context, state) {},
                builder: (context, state) {
                  return buildDropdownButton(
                      onChange: (value) {
                        setState(() {
                          cubit.selectCountry = value;
                        });
                      },
                      hint: S.of(context)!.country,
                      item: CountryAndCityCubit.get(context).countries.map((value) {
                        return DropdownMenuItem(
                          value: value['id'].toString(),
                          child: Text(
                            value['name']['ar'],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000)
                                    .withOpacity(0.74)),
                          ),
                        );
                      }).toList(),
                      value: cubit.selectCountry);
                },
              ),
              const SizedBox(height: 15,),
              Text(S.of(context)!.nationality, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildTextField(S.of(context)!.nationality, cubit.nationalityController),
              const SizedBox(height: 15,),
              Text(S.of(context)!.howtoPayTuitionFees, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildDropdownButton(
                  onChange: (value) {
                    setState(() {
                      cubit.selectUniversityPaymentWay = value;
                    });
                  },
                  hint: S.of(context)!.howtoPayTuitionFees,
                  item: [
                    S.of(context)!.onThePrivateAccount,
                    S.of(context)!.governmentMissionOrAtTheExpenseOfTheEmployer
                  ].map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000).withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  value: cubit.selectUniversityPaymentWay),
              const SizedBox(height: 15,),
              Text(S.of(context)!.requiredSpecialization, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildTextField(S.of(context)!.requiredSpecialization, cubit.requiredSpecializationController),
              const SizedBox(height: 15,),
              Text(S.of(context)!.currentQualification, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildDropdownButton(
                  onChange: (value) {
                    setState(() {
                      cubit.selectYourEducation = value;
                    });
                  },
                  hint: S.of(context)!.qualification,
                  item: [S.of(context)!.master, S.of(context)!.bachelor, S.of(context)!.secondary].map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000).withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  value: cubit.selectYourEducation),
              const SizedBox(height: 15,),
              Text(S.of(context)!.whatIsYourAcademicAverage , style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildDropdownButton(
                  onChange: (value) {
                    setState(() {
                      cubit.selectYourLastEducation = value;
                    });
                  },
                  hint: S.of(context)!.academicAverage,
                  item: [
                    S.of(context)!.excellent,
                    S.of(context)!.veryGood,
                    S.of(context)!.good,
                    S.of(context)!.acceptable,
                    S.of(context)!.weak
                  ].map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000).withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  value: cubit.selectYourLastEducation),
              const SizedBox(height: 15,),
              Text(S.of(context)!.doYouHaveATOEFLOrIELTSCertificate, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildDropdownButton(
                  onChange: (value) {
                    setState(() {
                      cubit.selectIELTESCertificate = value;
                    });
                  },
                  hint: S.of(context)!.doYouHaveATOEFLOrIELTSCertificate,
                  item: ["TOEFL - توفل","IELTS - ايليتس", S.of(context)!.iDonotHaveACertificate].map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000).withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  value: cubit.selectIELTESCertificate),
              const SizedBox(height: 15,),
              Text(S.of(context)!.whatIsYourPreferredCallTime, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildDropdownButton(
                  onChange: (value) {
                    setState(() {
                      cubit.selectPreferredCallTime = value;
                    });
                  },
                  hint: S.of(context)!.whatIsYourPreferredCallTime,
                  item: ["من 6 ${S.of(context)!.pm} ال 9 ${S.of(context)!.pm}","من 3 ${S.of(context)!.pm} الي 6 ${S.of(context)!.pm}", "من 10 ${S.of(context)!.am} الي 12 ${S.of(context)!.pm}"].map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000).withOpacity(0.74)),
                      ),
                    );
                  }).toList(),
                  value: cubit.selectPreferredCallTime),
              const SizedBox(height: 15,),
              Text(S.of(context)!.providerName, style: Theme.of(context).textTheme.bodyMedium,),
              const SizedBox(height: 10,),
              buildTextField(CacheHelper.getString("language") == "ar" ?"مثلا : نايف" : "ex : Nayf", cubit.yourNameController),
              const SizedBox(height: 15,),
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
