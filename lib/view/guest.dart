
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xvisa/view/auth/views/login_screen.dart';
import 'package:xvisa/view/drawer_screens/privacy_screen.dart';

import '../generated/l10n.dart';
import '../shared/local/cach_helper.dart';
import '../utills/colors.dart';
import '../utills/components.dart';
import 'home/widget/top_service_section.dart';
import 'home/widget/visa_consultation_widget.dart';

class GuestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(title: Text(S.of(context).guest_page),),body:Column(children: [
     Column(
      key: const Key('curvedNavigationBar'),
      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
      children: [
   SingleChildScrollView(

     child: Column(children: [
       Padding(
           padding: EdgeInsets.symmetric(
               vertical: 10.0.h, horizontal: 15.0.h),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               defaultMenuContainer(
                   src: "assets/SVG/images/visas.svg",
                   onTap: (){
                     finishNavigate(
                         context: context,
                         screen: LoginScreen(fromSplash: true,)
                     );

                   },
                   title: S.of(context)!.visas
               ), defaultMenuContainer(
                   src: "assets/SVG/images/academies.svg",
                   onTap: (){
                     finishNavigate(
                         context: context,
                         screen: LoginScreen(fromSplash: true,)
                     );
                   },
                   title:S.of(context)!.academics
               ), defaultMenuContainer(
                   src: "assets/SVG/images/services.svg",
                   onTap: (){
                     finishNavigate(
                         context: context,
                         screen: LoginScreen(fromSplash: true,)
                     );
                   },
                   title: S.of(context)!.services
               ),
               // defaultMenuContainer(
               //   src: "assets/SVG/images/requirments.svg",
               //   title:S.of(context)!.requirements,
               //   onTap: (){
               //     navigateTo(
               //         context: context,
               //         screen: LoginScreen(fromSplash: false, )
               //     );
               //   },
               // ),
               defaultMenuContainer(
                 src: "assets/SVG/images/requirments.svg",
                 title:S.of(context)!.privacyPolicy,
                 onTap: (){
                   navigateTo(
                       context: context,
                       screen: PrivacyScreen( )
                   );
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

       Padding(
         padding: EdgeInsets.symmetric(
           horizontal: 20.0.w,
           vertical: 10.0.h,
         ),
         child: CustomActionButton(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(fromSplash: false, )));

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
     ],),
   )
       ],
              ),
   ],
   ),);
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