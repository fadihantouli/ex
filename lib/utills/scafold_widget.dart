import 'package:cached_network_image/cached_network_image.dart';
import 'package:xvisa/controller/languag_cubit/loce_cubit.dart';
import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/controller/profile_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/assets.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/auth/views/login_screen.dart';
import 'package:xvisa/view/drawer_screens/about_app_screen.dart';
import 'package:xvisa/view/drawer_screens/faq_screen.dart';
import 'package:xvisa/view/drawer_screens/privacy_screen.dart';
import 'package:xvisa/view/drawer_screens/send_message_screen.dart';
import 'package:xvisa/view/drawer_screens/terms_screen.dart';
import 'package:xvisa/view/home/main_screen.dart';
import 'package:xvisa/view/login_dialog.dart';
import 'package:xvisa/view/my_booking_screen/my_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/view/profile_screen/profile_screen.dart';

defaultScaffold({body, context}) => BlocProvider(create: (context) => ProfileCubit()..getProfile(),
child: BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        drawer: DrawerWidget(),
        body: body,
        appBar: AppBar(
          surfaceTintColor: Color(0xffFFFFFF),
          title: Row(
            children: [
              Image.asset(
                AppAssets.appLogo,
                width: 63,
                height: 54,
              ),
              SizedBox(
                width: 15.0.w,
              ),
              Column(
                crossAxisAlignment:
                CacheHelper.getString("language") == "ar"
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  // Text(
                  //   "00,00  USD",
                  //   style: TextStyle(
                  //     color: AppColors.black,
                  //     fontSize: 14.0.sp,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.0.h,
                  // ),
                  Row(
                    children: [
                      Text(
                        "${S.of(context)!.hello} ",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      if (ProfileCubit.get(context).getProfileModel != null)
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            (ProfileCubit.get(context)
                                .getProfileModel!
                                .data!
                                .name!
                                .en !=
                                null)
                                ? "${ProfileCubit.get(context).getProfileModel!.data!.name!.en}".split(" ")[0]
                                : "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              )
            ],
          ),
          actions: [
            if (ProfileCubit.get(context).getProfileModel != null)
              GestureDetector(
                onTap: () {
                  navigateTo(context: context, screen: ProfileScreen());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                      imageUrl: ProfileCubit.get(context)
                          .getProfileModel!
                          .data!
                          .imagePath!,
                      height: 40.h,
                      width: 40,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                      const ShimmerAnimatedLoading(
                        circularRaduis: 50,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                      )),
                ),
              ),
            SizedBox(
              width: 8.w,
            )
          ],
        ));
  },
),
);

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    if (CacheHelper.getString('language') != null &&
        CacheHelper.getString('language') != "") {
      selectedLanguage =
          CacheHelper.getString('language') == "en" ? "English" : "عربى";
    } else {
      selectedLanguage = "English";
    }
    print("LANG IS ---> ${CacheHelper.getString('language')}");
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.appLogo,
                    width: 149,
                    height: 129,
                  ),
                  // Image.asset(
                  //   "assets/images/drawer_logo.png",
                  //   width: 149,
                  //   height: 129,
                  // ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.of(context)!.myAccount,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff61461B)),
            ),
          ),
          ListTile(
              onTap: _showLanguageDialog,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/SVG/images/language.svg'),
                  SizedBox(width: 8),
                ],
              ),
              title: Text(
                S.of(context)!.language,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined)),
          // const Divider(),
          // SwitchListTile(
          //   title: Text(S.of(context)!.notifications),
          //   value: true, // Change according to notification setting
          //   onChanged: (bool value) {
          //     // Toggle notification setting
          //   },
          //   secondary: SvgPicture.asset('assets/SVG/images/notifications.svg'),
          // ),
          const Divider(),
          ListTile(
              onTap: () {
                if(checkIfHaveToken())
                navigateTo(context: context, screen: FAQScreen());
              else
                showLoginDialog(context);
                },
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/images/about.svg',
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              title: Text(
                S.of(context)!.faq,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined)),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              S.of(context)!.help,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff61461B)),
            ),
          ),
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/SVG/images/sessionstoday.svg',
                ),
                const SizedBox(width: 8),
              ],
            ),
            title: Text(
              S.of(context)!.myBooking,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              if(checkIfHaveToken())
              navigateTo(
                  context: context,
                  screen: MyBookingScreen(
                    arrow: true,
                  ));
               else
              showLoginDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/SVG/images/Collectionsindividuals.svg',
                ),
                const SizedBox(width: 8),
              ],
            ),
            title: Text(
              S.of(context)!.sendMessage,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              if(checkIfHaveToken())
              navigateTo(context: context, screen: SendMessageScreen());
              else
                showLoginDialog(context);
              },
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              S.of(context)!.legal,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff61461B)),
            ),
          ),
          ListTile(
              onTap: () {
                navigateTo(context: context, screen: const PrivacyScreen());
              },
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/images/privacy.svg',
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              title: Text(
                S.of(context)!.privacyPolicy,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined)),
          Divider(),
          ListTile(
              onTap: () {
                navigateTo(context: context, screen: const TermsScreen());
              },
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/images/terms.svg',
                  ),
                  SizedBox(width: 8),
                ],
              ),
              title: Text(
                S.of(context)!.termsOfUsage,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined)),
          Divider(),
          SizedBox(
            height: 30,
          ),
          // ListTile(
          //     leading: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SvgPicture.asset(
          //           'assets/SVG/images/UpdateApp.svg',
          //         ),
          //         SizedBox(width: 8),
          //       ],
          //     ),
          //     title: Text(
          //       S.of(context)!.updateApp,
          //       style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          //     ),
          //     trailing: IconButton(
          //         onPressed: () {},
          //         icon: Icon(Icons.arrow_forward_ios_outlined))),
          if(checkIfHaveToken())

            const Divider(),
          // ListTile(
          //     onTap: () {
          //       navigateTo(context: context, screen: AboutAppScreen());
          //     },
          //     leading: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SvgPicture.asset(
          //           'assets/SVG/images/about.svg',
          //         ),
          //         SizedBox(width: 8),
          //       ],
          //     ),
          //     title: Text(
          //       S.of(context)!.aboutApp,
          //       style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          //     ),
          //     trailing: Icon(Icons.arrow_forward_ios_outlined)),
          if(checkIfHaveToken())

            const Divider(),

         if(checkIfHaveToken())
           ListTile(
               leading: Icon(Icons.logout),
               title: Text(S.of(context)!.logout),
               onTap: () {
                 CacheHelper.deleteData(key: 'token').then((v) {
                   finishNavigate(
                       context: context,
                       screen: MainScreen(
                       ));
                   // finishNavigate(
                   //     context: context,
                   //     screen: LoginScreen(
                   //       fromSplash: true,
                   //     ));
                 });
               }

           ),


          SizedBox(height: 20),
          const Center(
            child: Text(
              'Version 2.2.22',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text("language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text("عربي"),
                value: "عربى",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  context.read<LanguageCubit>().changeLanguage('ar');
                  setState(() {
                    selectedLanguage = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<String>(
                title: Text("English"),
                value: "English",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  context.read<LanguageCubit>().changeLanguage('en');
                  setState(() {
                    selectedLanguage = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}  bool checkIfHaveToken(){
  String token=  CacheHelper.getString("token");
  return token.isNotEmpty;
}
