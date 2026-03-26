import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/login_dialog.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/view/academy_search/academy_search_screen.dart';
import 'package:xvisa/view/home/widget/custom_container_academy.dart';
import 'package:xvisa/view/home/widget/custom_row_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestAcademySection extends StatelessWidget {
  const BestAcademySection({super.key, required this.bestAcademy});

  final List<Academys> bestAcademy;
  bool checkIfHaveToken(){
    String token=  CacheHelper.getString("token");
    return token.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 10.0.w,
            end: 10.0.w,
            bottom: 10.0.h,
          ),
          child: CustomRowTitle(
            viewAll: true,
            text: S.of(context)!.discoverTheBestInstitutes,
            onPressed: () {
              if(checkIfHaveToken())
              navigateTo(
                context: context,
                screen: AcademySearchScreen()
              );
              else
                showLoginDialog(context);
            },
          ),
        ),
        SizedBox(
          height: 150.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: bestAcademy!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomContainerAcademy(
                  width: 141.0.w,
                  //trip: bestAcademy?[index],
                  id:  bestAcademy![index].id,
                  academyName: CacheHelper.getString("language") == "ar"?bestAcademy![index].title!.ar:bestAcademy![index].title!.en ,
                  countryName:CacheHelper.getString("language") == "ar"? bestAcademy![index].country!.name!.ar:bestAcademy![index].country!.name!.en ,
                  imageName: bestAcademy?[index].imagePath ?? "",
                  reservationType: "/person",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.0.w,
                );
              }),
        ),
      ],
    );
  }
}
