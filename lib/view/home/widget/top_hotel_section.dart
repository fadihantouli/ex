import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/view/home/widget/best_flight_section.dart';
import 'package:xvisa/view/home/widget/top_hotel_item.dart';
import 'package:xvisa/view/hotel_search/hotel_search_screen.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utills/locale_keys.dart';

class TopHotelSection extends StatelessWidget {
  const TopHotelSection({
    super.key,
    required this.hotels,
  });

  final List<Hotels>? hotels;

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
            text: S.of(context)!.discoverTheBestHotels,
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelSearchScreen(),));
            },
          ),
        ),
        ListView.separated(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return TopHotelItem(
              width: 105.0.w,
              description: hotels![index].description!.en,
              image: hotels![index].imagePath,
              countryName: hotels![index].country!.name!.en,
              name: hotels![index].title!.en,
              isFavorite: false,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.0.h,
            );
          },
          itemCount: hotels!.length >= 3 ? 3 : hotels!.length,
        ),
      ],
    );
  }
}
