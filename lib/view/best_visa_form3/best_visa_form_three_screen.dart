import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/visa_booking_cubit/cubit.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_visa_confirm_data/best_visa_confirm_data_screen.dart';
import 'package:xvisa/view/best_visa_form4/best_visa_form_four_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../generated/l10n.dart';

class BestVisaFormThreeScreen extends StatefulWidget {
  const BestVisaFormThreeScreen({super.key});

  @override
  State<BestVisaFormThreeScreen> createState() => _BestVisaFormThreeScreenState();
}

class _BestVisaFormThreeScreenState extends State<BestVisaFormThreeScreen> {
  List<Map<String, String>> selectedCountries = [];
  final List<String> availableCountries = [
    'Egypt',
    'Jordan',
    'Saudi Arabia',
    'UAE',
    'Kuwait',
    'Qatar',
    'Bahrain',
    'Oman',
    'Lebanon',
    'Syria',
    'Iraq'
  ];

  // قائمة لتخزين الدول والسنة
  List<Map<String, String>> countriesList = [];

  // إضافة عنصر جديد عند الضغط على زر "إضافة دولة"
  void addCountry() {
    setState(() {
      countriesList.add({'country': '', 'year': ''});
    });
  }

  // حذف عنصر من القائمة
  void deleteCountry(int index) {
    setState(() {
      countriesList.removeAt(index);
    });
  }

  // إرسال البيانات إلى API
  void submitData() {
    selectedCountries = countriesList
        .where((element) => element['country']!.isNotEmpty && element['year']!.isNotEmpty)
        .toList();
    Fluttertoast.showToast(
        msg: S.of(context)!.saveSuccessfully,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    print("Selected Countries: $selectedCountries");

    // هنا يمكنك إرسال البيانات إلى الـ API
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => VisaBookingCubit(),),
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
                            // const Color(0xff00A6E7)
                            Color(0xff333333)
                            ),
                            textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                          ),
                          const SizedBox(height: 30,),
                          Text(S.of(context)!.haveYouEverHadYourUSVisaDeniedOrCancelled, style: Theme.of(context).textTheme.bodyMedium,),
                          const SizedBox(height: 20,),
                          buildDropdownButton(
                              onChange: (value) {
                                setState(() {
                                  if(value == S.of(context)!.yes){
                                    cubit.selectDeniedOrCancelled = true;
                                  }else if(value == S.of(context)!.no){
                                    cubit.selectDeniedOrCancelled = false;
                                  }
                                });
                              },
                              hint: S.of(context)!.deniedOrCancelled,
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
                              value: cubit.selectDeniedOrCancelled == true ?S.of(context)!.yes : cubit.selectDeniedOrCancelled == false ? S.of(context)!.no : null),
                          const SizedBox(height: 20,),
                           Text(S.of(context)!.explain, style: Theme.of(context).textTheme.bodyMedium,),
                          buildTextField(S.of(context)!.explain, cubit.refusedExplainController, validator: S.of(context)!.enterReason),
                           const SizedBox(height: 20,),
                           Container(width: MediaQuery.sizeOf(context).width*.9,
                             child: ListView.separated(

                              separatorBuilder: (context, index) => const SizedBox(height: 20,),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: countriesList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                             // قائمة منسدلة لاختيار الدولة
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        value: countriesList[index]['country']!.isNotEmpty
                                            ? countriesList[index]['country']
                                            : null,
                                        isExpanded: true, // ✅ مهم جداً حتى ياخذ المساحة
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        ),
                                        hint: Text(
                                          S.of(context)!.selectCountry,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        items: CountryAndCityCubit.get(context).countries.map((country) {
                                          return DropdownMenuItem<String>(
                                            value: country['name']['ar'],
                                            child: Text(
                                              country['name']['ar'],
                                              style: TextStyle(color: Colors.black),
                                              overflow: TextOverflow.ellipsis, // لو النص طويل
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            countriesList[index]['country'] = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: TextFormField(
                                          initialValue: countriesList[index]['year'],
                                          decoration: InputDecoration(
                                            labelText: S.of(context)!.year,
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                          ),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            countriesList[index]['year'] = value;
                                          },
                                        ),
                                      ),
                                    ),


                                    IconButton(
                                        onPressed: () => deleteCountry(index),
                                        icon: Icon(Icons.delete, color: Colors.red),
                                                                           ),

                                  ],
                                );
                              },
                                                       ),
                           ),
                           const SizedBox(height: 20,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultCustomButton(title: S.of(context)!.addCountry, onPressed: addCountry, containerWidth: MediaQuery.sizeOf(context).width  /2.5,),
                              if(countriesList.isNotEmpty) DefaultCustomButton(title: S.of(context)!.save, color : Colors.red, onPressed: submitData, containerWidth: MediaQuery.sizeOf(context).width /2.5,),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text(S.of(context)!.maritalStatus, style: Theme.of(context).textTheme.bodyMedium,),
                          const SizedBox(height: 20,),
                          buildDropdownButton(
                              onChange: (value) {
                                setState(() {
                                  cubit.selectMaritalStatus = value;
                                });
                              },
                              hint: S.of(context)!.maritalStatus,
                              item: [S.of(context)!.singleOr, S.of(context)!.marriedOr].map((value) {
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
                              value: cubit.selectMaritalStatus),
                          const SizedBox(height: 20,),
                          Text(S.of(context)!.relativesLivingInCountry, style: Theme.of(context).textTheme.bodyMedium,),
                          const SizedBox(height: 20,),
                          buildDropdownButton(
                              onChange: (value) {
                                setState(() {
                                  if(value == S.of(context)!.yes){
                                    cubit.selectRelativesLivingCountry = true;
                                  }else if(value == S.of(context)!.no){
                                    cubit.selectRelativesLivingCountry = false;
                                  }
                                });
                              },
                              hint: S.of(context)!.relatives,
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
                              value: cubit.selectRelativesLivingCountry == true ?  S.of(context)!.yes: cubit.selectRelativesLivingCountry == false ? S.of(context)!.no : null),
                          const SizedBox(height: 20,),
                          buildDropdownButton(
                              onChange: (value) {
                                setState(() {
                                  cubit.selectRelativesLivingCountryPebole = value;
                                });
                              },
                              hint: S.of(context)!.relatives,
                              item: [S.of(context)!.father, S.of(context)!.mother, S.of(context)!.brother, S.of(context)!.sister, S.of(context)!.son, S.of(context)!.daughter, S.of(context)!.marriedOr].map((value) {
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
                              value: cubit.selectRelativesLivingCountryPebole
                          ),
                          const SizedBox(height: 30,),
                          DefaultCustomButton(title: S.of(context)!.nextStep, onPressed: ()async {
                            navigateTo(
                                context: context,
                                screen: BestVisaFormFourScreen(selectedCountries)
                            );
                          },)
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
