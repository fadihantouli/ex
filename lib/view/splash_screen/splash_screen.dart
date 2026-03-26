import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xvisa/controller/force_update.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/home/home_screen.dart';
import 'package:xvisa/view/home/main_screen.dart';
import 'package:xvisa/view/splash_screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      if(CacheHelper.getString("token") != "" && CacheHelper.getString("token") != null){
        finishNavigate(
            context: context,
            screen: MainScreen()
        );
      }else{
        finishNavigate(
            context: context,
            screen:   OnBoarding()
        );
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("TOKEN IS --> ${CacheHelper.getString("token")}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Welcome animation logo.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            SizedBox(
              height: 750.h,
              child: Image.asset("assets/images/logo.png")
            )
          ],
        ),
      ),
    );
  }
}
