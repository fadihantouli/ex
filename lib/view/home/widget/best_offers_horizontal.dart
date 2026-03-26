import 'package:xvisa/view/home/widget/best_offer_horizontal_item.dart';
import 'package:xvisa/view/home/widget/best_offer_horizontal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestOffersHorizontal extends StatelessWidget {
  const BestOffersHorizontal({
    super.key,
    required this.bestOffers,
  });

  final List bestOffers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.0.h,
        ),
        SizedBox(
          height: 150.0.h,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12.0.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BestOffersHorizontalItem(
                width: 70.0.w,
                //offer: bestOffers[index],
                review: bestOffers[index].reviewAverage ?? 0.0,
                isFavorite: bestOffers[index].isFavourite,
              );
            },
            itemCount: 5,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12.0.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
