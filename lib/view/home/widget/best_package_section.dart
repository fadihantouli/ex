import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/home/widget/best_flight_section.dart';
import 'package:xvisa/view/home/widget/package_container_item.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestPackageSection extends StatelessWidget {
  const BestPackageSection({super.key, required this.packages});

  final List<Packages> packages;

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
            text: S.of(context)!.discoverTheBestPackage,
            onPressed: () {
             // context.push(AppRoutesString.ourBlogsScreen);
            },
          ),
        ),
        SizedBox(
          height: 141.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return PackageContainerItem(
                  width: 141.0.w,
                  packageName: packages[index].title!.en,
                  countryName: packages[index].country!.name!.en,
                  imageName: packages[index].logoPath,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.0.w,
                );
              }),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
