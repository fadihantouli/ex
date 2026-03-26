import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/languag_cubit/loce_cubit.dart';
import 'package:xvisa/controller/languag_cubit/loce_state.dart';
import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/utills/app_theme/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controller/force_update.dart';
import 'shared/local/cach_helper.dart';
import 'shared/remote/dio.dart';
import 'view/splash_screen/splash_screen.dart';
import '../../generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ForceUpdateController forceUpdateController=Get.put(ForceUpdateController());

  await CacheHelper.init();
  await DioHelper.initail();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final designSize = const Size(300, 800);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()..getSavedLanguage(),),
        BlocProvider(create: (context) => CountryAndCityCubit()..getCountry()..getCity(),),
        BlocProvider(create: (context) => ProfileCubit())
      ],
      child: BlocBuilder<LanguageCubit, languageStates>(
        builder: (context, state) {
          print(CacheHelper.getString('token'));
          print(CacheHelper.getString('LOCALE'));
          if (state is changeLanguageState) {
            return ScreenUtilInit(
              designSize: designSize,
              fontSizeResolver: (fontSize, instance) {
                final display = View.of(context).display;
                final screenSize = display.size / display.devicePixelRatio;
                final scaleWidth = screenSize.width / designSize.width;
                return fontSize * scaleWidth;
              },
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                    theme: appTheme(),
                  builder: (context, child) => ResponsiveBreakpoints.builder(
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                    ],
                    child: child!,
                  ),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  //qusai
                  supportedLocales: [    Locale('en'),
                    Locale('ar'),],
                  locale: state.locale,
                    title: "ex visa",
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
