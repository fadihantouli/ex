import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/home/widget/custom_container_hotel.dart';
import 'package:xvisa/view/home/widget/custom_row_title.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopServiceSection extends StatelessWidget {
  const TopServiceSection({super.key, required this.services});
  final List? services;

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
           viewAll: false,

            text: S.of(context)!.discoverTheBestServices,
          ),
        ),
        SizedBox(
          height: 200.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: services!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.push(
                    //   AppRoutesString.cityDestinationScreen,
                    //   extra: services[index].id,
                    // );
                  },
                  child: CustomContainerHotel(
                    width: 200.0.w,
                    cityName: CacheHelper.getString("language") == "ar"?services![index]['type']['ar']:services![index]['type']['en'] ,
                    imageName: services![index]['image_path'],
                    serviceId: services![index]['id'],
                    isTrip: false,
                  ),
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
