import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xvisa/controller/home_cubit/cubit.dart';
import 'package:xvisa/controller/home_cubit/state.dart';
import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/controller/visatype_visaconsultation/cubit.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/academy_search/academy_search_screen.dart';
import 'package:xvisa/view/best_service/best_service_screen.dart';
import 'package:xvisa/view/best_visa/visa_view_all.dart';
import 'package:xvisa/view/home/widget/top_hotel_section.dart';
import 'package:xvisa/view/home/widget/best_academy_section.dart';
import 'package:xvisa/view/home/widget/categories_section.dart';
import 'package:xvisa/view/home/widget/best_package_section.dart';
import 'package:xvisa/view/home/widget/best_flight_section.dart';
import 'package:xvisa/view/home/widget/top_visa_section.dart';
import 'package:xvisa/view/home/widget/top_service_section.dart';
import 'package:xvisa/view/home/widget/visa_consultation_widget.dart';
import 'package:xvisa/view/home/widget/visa_require.dart';
import 'package:xvisa/view/home/widget/we_help_you_section.dart';
import 'package:xvisa/view/home/widget/why_choose_us_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/view/login_dialog.dart';
import '../../controller/force_update.dart';
import '../../generated/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/widgets/no_internet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForceUpdateController forceUpdateController = Get.find();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      forceUpdateController.forceUpdate(context);

      ever(forceUpdateController.isForce, (bool value) {
        if (value == true) {
          forceUpdateController.showForceUpdateDialog(
            context,
            "",
            forceUpdateController.respo.value,
          );
        }
      });
    });
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeCubit()..getHome(),),
      BlocProvider(create: (context) => VisaTypeAndConsultationCubit()..getVisaType(),),
    ], child: BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetHomeErrorState) {
          // showDialog(
          //   context: context,
          //   builder: (context) => CustomDialog(
          //     title: state.error,
          //     subtitle: S.of(context)!.sorry,
          //     labelText: S.of(context)!.close,
          //   ),
          // );
        }
      },
      builder: (context, state) {
        print(CacheHelper.getString("token"));
        if (state is GetHomeLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: const Color(0xff61461B),)),
          );
        }
        if (state is GetHomeSuccessState && HomeCubit.get(context).viewHomeModel != null) {
          return defaultScaffold(
            context: context,
            body: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20.0.h,
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child:
                Column(
                  key: const Key('curvedNavigationBar'),
                  crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 15.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            defaultMenuContainer(
                                src: "assets/SVG/images/visas.svg",
                                onTap: (){
                                  if(checkIfHaveToken())
                                    navigateTo(
                                        context: context,
                                        screen: VisaViewAll(visaRequire: false)
                                    );
                                  else
                                    showLoginDialog(context);
                                },
                                title: S.of(context)!.visas
                            ), defaultMenuContainer(
                                src: "assets/SVG/images/academies.svg",
                                onTap: (){
                                  if(checkIfHaveToken())

                                    navigateTo(
                                        context: context,
                                        screen: AcademySearchScreen()
                                    );
                                  else
                                    showLoginDialog(context);
                                },
                                title:S.of(context)!.academics
                            ), defaultMenuContainer(
                                src: "assets/SVG/images/services.svg",
                                onTap: (){
                                  if(checkIfHaveToken())

                                    navigateTo(
                                        context: context,
                                        screen: BestServiceScreen(serviceName: "استقبال مطار", serviceId: 1,
                                        ));
                                  else
                                    showLoginDialog(context);
                                },
                                title: S.of(context)!.services
                            ), defaultMenuContainer(
                              src: "assets/SVG/images/requirments.svg",
                              title:S.of(context)!.requirements,
                              onTap: (){
                                if(checkIfHaveToken())

                                  navigateTo(
                                      context: context,
                                      screen: VisaViewAll(visaRequire: true)
                                  );
                                else
                                  showLoginDialog(context);
                              },
                            ),
                          ],
                        )
                    ),
                    // const CustomSizedBox(),
                    // CategoriesSection(
                    //   categories: HomeCubit.get(context).viewHomeModel!.data!.categories ?? [],
                    // ),
                    const CustomSizedBox(),
                    TopServiceSection(
                      services:  HomeCubit.get(context).services ??[],
                    ),
                    const CustomSizedBox(),
                    TopVisaSection(
                      visas: HomeCubit.get(context).visas ??[],
                    ),
                    const CustomSizedBox(),
                    VisaRequire(
                      visas: HomeCubit.get(context).visas ??[],

                    ),
                    // const CustomSizedBox(),
                    // TopVisaSection(
                    //   visas: HomeCubit.get(context).visas ??[],
                    // ),
                    // const CustomSizedBox(),
                    // TopHotelSection(
                    //   hotels: HomeCubit.get(context).viewHomeModel!.data!.hotels ??[],
                    // ),
                    const CustomSizedBox(),
                    BestAcademySection(
                      bestAcademy: HomeCubit.get(context).viewHomeModel!.data!.academys ??[],
                    ),
                    // const CustomSizedBox(),
                    // BestFlightSection(
                    //   fligts:  HomeCubit.get(context).viewHomeModel!.data!.airports ?? [],
                    // ),
                    // const CustomSizedBox(),
                    //  BestPackageSection(
                    //   packages: HomeCubit.get(context).viewHomeModel!.data!.packages ?? [],
                    // ),
                    const CustomSizedBox(),
                    const WhyChooseUsSection(),
                    const CustomSizedBox(),
                    WeHelpYouSection(),
                    const CustomSizedBox(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                        vertical: 10.0.h,
                      ),
                      child: CustomActionButton(
                        onTap: () {
                          if(checkIfHaveToken())

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> VisaViewAll(visaRequire: false,)));
                          else
                            showLoginDialog(context);
                        },
                        text: S.of(context)!.exploreMore,
                        height: 70.0.h,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(12.0.r),
                        backGroundColor: AppColors.textAndBackgroundColorButton,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const CustomSizedBox(),
                    VisaConsultationWidget()
                  ],
                ),
              ),
            ),
          );
        }
        else if(state is GetHomeErrorState){
          return defaultScaffold(
            context: context,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NoInternetConnectionWidget(context)
                ],
              ),
            ),
          );
        }else{return Container();}
      },
    ),);
  }

  bool checkIfHaveToken(){
    String token=  CacheHelper.getString("token");
    return token.isNotEmpty;
  }
  Widget defaultMenuContainer({title, src, onTap})=> GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff61461B)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(src),
          SizedBox(height: 5,),
          Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),)
        ],
      ),
    ),
  );
}
