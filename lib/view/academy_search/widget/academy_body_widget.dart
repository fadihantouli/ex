import 'package:xvisa/controller/academy/academy_cubit/cubit.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/generated/l10n.dart';
import 'package:xvisa/model/get_one_academy_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

class AcademyBodyWidget extends StatefulWidget {
  List? course;
  List? insurance;
  List? reception;
  List? housing;
  AcademyBodyWidget(
      {super.key,
      required this.course,
      required this.housing,
      required this.insurance,
      required this.reception});

  @override
  State<AcademyBodyWidget> createState() => _AcademyBodyWidgetState();
}

class _AcademyBodyWidgetState extends State<AcademyBodyWidget> {
  String? selectStudyTime;
  int? selectCourseIndex;
  int? selectHouseIndex;
  String? selectHabitationTime;
  String? selectAirportMeet;
  String? selectInsurance;
  int? generalCourseCheckIndex;
  int? selectInsuranceIndex;
  int? selectReceptionIndex;
  bool generalCourseCheck = false;
  bool intensiveCourseCheck = false;
  bool homestayCheck = false;
  bool habitationCheck = false;
  List<String> weeks = List.generate(
      52,
          (index) => "${index + 1}");
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcademyCubit, AcademyStates>(
      listener: (context, state) {},
      builder: (context, state) {

        print("HOUSING IS --> ${AcademyCubit.get(context).housings}");
        var cubit = AcademyCubit.get(context);
        return Directionality(
          textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context)!.courseDuration,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/calender.svg"),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Text(
                          S.of(context)!
                              .selectTheRightCourseToStudy,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    const Spacer(),
                    defaultDropdownField(
                      title: S.of(context)!.courseDuration,
                      change: true,
                      containerHeight: 40.0,
                      ContainerWidth: 95.0,
                      containerColor: const Color(0xffD9D9D9),
                      value: selectStudyTime,
                      items: weeks.map((value) {
                        return DropdownMenuItem(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000).withOpacity(0.74)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectStudyTime = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                if (widget.course!.isNotEmpty)
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildSelectableOption(
                        CacheHelper.getString("language") == "ar" ?widget.course![index]['title']['ar']:widget.course![index]['title']['en'],
                            widget.course![index]['price_after'],
                        CacheHelper.getString("language") == "ar" ?widget.course![index]['description']['ar']:widget.course![index]['description']['en'] ??"",
                            color: (selectCourseIndex == index)
                                ? const Color(0xff61461B)
                                : Colors.transparent,
                            Icons.check_box_outline_blank,
                            (AcademyCubit.get(context).generalCourseCheckId ==
                                    widget.course![index]['id'])
                                ? true
                                : false,
                            onTap: () {
                              print("TAP");
                              setState(() {
                                selectCourseIndex = index;
                                AcademyCubit.get(context).generalCourseCheckId =
                                    widget.course![index]['id'];
                                AcademyCubit.get(context)
                                        .generalCourseCheckPrice =
                                    widget.course![index]['price_after'];
                                AcademyCubit.get(context)
                                        .generalCourseCheckStartDate =
                                    widget.course![index]['start_date'];
                              });
                              print(generalCourseCheck);
                            },
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: widget.course!.length),
                const SizedBox(height: 16.0),
                Text(
                  S.of(context)!.lodging,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/house.svg"),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Text(
                          S.of(context)!.selectOptionalHousing,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    const Spacer(),
                    defaultDropdownField(
                      title: S.of(context)!.durationOfResidence,
                      change: true,
                      containerHeight: 40.0,
                      ContainerWidth: 95.0,
                      containerColor: const Color(0xffD9D9D9),
                      value: selectHabitationTime,
                      items: weeks.map((value) {
                        return DropdownMenuItem(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000).withOpacity(0.74)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectHabitationTime = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                if (AcademyCubit.get(context).housings.isNotEmpty)
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildSelectableOption(
                        CacheHelper.getString("language") == "ar" ?widget.housing![index]['title']['ar'] ?? "":widget.housing![index]['title']['en'] ?? "",
                            widget.housing![index]['price'],
                        CacheHelper.getString("language") == "ar" ? widget.housing![index]['description']['ar'] ?? "":widget.housing![index]['description']['en'] ?? "",
                            house: true,
                            houseServices: widget.housing![index]
                                ['housing_services'],
                            Icons.check_box_outline_blank,
                            (AcademyCubit.get(context).generalHouseCheckId ==
                                    widget.housing![index]['id'])
                                ? true
                                : false,
                            color: (selectHouseIndex == index)
                                ? const Color(0xff61461B)
                                : Colors.transparent,
                            imagePath: widget.housing![index]['image_path'],
                            onTap: () {
                              print("TAP");
                              setState(() {
                                selectHouseIndex = index;
                                AcademyCubit.get(context).generalHouseCheckId =
                                    widget.housing![index]['id'];
                                AcademyCubit.get(context).generalHouseCheckPrice =
                                    widget.housing![index]['price'];
                              });
                              print(AcademyCubit.get(context)
                                  .generalHouseCheckPrice);
                            },
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: widget.housing!.length),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context)!.insurance,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                if (AcademyCubit.get(context).insurances.isNotEmpty)
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildSelectableOption(
                        CacheHelper.getString("language") == "ar" ? widget.insurance![index]['title']['ar'] ?? "":widget.insurance![index]['title']['en']?? "",
                            widget.insurance![index]['price'],
                        CacheHelper.getString("language") == "ar" ?widget.insurance![index]['description']['ar'] ?? "":widget.insurance![index]['description']['en'] ?? "",
                            house: false,
                            Icons.check_box_outline_blank,
                            (AcademyCubit.get(context).generalInsuranceCheckId ==
                                    widget.insurance![index]['id'])
                                ? true
                                : false,
                            color: (selectInsuranceIndex == index)
                                ? const Color(0xff61461B)
                                : Colors.transparent,
                            onTap: () {
                              setState(() {
                                selectInsuranceIndex = index;
                                AcademyCubit.get(context)
                                        .generalInsuranceCheckId = widget.insurance![index]['id'];
                                AcademyCubit.get(context)
                                        .generalInsuranceCheckPrice =
                                    widget.insurance![index]['price'];
                              });
                              print(AcademyCubit.get(context)
                                  .generalInsuranceCheckPrice);
                              print("id is --> ${AcademyCubit.get(context).generalInsuranceCheckId}");
                            },
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: widget.insurance!.length),
                SizedBox(
                  height: 20,
                ),
                Text(
                  S.of(context)!.services,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                if (widget.reception!.isNotEmpty)
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildSelectableOption(
                        CacheHelper.getString("language") == "ar" ?widget.reception![index]['title']['ar']:widget.reception![index]['title']['en'],
                            widget.reception![index]['price'],
                        CacheHelper.getString("language") == "ar" ?widget.reception![index]['description']['ar'] :widget.reception![index]['description']['en'] ?? "",
                            house: false,
                            Icons.check_box_outline_blank,
                            (AcademyCubit.get(context).generalReceptionCheckId ==
                                    widget.reception![index]['id'])
                                ? true
                                : false,
                            color: (selectReceptionIndex == index)
                                ? const Color(0xff61461B)
                                : Colors.transparent,
                            onTap: () {
                              print("TAP");
                              setState(() {
                                selectReceptionIndex = index;
                                AcademyCubit.get(context)
                                        .generalReceptionCheckId =
                                    widget.reception![index]['id'];
                                AcademyCubit.get(context)
                                        .generalReceptionCheckPrice =
                                    widget.reception![index]['price'];
                              });
                              print("id --- > ${AcademyCubit.get(context).generalInsuranceCheckId}");
                              print("id --- > ${AcademyCubit.get(context).generalReceptionCheckId}");
                            },
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: widget.reception!.length),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xff61461B))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                S.of(context)!.totalCosts,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            const Spacer(),
                            Text(
                            "${double.parse(AcademyCubit.get(context).generalInsuranceCheckPrice) + double.parse(AcademyCubit.get(context).generalCourseCheckPrice) + double.parse(AcademyCubit.get(context).generalHouseCheckPrice) + double.parse(AcademyCubit.get(context).generalReceptionCheckPrice)} SAR",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff61461B),
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                S.of(context)!.generalCourse,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            const Spacer(),
                            Text(
                                (cubit.generalCourseCheckPrice != null) ? "${cubit.generalCourseCheckPrice}" : "0",
                             style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff61461B),
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                S.of(context)!.registrationFees,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            const Spacer(),
                            Text(
                                (cubit.generalCourseCheckPrice != null) ? "${cubit.generalCourseCheckPrice}" : "0",
                             style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff61461B),
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                S.of(context)!.lodging,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            const Spacer(),
                            Text(
                                (cubit.generalHouseCheckPrice != null) ? "${cubit.generalHouseCheckPrice}" : "0",
                             style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff61461B),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDropdown(String hint, List<String> items) {
    return DropdownButton<String>(
      hint: Text(hint),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }

  Widget buildSelectableOption(String title, String price, String description,
      IconData icon, bool? check,
      {imagePath,houseServices, onTap, bool? house = false, required color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff027FEE)),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: (check == false)
                          ? Colors.transparent
                          : const Color(0xff027FEE),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${price} ${S.of(context)!.sar}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          color: const Color(0xff61461B),
                        ),
                  ),
                ],
              ),
              Html(data: description, style: {
                "p": Style(
                  color: Color(0xff2A2A2A),
                  fontSize:
                      FontSize(12), // Adjust font size for better visibility
                  fontWeight: FontWeight.w700,
                ),
              }),
              if (house == true)
                GridView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3.5, // Adjust this to change item height
                  ),
                  itemCount: houseServices.length,
                  itemBuilder: (context, index2) {
                    return Container(
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: imagePath != null
                                      ?imagePath.contains(".svg")?
                                  SvgPicture.network(
                                    imagePath.split(" "),
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 20,
                                  )
                                      :Image.network(
                                    imagePath.split(" "),
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 20,
                                  )
                                      : const Icon(Icons.image, size: 25),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                child: Text(
                                  houseServices[index2]['name']['ar'] ??
                                      S.of(context)!.noName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff606060)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
