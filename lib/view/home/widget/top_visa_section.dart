 import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
 import 'package:xvisa/view/best_visa/best_visa_screen.dart';
import 'package:xvisa/view/best_visa/visa_view_all.dart';
 import 'package:xvisa/view/home/widget/custom_container_visa.dart';
import 'package:xvisa/view/home/widget/custom_row_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/view/login_dialog.dart';
import '../../../generated/l10n.dart';

class TopVisaSection extends StatelessWidget {
   TopVisaSection({super.key, required this.visas, this.require});

  final List? visas;
  bool? require = false;
   bool checkIfHaveToken(){
     String token=  CacheHelper.getString("token");
     return token.isNotEmpty;
   }
  @override
  Widget build(BuildContext context) {
    visas!.forEach((e){
      if(e['country']['image_path'].contains(".svg")){
        print("CONATINNN");
      }else{
        print("NOT CONTAINSSSS");
      }
    });
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 10.0.w,
            end: 10.0.w,
            bottom: 10.0.h,
          ),
          child: CustomRowTitle(
            viewAll: true,
            onPressed: () {
              if(checkIfHaveToken())
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VisaViewAll(visaRequire: false,)));

              else
                showLoginDialog(context);
            },
            text: S.of(context)!.discoverTheBestVisas,
          ),
        ),
        SizedBox(
          height: 150.0.h,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.0.w),
              scrollDirection: Axis.horizontal,
              itemCount: visas!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // context.push(
                    //   AppRoutesString.cityDestinationScreen,
                    //   extra: visas[index].id,
                    // );
                  },
                  child: GestureDetector(
                    onTap: (){
                      if(checkIfHaveToken()) {
                        print(visas![index]['visa_types']);
                        print(visas![index]);
                        navigateTo(
                            screen: BestVisaScreen(
                              fromAll: false,
                              finger: visas![index]['visa_fingerprint'],
                              id: visas![index]['id'],
                              visaTypes: visas![index]['visa_types'],
                              countryName: visas![index]['country']['name']['en'],
                            ),
                            context: context
                        );
                      }
                      else{
                        showLoginDialog(context);
                      }
                    },
                    child: CustomContainerVisa(
                      require: true,
                      width: 200.0.w,
                      countryImage: visas![index]['country']['logo_path'],
                      countryName: CacheHelper.getString("language") == "ar"?visas![index]['country']['name']['ar']:visas![index]['country']['name']['en'] ,
                      imageName: visas![index]['country']['image_path'] ,
                      //isTrip: false,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.0.w,
                );
              }),
        ),
      ],
    );
  }
}
  bool checkIfHaveToken(){
  String token=  CacheHelper.getString("token");
  return token.isNotEmpty;
}