import 'dart:ui';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/hotel_search/hotel_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

import '../../../model/get_hotel_model.dart';

class HotelSearchListviewWidget extends StatelessWidget {
  List<Data> hotels;
   HotelSearchListviewWidget({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: (CacheHelper.getString("LOCALE") == "ar")? TextDirection.rtl:TextDirection.ltr,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: hotels.length,
        shrinkWrap: true,
        reverse: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              navigateTo(
                context: context,
                screen: const HotelDetailsScreen()
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Card(
                color: Colors.white,
                shadowColor: const Color(0xffC4C4C41A).withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: CachedNetworkImage(
                                    imageUrl: hotels[index].imagePath ?? '',
                                    height: 97.0,
                                    width: 97,
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
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.favorite_border, size: 12, color: Color(0xffFF2828),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child:  Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    '${hotels[index].title!.ar}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff2A2A2A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_sharp, color: Color(0xff61461B),),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: MediaQuery.sizeOf(context).width * 0.4,
                                      child:  Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        '${hotels[index].country!.name!.ar}, ${hotels[index].city!.name!.ar}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff61461B),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  child: Text(
                                    "${hotels[index].description!.ar}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff8D94A2),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  child: Row(
                                    children: [
                                      Text(
                                        '${hotels[index].rooms![0].price}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFF2828),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xff027FEE),
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                       Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff2A2A2A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width : MediaQuery.sizeOf(context).width * 0.74,
                            child: GridView.count(
                              crossAxisCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 3,
                              children: List.generate(3, (index) {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD9D9D9),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(S.of(context)!.location,
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff606060)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
