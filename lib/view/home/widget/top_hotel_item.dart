import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class TopHotelItem extends StatefulWidget {
  TopHotelItem({
    super.key,
    required this.width,
    required this.image,
    required this.name,
    required this.description,
    required this.countryName,
    this.isFavorite = false,
  });

  final double width;
  //final offer;
  var image;
  var name;
  var description;
  var countryName;
  final bool? isFavorite;

  @override
  State<TopHotelItem> createState() => _TopHotelItemState();
}

class _TopHotelItemState extends State<TopHotelItem> {
  bool isFavorite = false;
  //Trips? trip;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
   // trip = widget.offer;
  }

  @override
  Widget build(BuildContext context) {
   // final resultOfBeforePrice = context.read<MainCubit>().currentCurrencyPrice * int.parse(widget.offer?.beforePrice);
    return InkWell(
      onTap: () {
        // context.push(AppRoutesString.travelDetailsScreen, extra: trip).then((value) {
        //   trip = trip!.copyWith(
        //     isFavourite: value as bool,
        //   );
        //   isFavorite = value;
        //   context.read<TripCheckoutDetailsCubit>().onCloseTripDetailsScreen();
        // });
      },
      child: Container(
        width: 150.0.w,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 8.0.w,
          vertical: 10.0.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteAppColor,
          borderRadius: BorderRadiusDirectional.circular(12.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.13),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 120.0.h,
              width: widget.width,
              child: Stack(
                children: [
                  Container(
                    height: 140.0.h,
                    width: widget.width,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          widget.image?? "",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.5.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.name ?? S.of(context)!.imgWorldsOfAdventure,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 2.5.w,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: AppColors.textAndBackgroundColorButton,
                        size: 14.0.sp,
                      ),
                      Expanded(
                        child: Text(
                          widget.countryName,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.w,
                  ),
                  Text(
                    widget.description ?? " ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 5.0.w,
                  ),
                  SizedBox(
                    height: 5.0.w,
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
