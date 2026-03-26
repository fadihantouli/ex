import 'package:flutter_svg/flutter_svg.dart';
 import 'package:xvisa/controller/visa_cubit/cubit.dart';
import 'package:xvisa/controller/visa_cubit/states.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/model/visa_details_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_visa/best_visa_screen.dart';
import 'package:xvisa/view/home/widget/visa_require_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/widgets/no_data.dart';
import 'package:xvisa/widgets/no_internet.dart';

class VisaViewAll extends StatelessWidget {
  bool visaRequire = false;
  VisaViewAll({super.key, required this.visaRequire});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisaCubit()..getVisa(),
      child: BlocConsumer<VisaCubit, VisaState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = VisaCubit.get(context);
          print("visaRequire --> $visaRequire");
          return defaultScaffold(
              context: context,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          (visaRequire == false)
                              ? S.of(context)!.visas
                              : S.of(context)!.visasRequirments,
                          style: TextStyle(
                              color: Color(0xff2A2A2A),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      if (visaRequire == false)Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0.h, horizontal: 15.0.h),
                          child: SearchTextField(
                            controller: searchController,
                            onChanged: (String? value) {
                              cubit.getVisa(search: value);
                            },
                            readOnly: true,
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is GetVisaErrorStates)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              SizedBox(
                                height: 20,
                              ),
                               NoInternetConnectionWidget(context)

                             ],
                          ),
                        ),
                      if (state is GetVisaLoadingStates)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      if (state is GetVisaSuccessStates &&
                          cubit.visaModel != null)
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          reverse: false,
                          padding: EdgeInsets.zero,
                          itemCount: cubit.visaModel!.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Number of columns
                            crossAxisSpacing: 10.0, // Spacing between columns
                            mainAxisSpacing: 1.0, // Spacing between rows
                            childAspectRatio:
                                0.87 / 1.6, // Aspect ratio of each grid item
                          ),
                          itemBuilder: (context, index) => SizedBox(
                            height: 50,
                            child: InkWell(
                              onTap: () {
                                VisaDetailsModel? visaDetailsModel;
                                if(visaRequire == true && cubit
                                    .visaModel!.data![index].visaDetail != null) {
                                   visaDetailsModel =
                                  VisaDetailsModel.fromJson(cubit
                                      .visaModel!.data![index].visaDetail!
                                      .toJson());
                                }
                                navigateTo(
                                    context: context,
                                    screen: (visaRequire == false)
                                        ? BestVisaScreen(
                                            fromAll: true,
                                            finger: cubit.visaModel!
                                                .data![index].visaFingerprint ?? [],
                                            id: cubit
                                                .visaModel!.data![index].id,
                                            countryName: cubit.visaModel!
                                                .data![index].country!.name!.ar,
                                            visaTypes: cubit.visaModel!
                                                .data![index].visaTypes,

                                          )
                                        : VisaRequireScreen(
                                            visaDetail: visaDetailsModel,
                                            fromAll: true,
                                            visa: cubit.visaModel!.data![index],
                                          ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Stack(
                                      //   alignment: Alignment.center,
                                      //   children: [
                                      //     (!cubit.visaModel!.data![index].country!
                                      //         .imagePath!
                                      //         .contains(".svg"))
                                      //         ? Container(
                                      //       height:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.35,
                                      //       width:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.5,
                                      //       clipBehavior:
                                      //       Clip.antiAliasWithSaveLayer,
                                      //       decoration: BoxDecoration(
                                      //         shape: BoxShape.circle,
                                      //         color: Colors.white,
                                      //         image: DecorationImage(
                                      //           fit: BoxFit.cover,
                                      //           image: CachedNetworkImageProvider(
                                      //             maxHeight: 50,
                                      //             // "${cubit.visaModel!.data![index].country!.imagePath}"
                                      // "" ??
                                      //                 "",
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     )
                                      //         : Container(
                                      //       height:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.35,
                                      //       width:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.5,
                                      //       clipBehavior:
                                      //       Clip.antiAliasWithSaveLayer,
                                      //       decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: Colors.white),
                                      //       child: SvgPicture.network(
                                      //         cubit.visaModel!.data![index].country!.imagePath ??
                                      //             "",
                                      //         fit: BoxFit.cover,
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       decoration: BoxDecoration(
                                      //         shape: BoxShape.circle,
                                      //         color: Colors.white.withOpacity(0.7),
                                      //       ),
                                      //       height:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.35,
                                      //       width:
                                      //       MediaQuery.sizeOf(context).width *
                                      //           0.5,
                                      //     )
                                      //   ],
                                      // ),
                                      Container(
                                        child:(cubit.visaModel!.data![index].country!.logoPath!.contains(".svg"))?
                                        SvgPicture.network(cubit.visaModel!.data![index].country!.logoPath!,height: 100.0.h,
                                          width: 200.w - 30,
                                          fit: BoxFit.cover,):
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                              imageUrl: cubit.visaModel!.data![index].country!.logoPath ?? "",
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
                                  SizedBox(
                                    height: 5
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(8),
                                        // color: Color(0xff61461B)
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Text(
                                      CacheHelper.getString("language") == "ar"
                                          ? cubit.visaModel!.data![index]
                                              .country!.name!.ar ?? ""
                                          : cubit.visaModel!.data![index]
                                              .country!.name!.en ??"",
                                      style: TextStyle(
                                          // color: Color(0xffFFFFFF),
                                        color: Color(0xff61461B),
                                          fontSize: 13),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (state is GetVisaSuccessStates &&
                          cubit.visaModel == null)
                        Center(
                          child: NoDataWidget(context)
                        )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
