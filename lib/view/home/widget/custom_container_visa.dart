import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/best_vise_form1/best_visa_form_one_screen.dart';
import 'package:xvisa/view/home/widget/custom_icon_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomContainerVisa extends StatefulWidget {
   CustomContainerVisa({
    super.key,
    required this.width,
    required this.imageName,
     this.cityName,
    required this.countryName,
    this.tripPrice,
    this.reservationType,
    this.oldVisaPrice,
    this.percentageSave,
    this.isFavorite = false,
    this.isVisa = true,
    this.countryImage,
    this.require,
    //this.trip,
    this.onTapFavoriteIcon,
  });

  final double width;
  bool? require = false;
  var countryImage;
  //final Visas? trip;
  final String? imageName;
  final String? cityName;
  final String? countryName;
  final int? tripPrice;
  final String? reservationType;
  final String? oldVisaPrice;
  final String? percentageSave;
  final bool? isFavorite;
  final bool isVisa;
  final void Function()? onTapFavoriteIcon;

  @override
  State<CustomContainerVisa> createState() => _CustomContainerVisaState();
}

class _CustomContainerVisaState extends State<CustomContainerVisa> {
  bool isFavorite = false;
 // Visas? trip;
  String englishKey = "English";
  late bool isEnglish = (englishKey == 'English');

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
    //trip = widget.trip;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 143.0.h,
      width: widget.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
         if(widget.require == false) ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: (widget.imageName!.contains(".svg"))?
            SvgPicture.network(widget.imageName!,height: 180.0.h,
              width: widget.width,
              fit: BoxFit.cover,):
            CachedNetworkImage(
                imageUrl: widget.imageName ?? "",
                height: 180.0.h,
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
         if(widget.require == true) Stack(
           alignment: Alignment.center,
           children: [
             ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: (widget.imageName!.contains(".svg"))?
                SvgPicture.network(widget.imageName!,height: 180.0.h,
                  width: widget.width,
                  fit: BoxFit.cover,):
                CachedNetworkImage(
                    imageUrl: widget.imageName ?? "",
                    height: 180.0.h,
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
             Container(
               child:(widget.countryImage.contains(".svg"))?
               SvgPicture.network(widget.countryImage!,height: 100.0.h,
                 width: widget.width - 30,
                 fit: BoxFit.cover,):   ClipRRect(
                 borderRadius: BorderRadius.circular(100),
                   child: CachedNetworkImage(
                     imageUrl: widget.countryImage,
                     height: 100.0.h,
                     width: 100,
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
             )
           ],
         ),
          Container(
            height: 30,
            width: widget.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom:Radius.circular(13)),
              color: const Color(0xff61461B)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: AppColors.white,
                  size: 14.0.sp,
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                Text(
                  widget.countryName ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.white, fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
