import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/home/widget/why_choose_us_item.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(
              S.of(context)!.whyChooseUs,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: const Color(0xff333333)
            )),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WhyChooseUSItem(
                text: S.of(context)!.lowestPricesAndBookings,
                descriptionText: S.of(context)!.unique,
                descriptionTextStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                child: Image.asset("assets/images/Vector.png"),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              WhyChooseUSItem(
                text: S.of(context)!.easyBookingQuickConfirmation,
                descriptionText: S.of(context)!.bookIsEasy,
                descriptionTextStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                child: Image.asset("assets/images/Vector(1).png"),
              ),
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WhyChooseUSItem(
                text: S.of(context)!.varietyOfAirlines,
                descriptionText: S.of(context)!.chooseFromRangeOfLeading,
                descriptionTextStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                child: Image.asset("assets/images/Group(1).png"),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              WhyChooseUSItem(
                text: S.of(context)!.distinguishedExperts,
                descriptionText: S.of(context)!.reallyDistinguishes,
                descriptionTextStyle: const TextStyle(
                  color: Color(0xff333333),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                child: Image.asset("assets/images/Group(2).png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
