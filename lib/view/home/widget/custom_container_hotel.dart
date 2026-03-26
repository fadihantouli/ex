import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/best_service/best_service_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:xvisa/view/login_dialog.dart';
import 'dart:ui';

import '../../../shared/local/cach_helper.dart';

class CustomContainerHotel extends StatefulWidget {
   CustomContainerHotel({
    super.key,
    required this.width,
    required this.imageName,
    required this.cityName,
     this.countryName,
    this.tripPrice,
    this.reservationType,
    this.oldTripPrice,
    this.percentageSave,
    this.isFavorite = false,
    this.isTrip = true,
    //this.trip,
    this.onTapFavoriteIcon, this.serviceId,
  });

  final double width;
 // final Trips? trip;
  final String? imageName;
  var serviceId;
  final String? cityName;
  final String? countryName;
  final int? tripPrice;
  final String? reservationType;
  final String? oldTripPrice;
  final String? percentageSave;
  final bool? isFavorite;
  final bool isTrip;
  final void Function()? onTapFavoriteIcon;

  @override
  State<CustomContainerHotel> createState() => _CustomContainerHotelState();
}

class _CustomContainerHotelState extends State<CustomContainerHotel> {
  bool isFavorite = false;
 // Trips? trip;
  late final String englishKey = "English";
  static TextDirection getTextDirection(bool isEnglish) {
    return isEnglish
        ? TextDirection.ltr
        : TextDirection.rtl;
  }
  late final TextDirection textDirection;

  bool get isEnglish => englishKey == 'English';
  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
  //  trip = widget.trip;
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
          context: context,
          screen: BestServiceScreen(serviceName: widget.cityName, serviceId: widget.serviceId,
        ));
        else
          showLoginDialog(context);
      },
      child: SizedBox(
        height: 143.0.h,
        width: 141.0.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if(widget.imageName!.contains(".svg"))SvgPicture.network(widget.imageName!,height: 185.0.h,
              width: widget.width,
              fit: BoxFit.cover,),
            if(!widget.imageName!.contains(".svg")) Container(
              height: 185.0.h,
              width: widget.width,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    widget.imageName ?? "",
                  ),
                ),
              ),
            ),
            Container(
              height: 185.0.h,
              width: widget.width,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0.r),
                color: Colors.black38,
              ),
            ),
            Container(
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff61461B),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(15.0.r),
                  bottomStart: Radius.circular(15.0.r),
                ),
              ),
              width: 141.0.w,
              child: Center(
                child: Text(
                  widget.cityName ?? "",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 10.0.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
