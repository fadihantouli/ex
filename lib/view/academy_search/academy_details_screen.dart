import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/controller/academy/academy_cubit/cubit.dart';
import 'package:xvisa/controller/academy/academy_cubit/state.dart';
import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/academy_search/widget/academy_body_widget.dart';
import 'package:xvisa/view/academy_search/widget/academy_details_appbar_widget.dart';
import 'package:xvisa/view/academy_search/widget/book_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/view/payment/webview_screen.dart';

import '../../widgets/no_internet.dart';

class AcademyDetailsScreen extends StatelessWidget {
  final id;
  const AcademyDetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AcademyCubit()..getOneAcademy(id),),
      BlocProvider(create: (context) => ServiceCubit()),
    ], child: BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if(state is PostPaymentSuccessState){
          navigateTo(
              context: context,
              screen: WebViewStack(url: state.url,)
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<AcademyCubit, AcademyStates>(
          listener: (context, state) {
            if(state is BookAcademySuccessStates){
              ServiceCubit.get(context).postPayment(
                  CustomerEmail: CacheHelper.getString("user-email"),
                  CustomerMobile: CacheHelper.getString("user-phone"),
                  InvoiceValue: (AcademyCubit.get(context).generalCourseCheckPrice != null &&AcademyCubit.get(context).generalCourseCheckPrice!= null)?"${int.parse(AcademyCubit.get(context).generalCourseCheckPrice.toString().split('.')[0]) + int.parse(AcademyCubit.get(context).generalHouseCheckPrice.toString().split('.')[0])}" : 0,
                  CustomerName: CacheHelper.getString("user-name"),
                  type: "academy",
              );
            }

          },
          builder: (context, state) {
            var cubit = AcademyCubit.get(context);
            if(state is GetOneAcademyLoadingStates){
              return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }if(cubit.nameAr != null && cubit.imagePath != null){
              return Scaffold(
                body: Directionality(
                  textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        AcademyDetailsAppbarWidget(
                          image: cubit.imagePath,
                        lat: cubit.lat.toString(),
                          long: cubit.long.toString(),
                          name: CacheHelper.getString("language") == "ar"?cubit.nameAr.toString():cubit.nameEn.toString(),
                          location:CacheHelper.getString("language") == "ar"? "${cubit.addressCountryAr}, ${cubit.addressCityAr}":"${cubit.addressCountryEn}, ${cubit.addressCityEn}",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 25),
                          child: Column(
                            crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                            children: [
                              Html(
                                  data: cubit.descriptionAr ??'',
                                  style: {
                                    "p": Style(
                                      color: Color(0xff8D94A2),
                                      fontSize: FontSize(14), // Adjust font size for better visibility
                                      fontWeight: FontWeight.w400,
                                    ),
                                  }),
                              const SizedBox(height: 40,),
                              if(cubit.accreditation.isNotEmpty)Text(S.of(context)!.certifiedBy,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff2A2A2A),
                                  ),
                                ),
                              if(cubit.accreditation.isNotEmpty)  const SizedBox(height: 10,),
                              if(cubit.accreditation.isNotEmpty) GridView.builder(
                                padding: const EdgeInsets.all(8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns in the grid
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 3.5, // Adjust this to change item height
                                ),
                                itemCount: cubit.accreditation.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: cubit.accreditation[index]['image_path'] != null
                                                ?cubit.accreditation[index]['image_path'].contains(".svg")?
                                            SvgPicture.network(
                                              cubit.accreditation[index]['image_path'],
                                              fit: BoxFit.cover,
                                              height: 30,
                                              width: 20,
                                            )
                                            :Image.network(
                                              cubit.accreditation[index]['image_path'],
                                              fit: BoxFit.cover,
                                              height: 30,
                                              width: 20,
                                            )
                                                : const Icon(Icons.image, size: 50),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.2,
                                          child: Text(
                                            CacheHelper.getString("language") == "ar" ? cubit.accreditation[index]['title']['ar']:cubit.accreditation[index]['title']['en'] ?? 'No Name',
                                            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff606060)),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10,),
                              if(cubit.academyServices.isNotEmpty)
                                Text(S.of(context)!.features,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2A2A2A),
                                ),
                              ),
                              if(cubit.academyServices.isNotEmpty) const SizedBox(height: 10,),
                              if(cubit.academyServices.isNotEmpty)  GridView.builder(
                                padding: const EdgeInsets.all(8),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns in the grid
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 3.5, // Adjust this to change item height
                                ),
                                itemCount: cubit.academyServices.length,
                                itemBuilder: (context, index2) {
                                  return Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: cubit.academyServices[index2]['image_path'] != null
                                              ?(cubit.academyServices[index2]['image_path'].contains(".svg"))?
                                          SvgPicture.network(
                                            cubit.academyServices[index2]['image_path'],
                                            fit: BoxFit.scaleDown,
                                            height: 30,
                                            width: 20,
                                          )
                                              :Image.network(
                                            cubit.academyServices[index2]['image_path']!,
                                            fit: BoxFit.scaleDown,
                                            height: 30,
                                            width: 20,
                                          )
                                              : const Icon(Icons.image, size: 50),
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.2,
                                          child: Text(
                                            CacheHelper.getString("language") == "ar" ?cubit.academyServices[index2]['name']['ar']:cubit.academyServices[index2]['name']['en'] ?? S.of(context)!.noName,
                                            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff606060)),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              AcademyBodyWidget(
                                course: cubit.courses,
                                housing: cubit.housings,
                                insurance: cubit.insurances,
                                reception: cubit.receptions,
                              ),
                              const SizedBox(height: 20,),
                              if(cubit.attachment.isNotEmpty) SizedBox(
                                height: 250,
                                child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => (cubit.attachment[index]['images'].isNotEmpty)?ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: SizedBox(
                                        height: 250,
                                        child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index1) => ClipRRect(
                                              borderRadius: BorderRadius.circular(9),
                                              child: (cubit.attachment[index]['images'][index1]['path'].contains(".svg"))?
                                              SvgPicture.network(
                                                cubit.attachment[index]['images'][index1]['path'],
                                                width: 250,
                                                height: 250,
                                                fit: BoxFit.cover,
                                              )
                                                  :Image.network(
                                                '${cubit.attachment[index]['images'][index1]['path']}',
                                                width: 250,
                                                height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            separatorBuilder: (context, index) => const SizedBox(width: 15,),
                                            itemCount: cubit.attachment[index]['images'].length
                                        ),
                                      ),
                                    ): const SizedBox.shrink(),
                                    separatorBuilder: (context, index) => const SizedBox(width: 15,),
                                    itemCount: cubit.attachment.length
                                ),
                              ),
                              const SizedBox(height: 20,),
                              if(state is BookAcademyLoadingStates)const Center(child: CircularProgressIndicator(),),
                              if(state is! BookAcademyLoadingStates) DefaultCustomButton(title: S.of(context)!.bookNow, onPressed: ()async {
                                cubit.bookAcademy(
                                    start_date: cubit.generalCourseCheckStartDate.toString(),
                                    end_date: cubit.generalCourseCheckStartDate.toString(),
                                    context: context,
                                    user_id: CacheHelper.getInt("user_id"),
                                    academy_id: id.toString(),
                                    course_id: cubit.generalCourseCheckId.toString(),
                                    housing_id: cubit.generalHouseCheckId.toString(),
                                    insurance_id: cubit.generalInsuranceCheckId.toString(),
                                    reception_id: cubit.generalReceptionCheckId.toString(),
                                    total_price: (cubit.generalCourseCheckPrice != null &&cubit.generalCourseCheckPrice!= null)?"${int.parse(cubit.generalCourseCheckPrice.toString().split('.')[0]) + int.parse(cubit.generalHouseCheckPrice.toString().split('.')[0])}" : 0
                                );
                              },)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }if(state is GetOneAcademyErrorStates && cubit.nameAr == null && cubit.imagePath == null){
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
            }else{
              return Container();
            }
          },
        );
      },
    ));
  }
}
