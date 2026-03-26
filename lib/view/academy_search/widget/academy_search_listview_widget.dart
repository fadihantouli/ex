import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/academy_search/academy_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class AcademySearchListviewWidget extends StatelessWidget {
  List academys = [];
  List images = [];
  AcademySearchListviewWidget({required this.academys, required this.images});
  @override
  Widget build(BuildContext context) {
    print("kkkkkk --> ${academys.length}");
    return Directionality(
      textDirection: (CacheHelper.getString("LOCALE") == "ar")? TextDirection.rtl:TextDirection.ltr,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: academys.length,
        shrinkWrap: true,
        reverse: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigateTo(
                  context: context,
                  screen: AcademyDetailsScreen(id: academys[index]['id']));
            },

            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Card(
                color: Colors.white,
                shadowColor: const Color(0xffC4C4C41A).withOpacity(0.3),
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
                          Container(
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: (academys[index]['image_path']
                                      .contains(".svg"))
                                  ? SvgPicture.network(
                                      academys[index]['image_path'],
                                      height: 150.0,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      imageUrl:
                                          academys[index]['image_path'] ?? '',
                                      height: 150.0,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const ShimmerAnimatedLoading(
                                            circularRaduis: 50,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                            Icons.image_not_supported_outlined,
                                          )),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    CacheHelper.getString("language") == "ar" ?
                                    '${academys[index]['title']['ar']}':'${academys[index]['title']['en']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff2A2A2A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    if (academys[index]['country'] != null &&
                                        academys[index]['country']['logo_path']
                                            .contains(".svg"))
                                      SvgPicture.network(
                                        (academys[index]['country'] != null)
                                            ? academys[index]['country']
                                                ['logo_path']
                                            : '',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.cover,
                                      ),
                                    if (academys[index]['country'] != null &&
                                        !academys[index]['country']['logo_path']
                                            .contains(".svg"))
                                      CachedNetworkImage(
                                          imageUrl: (academys[index]
                                                      ['country'] !=
                                                  null)
                                              ? academys[index]['country']
                                                  ['logo_path']
                                              : '',
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const ShimmerAnimatedLoading(
                                                circularRaduis: 50,
                                              ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                                Icons
                                                    .image_not_supported_outlined,
                                              )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      child: Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        (academys[index]['country'] != null)
                                            ?CacheHelper.getString("language") == "ar" ?
                                        '${academys[index]['country']['name']['ar']}/ ${academys[index]['city']['name']['ar']}'
                                            :'${academys[index]['country']['name']['en']}/ ${academys[index]['city']['name']['en']}'
                                        : "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff61461B),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  child: Html(data:  CacheHelper.getString("language") == "ar" ?
                                  "${academys[index]['description']['ar']}":"${academys[index]['description']['en']}" ,
                                      style: {
                                    "p": Style(
                                      color: Color(0xff8D94A2),
                                      fontSize:
                                      FontSize(10), // Adjust font size for better visibility
                                      fontWeight: FontWeight.w600,
                                      maxLines: 3, // ✅ Set max lines
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  }),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  child: Row(
                                    children: [
                                      if (academys[index]['course']
                                              .isNotEmpty &&
                                          academys[index]['course'] != null)
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text:
                                                "${S.of(context)!.course}/ ",
                                            style: TextStyle(
                                                color: Color(0xff8D94A2),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "${academys[index]['course'][0]['price_after']} / ",
                                                style: const TextStyle(
                                                    color: Color(0xff2A2A2A),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              if (academys[index]['course'][0]
                                                      ['price_before'] !=
                                                  null)
                                                TextSpan(
                                                  text:
                                                      " ${academys[index]['course'][0]['price_before']}",
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,
                                                      decorationThickness: 2,
                                                      color: Color(0xff2A2A2A),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  child: Row(
                                    children: [
                                      if (academys[index]['housing']
                                              .isNotEmpty &&
                                          academys[index]['housing'] != null)
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: "السكن/ ",
                                            style: const TextStyle(
                                                color: Color(0xff8D94A2),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "${academys[index]['housing'][0]['price']}",
                                                style: const TextStyle(
                                                    color: Color(0xff2A2A2A),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
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
                      // const SizedBox(height: 12),
                      // if (academys[index]['accreditation'] != null)
                      //   SizedBox(
                      //       width: MediaQuery.sizeOf(context).width * 0.9,
                      //       child: GridView.builder(
                      //         padding: const EdgeInsets.all(8),
                      //         shrinkWrap: true,
                      //         physics: NeverScrollableScrollPhysics(),
                      //         gridDelegate:
                      //             const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount:
                      //               2, // Number of columns in the grid
                      //           crossAxisSpacing: 5.0,
                      //           mainAxisSpacing: 8.0,
                      //           childAspectRatio:
                      //               3, // Adjust this to change item height
                      //         ),
                      //         itemCount:
                      //             academys[index]['accreditation'].length,
                      //         itemBuilder: (context, index2) {
                      //           return Container(
                      //             height: 30,
                      //             alignment: Alignment.center,
                      //             decoration: BoxDecoration(
                      //               color: const Color(0xffD9D9D9),
                      //               borderRadius: BorderRadius.circular(8),
                      //             ),
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 12),
                      //             child: IntrinsicWidth(
                      //               child: Row(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Expanded(
                      //                     child: academys[index]
                      //                                     ['accreditation']
                      //                                 [index2]['image_path'] !=
                      //                             null
                      //                         ? (academys[index]
                      //                                         ['accreditation']
                      //                                     [index2]['image_path']
                      //                                 .contains(".svg"))
                      //                             ? Padding(
                      //                                 padding: const EdgeInsets
                      //                                     .symmetric(
                      //                                     vertical: 5),
                      //                                 child: SvgPicture.network(
                      //                                   academys[index][
                      //                                           'accreditation']
                      //                                       [
                      //                                       index2]['image_path'],
                      //                                   fit: BoxFit.cover,
                      //                                 ),
                      //                               )
                      //                             : Container(
                      //                                 padding:
                      //                                     EdgeInsets.symmetric(
                      //                                         vertical: 5),
                      //                                 child: Image.network(
                      //                                   academys[index][
                      //                                           'accreditation']
                      //                                       [
                      //                                       index2]['image_path'],
                      //                                   fit: BoxFit.cover,
                      //                                 ),
                      //                               )
                      //                         : const Icon(Icons.image,
                      //                             size: 50),
                      //                   ),
                      //                   const SizedBox(width: 8),
                      //                   SizedBox(
                      //                     width:
                      //                         MediaQuery.sizeOf(context).width *
                      //                             0.2,
                      //                     child: Text(
                      //                       academys[index]['accreditation']
                      //                               [index2]['title']['ar'] ??
                      //                           '',
                      //                       style: const TextStyle(
                      //                           fontWeight: FontWeight.w400,
                      //                           fontSize: 12,
                      //                           color: Color(0xff606060)),
                      //                     ),
                      //                   ),
                      //                   const SizedBox(height: 4),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       )),
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
