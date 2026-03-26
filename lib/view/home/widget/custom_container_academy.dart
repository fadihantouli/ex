import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/academy_search/academy_details_screen.dart';
import 'package:xvisa/view/home/widget/custom_icon_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/view/login_dialog.dart';


class CustomContainerAcademy extends StatefulWidget {
  const CustomContainerAcademy({
    super.key,
    required this.id,
    required this.width,
    required this.imageName,
    required this.academyName,
    required this.countryName,
    this.reservationType,
    this.isTrip = true,
   // this.trip,
    this.onTapFavoriteIcon,
  });

  final double width;
 // final Trips? trip;
  final String? imageName;
  final String? academyName;
  final String? countryName;
  final String? reservationType;
  final bool isTrip;
  final  id;
  final void Function()? onTapFavoriteIcon;

  @override
  State<CustomContainerAcademy> createState() => _CustomContainerAcademyState();
}

class _CustomContainerAcademyState extends State<CustomContainerAcademy> {
  bool isFavorite = false;
 // Trips? trip;
  String englishKey = "English";
  late bool isEnglish = (englishKey == 'English');

  @override
  void initState() {
    super.initState();
    //isFavorite = widget.isFavorite ?? false;
   // trip = widget.trip;
  }

  bool checkIfHaveToken(){
    String token=  CacheHelper.getString("token");
    return token.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(checkIfHaveToken())
        navigateTo(
          screen: AcademyDetailsScreen(id: widget.id,),
          context: context,
        );
        else
          showLoginDialog(context);
      },
      child: SizedBox(
        height: 143.0.h,
        width: widget.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: (widget.imageName!.contains(".svg"))?
              SvgPicture.network(widget.imageName!,height: 180.0.h,
                width: widget.width,
                fit: BoxFit.cover,):
              CachedNetworkImage(
                  imageUrl: widget.imageName ?? '',
                  height: 185.0.h,
                  width: widget.width,
                  fit: BoxFit.cover,
                  placeholder: (context,
                      url) =>
                  const ShimmerAnimatedLoading(
                    circularRaduis:
                    50,
                  ),
                  errorWidget: (context,
                      url, error) =>
                  const Icon(
                    Icons
                        .image_not_supported_outlined,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 15.w),
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: widget.width <= 200.0.w ? 220.0.w : 140.0.w,
                    child: Text(
                      widget.academyName ?? "",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 10.0.sp,),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: AppColors.white,
                        size: 14.0.sp,
                      ),
                      SizedBox(
                        width: 1.0.w,
                      ),
                      SizedBox(
                        width: widget.width >= 200.0.w ? 160.0.w : 100.0.w,
                        child: Text(
                          widget.countryName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: AppColors.white, fontSize: 10.sp),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
