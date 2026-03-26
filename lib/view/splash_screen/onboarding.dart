import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';

import 'package:xvisa/view/splash_screen/unboarding.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/main_screen.dart';


class OnBoarding extends StatefulWidget {
  // final SharedPreferences sharedPreferences;

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void submit (){
  //   widget.sharedPreferences.setBool('isFirstTime', true).then((value) =>
  //       context.pushRoute(LayoutRoute()));
  // }

  @override
  Widget build(BuildContext context) {
    List<UnbordingContent> contents = [
      UnbordingContent(
          title: S.of(context)!.discoverIncredible,
          image: 'assets/images/Onbording 1.png',
          discription: S.of(context)!.experiencesWorldwide),
      UnbordingContent(
          title: S.of(context)!.startPlanningYourEvents,
          image: 'assets/images/Onbording 2.png',
          discription: S.of(context)!.distinctiveAndExcitingActivities),
      UnbordingContent(
          title: S.of(context)!.chooseYourExperiences,
          image: 'assets/images/Onbording 3.png',
          discription: S.of(context)!.startPlanningYourEvents),
      UnbordingContent(
        title: S.of(context)!.areYouReady,
        image: 'assets/images/Onbording 4.png',
        discription: S.of(context)!.createExcitement,
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              PageView.builder(
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, currentIndex) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                contents[currentIndex].image,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 330.h),
                            Text(
                              contents[currentIndex].title,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              contents[currentIndex].discription,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            SizedBox(height: 100.h),
                            if (currentIndex == 3)
                              CustomActionButton(
                                  text: S.of(context)!.getStarted,
                                  borderRadius: BorderRadius.circular(12.r),
                                  backGroundColor: AppColors.textAndBackgroundColorButton,
                                  style: Theme.of(context).textTheme.displayMedium,
                                  width: 400.w,
                                  height: 55.h,
                                  onTap: () {
                                    finishNavigate(
                                      context: context,
                                      screen: MainScreen( )
                                    );
                                    // _controller.nextPage(
                                    //   duration: const Duration(milliseconds: 100),
                                    //   curve: Curves.bounceIn,
                                    // );
                                  }),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 260.h,
                      child: Center(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(height: 200.h),
                    if (currentIndex != 3)  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                            (index) => buildDot(index, context),
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(S.of(context)!.alreadyHaveAnAccount, style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white)),
                      DefaultTextButton(
                        textColor: Colors.white,
                        onPressed: () {
                          finishNavigate(
                            context: context,
                            screen: MainScreen()
                          );
                        },

                        text: S.of(context)!.getStarted,
                      )
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 3.h),
      height: 10.h,
      width: currentIndex == index ? 25.w : 10.w,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.textAndBackgroundColorButton : AppColors.white,
          shape: BoxShape.circle),
    );
  }
}
