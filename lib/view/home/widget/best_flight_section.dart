import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/home/widget/best_flight_container_item.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BestFlightSection extends StatelessWidget {
  const BestFlightSection({super.key, required this.fligts});

  final List<Airports>? fligts;

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
            text: S.of(context)!.discoverTheBestFlights,
            onPressed: () {
             // context.push(AppRoutesString.popularExperiencesScreen);
            },
          ),
        ),
        SizedBox(
          height: 150.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: fligts!.length,
              itemBuilder: (context, index) {
                return BestFlightItem(
                  width: 222.0.w,
                  title: fligts![index].title!.en,
                 imagePath: fligts![index].imagePath,
                 countryName: fligts![index].country!.name!.en,
                 // trip: const ['a', 'b' , 'c'],
                  isFavorite: true,
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

class CustomRowTitle extends StatelessWidget {
  const CustomRowTitle({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff2A2A2A),
          ),
        ),
        const Spacer(),
        DefaultTextButton(
          text: S.of(context)!.viewAll,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff61461B)
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
