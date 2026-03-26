import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/home/widget/why_choose_us_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class WeHelpYouSection extends StatelessWidget {
  WeHelpYouSection({super.key});
  String arabicKey = "Arabic";
  late bool isArabic = (arabicKey == 'Arabic');
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(
            S.of(context)!.weHelpYouMakeBestTrip,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 6.0.h,
          ),
          Text(
            S.of(context)!.whenWeSayThat,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20.0.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 290.0.h,
            child: Stack(
              children: [
                Container(
                  height: 190.0.h,
                  width: 130.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12.0.r),
                    image: const DecorationImage(
                      image: AssetImage(
                       "assets/images/Rectangle 9897.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: isArabic ? TextDirection.ltr : TextDirection.rtl,
                  top: 0,
                  start: MediaQuery.sizeOf(context).width * 0.1,
                  child: Container(
                    height: 140.0.h,
                    width: 110.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12.0.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Rectangle 9899.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                  top: MediaQuery.sizeOf(context).height * 0.19,
                  end: MediaQuery.sizeOf(context).width * 0.3,
                  child: Container(
                    height: 140.0.h,
                    width: 140.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12.0.r),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/Rectangle 9898.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Row(
            children: [
              WhyChooseUSItem(
                text: S.of(context)!.trustWe,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
              WhyChooseUSItem(
                text: S.of(context)!.safetyWe,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Row(
            children: [
              WhyChooseUSItem(
                text: S.of(context)!.quickBooking,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
              SizedBox(
                width: 5.0.w,
              ),
              WhyChooseUSItem(
                text: S.of(context)!.saveMoney,
                child: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textAndBackgroundColorButton,
                  size: 14.0.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
