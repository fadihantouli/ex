import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestFlightItem extends StatefulWidget {
  const BestFlightItem({
    super.key,
    required this.width,
   // required this.trip,
    this.isFavorite = false, this.imagePath, this.countryName, this.title,
  });

  final double width;
  final String? imagePath;
  final String? countryName;
  final String? title;
  //final Trips? trip;
  final bool? isFavorite;

  @override
  State<BestFlightItem> createState() => _BestFlightItemState();
}

class _BestFlightItemState extends State<BestFlightItem> {
  bool isFavorite = false;
 // Trips? trip;
  String englishKey = "English";
  late bool isEnglish = (englishKey == 'English');

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
   // trip = widget.trip;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () {
        // context.push(AppRoutesString.travelDetailsScreen, extra: trip).then(
        //       (value) {
        //     trip = trip!.copyWith(
        //       isFavourite: value as bool,
        //     );
        //     isFavorite = value;
        //     context.read<TripCheckoutDetailsCubit>().onCloseTripDetailsScreen();
        //   },
        // );
      },
      child: SizedBox(
        height: 143.0.h,
        width: widget.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                  imageUrl: widget.imagePath ?? '',
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
                mainAxisAlignment: CacheHelper.getString("language") == "ar" ? MainAxisAlignment.start:MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: widget.width <= 200.0.w ? 220.0.w : 140.0.w,
                    child: Text(
                      widget.title ?? "",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14.0.sp,),
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
                              ?.copyWith(color: AppColors.white),
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
