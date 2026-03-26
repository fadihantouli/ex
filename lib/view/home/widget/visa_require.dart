import 'package:xvisa/model/get_home_model.dart';
import 'package:xvisa/model/visa_details_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:xvisa/view/best_visa/best_visa_screen.dart';
import 'package:xvisa/view/best_visa/visa_view_all.dart';
import 'package:xvisa/view/login_dialog.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/view/home/widget/custom_container_visa.dart';
import 'package:xvisa/view/home/widget/custom_row_title.dart';
import 'package:xvisa/view/home/widget/visa_require_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisaRequire extends StatelessWidget {
  VisaRequire({super.key, required this.visas, this.require });
  final List? visas;
  bool? require = false;
  bool checkIfHaveToken(){
    String token=  CacheHelper.getString("token");
    return token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> VisaViewAll(visaRequire: true,)));

              else
                showLoginDialog(context);
            },
            text: S.of(context)!.visasRequirments,
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
                return GestureDetector(
                  onTap: (){
                if(checkIfHaveToken())
                  {
                    print(visas![index]['visa_detail']);
                    VisaDetailsModel visaDetailsModel = VisaDetailsModel.fromJson(visas![index]['visa_detail']);
                    navigateTo(
                        screen:  VisaRequireScreen(visaDetail: visaDetailsModel,
                          countryImage: visas![index]['country']['image_path'],
                          visa: visas![index],
                        ),
                        context: context
                    );
                  }else
                    showLoginDialog(context);
                  },
                  child: CustomContainerVisa(
                    width: 200.0.w,
                    require : true,
                    countryImage: visas![index]['country']['logo_path'],
                    countryName: CacheHelper.getString("language") == "ar"?visas![index]['country']['name']['ar']:visas![index]['country']['name']['en'] ,
                    imageName: visas![index]['country']['image_path'] ,
                    //isTrip: false,
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
