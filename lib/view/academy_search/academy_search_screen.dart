import 'package:xvisa/controller/academy/academy_cubit/cubit.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/controller/academy_search/cubit.dart';
import 'package:xvisa/controller/academy_search/states.dart';
import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/academy_search/widget/academy_search_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/widgets/no_data.dart';

import '../../widgets/no_internet.dart';

class AcademySearchScreen extends StatefulWidget {
  const AcademySearchScreen({super.key});

  @override
  State<AcademySearchScreen> createState() => _AcademySearchScreenState();
}

class _AcademySearchScreenState extends State<AcademySearchScreen> {
  bool advanced = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AcademySearchCubit(),),
      BlocProvider(create: (context) => CountryAndCityCubit()..getCountry(),),
      BlocProvider(create: (context) => AcademyCubit()..getAcademy(),),
    ], child: BlocConsumer<AcademySearchCubit, AcademySearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<CountryAndCityCubit, CountryAndCityState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AcademySearchCubit.get(context);
            var cubit2 = AcademyCubit.get(context);
           return BlocConsumer<AcademyCubit, AcademyStates>(
             listener: (context, state) {},
             builder: (context, state) {
               return defaultScaffold(
                   context: context,
                   body: SingleChildScrollView(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                       child: Column(
                         crossAxisAlignment: (CacheHelper.getString("LOCALE") == "ar")?CrossAxisAlignment.start:CrossAxisAlignment.end,
                         children: [
                           Container(
                             width: double.infinity,
                             alignment: Alignment.centerRight,
                             child: Text(S.of(context)!.agentOfMost,
                               textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start:TextAlign.end,
                               style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                             ),
                           ),
                           const SizedBox(height: 30,),
                           Text(S.of(context)!.advancedSearch,
                             style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                           ),
                           const SizedBox(height: 10,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(
                                 child: buildDropdownButton(
                                     onChange: (value) {
                                       setState(() {
                                         cubit.selectLocation = value;
                                       });
                                     },
                                     hint: S.of(context)!.location,
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
                                     value: cubit.selectLocation),
                               ),
                               Expanded(
                                 child: buildDropdownButton(
                                     onChange: (value) {
                                       if(value == "1${S.of(context)!.week}"){
                                         setState(() {
                                           cubit.selectStudyWeek = "1";
                                         });
                                       } if(value == "2${S.of(context)!.week}"){
                                         setState(() {
                                           cubit.selectStudyWeek = "2";
                                         });
                                       }

                                     },
                                     hint: S.of(context)!.studyWeeks,
                                     item: ["1${S.of(context)!.week}", "2${S.of(context)!.week}"].map((value) {
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
                                     value:(cubit.selectStudyWeek == "1")?"1${S.of(context)!.week}" : "2${S.of(context)!.week}"
                                 ),
                               ),

                             ],
                           ),
                           const SizedBox(height: 15,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(
                                 child: buildTextFieldDate(labelText: cubit.selectedDate ??S.of(context)!.startDate, onTap: ()async{
                                   await cubit.selectDate(context);
                                 }),
                               ),
                               Expanded(
                                 child: buildDropdownButton(
                                     onChange: (value) {
                                       print(value);
                                       setState(() {
                                         if(value == S.of(context)!.yes){
                                           cubit.selectNeedHouse = true;
                                         }else if(value == S.of(context)!.no){
                                           cubit.selectNeedHouse = false;
                                         }
                                       });
                                     },
                                     hint: S.of(context)!.needAccommodation,
                                     item: [(S.of(context)!.yes), S.of(context)!.no].map((value) {
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
                                     value: cubit.selectNeedHouse == true ? S.of(context)!.yes : cubit.selectNeedHouse == false ? S.of(context)!.no : null),
                               ),
                             ],
                           ),
                           const SizedBox(height: 10,),
                           GestureDetector(
                             onTap: (){
                               setState(() {
                                 advanced = !advanced;
                               });
                             },
                             child: Row(
                               mainAxisAlignment: CacheHelper.getString("language") == "ar" ?MainAxisAlignment.start:MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 Container(
                                   child: Text(S.of(context)!.advancedSearch,
                                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 if(advanced == false) Icon(Icons.keyboard_arrow_up),
                                 if(advanced == true) Icon(Icons.keyboard_arrow_down)
                               ],
                             ),
                           ),
                           const SizedBox(height: 10,),
                           if(advanced == true) Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(
                                 child: buildDropdownButton(
                                     onChange: (value) {
                                       if(value == S.of(context)!.yes){
                                         setState(() {
                                           cubit.selectReception = true;
                                         });}else{
                                         setState(() {
                                           cubit.selectReception = false;
                                         });
                                       }
                                     },
                                     hint: S.of(context)!.service,
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
                                     value: cubit.selectReception == true ? S.of(context)!.yes : cubit.selectReception == false ? S.of(context)!.no : null),
                               ),
                               Expanded(
                                 child: buildDropdownButton(
                                     onChange: (value) {
                                       if(value == S.of(context)!.yes){
                                         setState(() {
                                           cubit.selectInsurance = true;
                                         });}else{
                                         setState(() {
                                           cubit.selectInsurance = false;
                                         });
                                       }
                                     },
                                     hint: S.of(context)!.service,
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
                                     value: cubit.selectInsurance == true ? S.of(context)!.yes : cubit.selectInsurance == false ? S.of(context)!.no : null),
                               ),
                             ],
                           ),
                           const SizedBox(height: 20,),
                           DefaultCustomButton(title: S.of(context)!.search,
                             containerWidth: 95,
                             onPressed: ()async {
                               print("cubit.selectStudyWeek --> ${cubit.selectStudyWeek}");
                               cubit2.getAcademy(
                                   start_date: (cubit.selectedDate != null)?cubit.selectedDate.toString() : null,
                                   country_id:(cubit.selectLocation != null)? cubit.selectLocation.toString() : null,
                                   housing:(cubit.selectNeedHouse != null)? cubit.selectNeedHouse.toString() : null,
                                   study_weeks:(cubit.selectStudyWeek != null)? cubit.selectStudyWeek.toString() : null,
                                   insurance:(cubit.selectInsurance != null)? cubit.selectInsurance : null,
                                   reception: (cubit.selectReception != null)?cubit.selectReception : null
                               );
                             },),
                           const SizedBox(height: 20,),
                           if(state is GetAcademyLoadingStates ) Center(child: CircularProgressIndicator()),
                           if(state is GetAcademyErrorStates) Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 NoInternetConnectionWidget(context)

                               ],
                             ),
                           ),
                           if(state is GetAcademySuccessStates && cubit2.academy.isEmpty )Center(child: NoDataWidget(context)),
                           if(state is GetAcademySuccessStates && cubit2.academy.isNotEmpty ) AcademySearchListviewWidget(academys: cubit2.academy,images: cubit2.images,),
                           const SizedBox(height: 30,),
                           // DefaultCustomButton(title: S.of(context)!.submitNow ,
                           //   onPressed: ()async {
                           //     // navigateTo(
                           //     //     context: context,
                           //     //     screen: const BestAcademyFormFourScreen()
                           //     // );
                           //   },)
                         ],
                       ),
                     ),
                   )
               );
             },
           );
          },
        );
      },
    )
    );
  }
}
