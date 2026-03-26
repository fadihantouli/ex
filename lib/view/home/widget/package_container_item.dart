import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PackageContainerItem extends StatelessWidget {
  const PackageContainerItem({
    super.key,
    required this.width,
    required this.imageName,
    required this.packageName,
    required this.countryName,
    this.reservationType,
  });

  final double width;
  // final Trips? trip;
  final String? imageName;
  final String? packageName;
  final String? countryName;
  final String? reservationType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: SizedBox(
        height: 143.0.h,
        width: width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                  imageUrl: imageName ?? '',
                  height: 185.0.h,
                  width: width,
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
                    width: width <= 200.0.w ? 220.0.w : 140.0.w,
                    child: Text(
                      packageName ?? "",
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
                        width: width >= 200.0.w ? 160.0.w : 100.0.w,
                        child: Text(
                          countryName ?? "",
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
