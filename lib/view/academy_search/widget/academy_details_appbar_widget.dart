import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AcademyDetailsAppbarWidget extends StatelessWidget {
  final image;
  final name;
  final location;
  final lat;
  final long;
  const AcademyDetailsAppbarWidget({super.key, this.image, this.name, this.location, this.lat, this.long});

  @override
  Widget build(BuildContext context) {
    Future<void> openGoogleMaps({double? latitude, double? longitude}) async {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw 'Could not open Google Maps.';
      }
    }
    return Directionality(
      textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,
      child: Stack(
        alignment: CacheHelper.getString("language") == "ar" ? Alignment.centerRight: Alignment.centerLeft,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: (image.contains(".svg"))
                ? SvgPicture.network(
                    image!,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: image ?? '',
                height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ShimmerAnimatedLoading(
                          circularRaduis: 50,
                        ),
                    errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                        )),
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 10),
            height: 266,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(),
                    // Container(
                    //   padding: const EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: const Icon(
                    //     Icons.favorite_border,
                    //     size: 20,
                    //     color: Color(0xffFF2828),
                    //   ),
                    // ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.clear,
                          size: 22,
                          color: Color(0xff1D1B23),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  alignment: CacheHelper.getString("language") == "ar" ? Alignment.centerRight: Alignment.centerLeft,
                  child: Text(
                    name,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Container(
                   width: double.infinity,
                   alignment: CacheHelper.getString("language") == "ar" ? Alignment.centerRight: Alignment.centerLeft,
                   child: Row(
                     mainAxisAlignment:CacheHelper.getString("language") == "ar" ? MainAxisAlignment.start:MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await openGoogleMaps(
                            longitude: double.parse(long),
                            latitude: double.parse(lat,)
                          );
                        },
                        child: Text(
                          "$location",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                                   ),
                 ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
