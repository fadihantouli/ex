import 'package:xvisa/controller/visa_cubit/cubit.dart';
import 'package:xvisa/controller/visa_cubit/states.dart';
import 'package:xvisa/model/get_visa_model.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/view/best_vise_form1/best_visa_form_one_screen.dart';
import '../../utills/alert_widget.dart';

class BestVisaScreen extends StatefulWidget {
  final countryName;
  var adultPrice = 0;
  var childPrice = 0;
  final id;
  List? finger;
  var visaTypes;
  bool fromAll = false;
   BestVisaScreen({super.key,required this.fromAll, this.countryName, this.id, this.visaTypes, required this.finger});

  @override
  State<BestVisaScreen> createState() => _BestVisaScreenState();
}

class _BestVisaScreenState extends State<BestVisaScreen> {
  String? selectVisaType;
  String? selectVisaInterview;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => VisaCubit()..getCities(),
    child: BlocConsumer<VisaCubit, VisaState>(
      listener: (context, state) {
        if(state is PostVisa1SuccessStates){
          navigateTo(
            screen: BestVisaFormOneScreen(),
            context: context
          );
        }
      },
      builder: (context, state) {
        print("TUPES is ---> ${widget.visaTypes}");
        var cubit = VisaCubit.get(context);
        print("value -> ${widget.finger}");
        print("value -> ${widget.finger is List}");
        if(state is GetCitiesLoadingStates){
          return const Scaffold(body: Center(child: CircularProgressIndicator(color: const Color(0xff61461B)),),);
        }else{
          return defaultScaffold(
              context: context,
              body: Directionality(
                textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                      children: [
                        Text(S.of(context)!.youCanSubmitVisa,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),
                          textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                        ),
                        const SizedBox(height: 10,),
                        Text("${widget.countryName} ${S.of(context)!.empassyRequire}",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff333333)),

                          // style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff00A6E7)),
                        textAlign: CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                        ),
                        const SizedBox(height: 15,),
                        Text(S.of(context)!.selectVisaType, style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 20,),

                       if(widget.fromAll == false) buildDropdownButton(
                          onChange: (value) {
                            var selectedVisa = widget.visaTypes.firstWhere(
                                  (visa) => visa['id'].toString() == value,
                              orElse: () => null,
                            );
                            if (selectedVisa != null) {
                              print("price_adult: ${selectedVisa['pivot']['price_adult']}");
                              setState(() {

                                cubit.selectVisaType = value.toString();
                                widget.adultPrice = selectedVisa['pivot']['price_adult'];
                                widget.childPrice = selectedVisa['pivot']['price_child'];
                              });
                            }
                          },
                          hint: S.of(context)!.visaType,
                          item: widget.visaTypes != null
                              ? widget.visaTypes.map<DropdownMenuItem<String>>((dynamic value) {
                            if (value['id'] != null && value['title'] != null && value['title']['ar'] != null) {
                              return DropdownMenuItem<String>(
                                value: value['id'].toString(),
                                child: Text(
                                  CacheHelper.getString("language") == "ar" ? value['title']['ar'].toString():value['title']['en'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000).withOpacity(0.74),
                                  ),
                                ),
                              );
                            } else {
                              return DropdownMenuItem<String>(
                                value: '',
                                child: Text('Invalid Data'),
                              );
                            }
                          }).toList()
                              : [],
                          value:  cubit.selectVisaType,
                        ),
                        if(widget.fromAll == true) buildDropdownButton(
                          onChange: (value) {
                            var selectedVisa = widget.visaTypes.firstWhere(
                                  (visa) => visa.id.toString() == value,
                              orElse: () => VisaTypes(id: 0, title: Name(ar: 'N/A', en: 'N/A'), pivot: Pivot(priceAdult: 0, priceChild: 0)),
                            );

                            if (selectedVisa != null) {
                              print("price_adult: ${selectedVisa.pivot.priceAdult}");
                              setState(() {
                                cubit.selectVisaType = value.toString();
                                widget.adultPrice = selectedVisa.pivot.priceAdult;
                                widget.childPrice = selectedVisa.pivot.priceChild;
                              });
                            }
                          },
                          hint: S.of(context)!.visaType,
                          item: widget.visaTypes != null
                              ? widget.visaTypes.map<DropdownMenuItem<String>>((dynamic value) {
                            if (value.id != null && value.title != null && value.title.ar != null) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(
                                  CacheHelper.getString("language") == "ar" ? value.title.ar.toString():value.title.en.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000).withOpacity(0.74),
                                  ),
                                ),
                              );
                            } else {
                              return DropdownMenuItem<String>(
                                value: '',
                                child: Text('Invalid Data'),
                              );
                            }
                          }).toList()
                              : [],
                          value:  cubit.selectVisaType,
                        ),
                        const SizedBox(height: 20,),
                        Text(S.of(context)!.whatIsYourExpectedTravelDate, style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 20,),
                        buildTextFieldDate(labelText: VisaCubit.get(context).selectedDate ?? S.of(context)!.travelDate, onTap: ()async{
                          await VisaCubit.get(context).selectDate(context);
                        }),
                        if(widget.finger!.isNotEmpty && widget.finger is List) const SizedBox(height: 20,),
                        if(widget.finger!.isNotEmpty&& widget.finger is List) Text(S.of(context)!.interviewPlace, style: Theme.of(context).textTheme.bodyMedium,),
                        if(widget.finger!.isNotEmpty&& widget.finger is List) const SizedBox(height: 20,),
                        if(widget.finger!.isNotEmpty&& widget.finger is List)
                          buildDropdownButton(
                            onChange: (value) {
                              setState(() {
                                cubit.selectVisaInterview = value;
                              });
                            },
                            hint: S.of(context)!.neededCity,
                            item: widget.finger!.map((value) {
                              return DropdownMenuItem(
                                value: (widget.fromAll == true)? value.id.toString() :value['id'].toString,
                                child: Text(
                                  (widget.fromAll == true)?
                                  CacheHelper.getString("language") == "ar" ? value.cityName!.ar.toString():value.cityName!.en.toString()
                                 : CacheHelper.getString("language") == "ar" ? value['city_name']['ar'].toString():value['city_name']['en'].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)
                                          .withOpacity(0.74)),
                                ),
                              );
                            }).toList(),
                            value: cubit.selectVisaInterview),
                        const SizedBox(height: 20,),
                        Text(S.of(context)!.numberOfTickets, style: Theme.of(context).textTheme.bodyMedium,),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(S.of(context)!.adult, style: Theme.of(context).textTheme.bodyLarge,),
                                const SizedBox(height: 5,),
                                 Text(S.of(context)!.aboveyrs, style: TextStyle(color: Color(0xff8E8E8E), fontSize: 8, fontWeight: FontWeight.w400),),

                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(cubit.adultCount != 0){
                                        cubit.adultCount--;
                                      }
                                    });
                                  },
                                  child: const CircleAvatar(
                                    // backgroundColor: Color(0xffD2EAFF),
                                    backgroundColor: Color(0xff61461B),
                                    child: Text("-", style: TextStyle(fontSize: 30,

                                        // color: Color(0xff027FEE)
                                        color: Colors.white
                                        , fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Text("${cubit.adultCount}", style: Theme.of(context).textTheme.bodyLarge,),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      cubit.adultCount++;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    // backgroundColor: Color(0xffD2EAFF),
                                    backgroundColor: Color(0xff61461B),

                                    child: Icon(Icons.add,
                                      color: Colors.white

                                      // color: Color(0xff027FEE)

                                      ,),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              (cubit.selectVisaType == "tourism") ? "\ ${S.of(context)!.sar} ${cubit.adultCount * widget.adultPrice}" :"\ ${S.of(context)!.sar} ${cubit.adultCount * widget.adultPrice}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Color(0xffD9D9D9),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                              children: [
                                Text(S.of(context)!.children, style: Theme.of(context).textTheme.bodyLarge,),
                                const SizedBox(height: 5,),
                                 Text(S.of(context)!.underyrs, style: TextStyle(color: Color(0xff8E8E8E), fontSize: 8, fontWeight: FontWeight.w400),),

                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      cubit.childCount--;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Color(0xff61461B),

                                    // backgroundColor: Color(0xffD2EAFF),
                                    child: Text("-", style: TextStyle(fontSize: 30,
                                        color: Colors.white

                                        // color: Color(0xff027FEE)
                                        , fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Text("${cubit.childCount}", style: Theme.of(context).textTheme.bodyLarge,),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      cubit.childCount++;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Color(0xff61461B),

                                    // backgroundColor: Color(0xffD2EAFF),
                                    child: Icon(Icons.add,
                                      color: Colors.white
                                      // color: Color(0xff027FEE)
                                      ,),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              (cubit.selectVisaType == "tourism") ? "\ ${S.of(context)!.sar} ${cubit.childCount * widget.childPrice}" :"\ ${S.of(context)!.sar} ${cubit.childCount * widget.childPrice}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(color: Color(0xffD9D9D9),),
                        ),
                        buildDropdownButton(
                            onChange: (value) {
                              if(value == S.of(context)!.onePersonOfQuantity){
                                cubit.selectTypeRelationshipTravelersId = 0;
                              }else if(value == S.of(context)!.family){
                                cubit.selectTypeRelationshipTravelersId = 1;
                              }else if(value == S.of(context)!.friends){
                                cubit.selectTypeRelationshipTravelersId = 2;
                              }else if(value == S.of(context)!.other){
                                cubit.selectTypeRelationshipTravelersId = 3;
                              }
                              setState(() {
                                cubit.selectTypeRelationshipTravelers = value;
                              });
                            },
                            hint: S.of(context)!.typeRelationshipTravelers,
                            item: [S.of(context)!.onePersonOfQuantity,
                              S.of(context)!.family,
                              S.of(context)!.friends,
                              S.of(context)!.other
                            ].map((value) {
                              return DropdownMenuItem(
                                value: value.toString(),
                                child: Text(
                                  value.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)
                                          .withOpacity(0.74)),
                                ),
                              );
                            }).toList(),
                            value: cubit.selectTypeRelationshipTravelers),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context)!.totalAmount, style: Theme.of(context).textTheme.bodyLarge,),
                            Text(
                              (cubit.selectVisaType == "tourism") ? "\ ${S.of(context)!.sar} ${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}" : "${S.of(context)!.sar} ${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],),
                        const SizedBox(height: 20,),
                        Container(
                          height: 53,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  offset:  Offset(0, 8),
                                  color:  Color(0xff000000).withOpacity(0.08),spreadRadius: 0,
                                  blurRadius: 16)
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/ticket-discount.svg"),
                              const SizedBox(width: 20,),
                              Text(S.of(context)!.haveCoupon, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_sharp)
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: buildTextField(
                                    S.of(context)!.coupon,
                                    cubit.couponController,
                                    containerWidth: MediaQuery.sizeOf(context).width * 0.62)
                            ),
                            const SizedBox(width: 10,),
                            if(state is PostVisaCouponLoadingStates)Center(
                              child: CircularProgressIndicator(),
                            ),
                              if(state is! PostVisaCouponLoadingStates) Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                child: DefaultCustomButton(
                                  title: S.of(context)!.apply,
                                  onPressed: (){
                                    if(cubit.selectVisaType == null){
                                      return AlertsService.warning(
                                          context: context,
                                          message: 'يجب اختيار نوع الفيزا',
                                          title: 'تحذير');
                                    }
                                    cubit.postVisaCoupon(
                                      context: context,
                                      visaId: widget.id,
                                      visaTypeId: cubit.selectVisaType.toString(),
                                    );
                                  }, containerWidth: 90,)
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          children: [
                            if(state is PostVisaCouponLoadingStates) Center(child: CircularProgressIndicator(),),
                           if(state is! PostVisaCouponLoadingStates) Text(
                             (cubit.couponRatio != null)?
                             (cubit.selectVisaType == "tourism") ? "\ ${S.of(context)!.sar} ${(cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice) * cubit.couponRatio /100}" : "${S.of(context)!.sar} ${(cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice) * cubit.couponRatio /100}"
                                 :(cubit.selectVisaType == "tourism") ? "\ ${S.of(context)!.sar} ${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}" : "${S.of(context)!.sar} ${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),),
                            const Spacer(),
                            if(state is! PostVisa1LoadingStates)  DefaultCustomButton(
                              title: S.of(context)!.nextStep,
                              onPressed: (){
                                cubit.postVisaCheckout1(
                                  type_relationship_travelers: cubit.selectTypeRelationshipTravelersId ,
                                  context: context,
                                  visa_id: widget.id,
                                  user_id: CacheHelper.getInt("user_id"),
                                  city_id: cubit.selectVisaInterview,
                                  quantity_adult: cubit.adultCount.toString(),
                                  quantity_child: cubit.childCount.toString(),
                                  start_date: cubit.selectedDate.toString(),
                                  visa_type_id: cubit.selectVisaType.toString(),
                                  finger_print_id: cubit.selectVisaInterview ?? null,
                                  coupon_price: (cubit.couponRatio != null) ?cubit.couponRatio.toString() : null,
                                  coupon: (cubit.couponController.text.isNotEmpty) ?cubit.couponController.text : null,
                                  total_price: (cubit.selectVisaType == "tourism") ? "${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}" : "${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}",
                                );
                            }, containerWidth: 150,)
                          ],
                        ),
                        const SizedBox(height: 40,),
                         Center(child: Text(S.of(context)!.priceIncludes,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                              color: Color(0xff333333)
                              // color: Color(0xff2095FD)
                            ,
                          ),
                           textAlign:CacheHelper.getString("language") == "ar" ? TextAlign.start :TextAlign.end,
                        )),
                        const SizedBox(height: 40,),
                        if(state is PostVisa1LoadingStates)const Center(child: CircularProgressIndicator(color: const Color(0xff61461B),),),
                        if(state is! PostVisa1LoadingStates)DefaultCustomButton(
                          title: S.of(context)!.submitNow,
                          onPressed: ()async {
                          cubit.postVisaCheckout1(
                            context: context,
                            coupon_price: (cubit.couponRatio != null) ?cubit.couponRatio.toString() : null,
                            visa_id: widget.id,
                            user_id: CacheHelper.getInt("user_id"),
                            type_relationship_travelers: cubit.selectTypeRelationshipTravelersId ,
                            city_id: cubit.selectVisaInterview ,
                            quantity_adult: cubit.adultCount.toString(),
                            quantity_child: cubit.childCount.toString(),
                            start_date: cubit.selectedDate.toString(),
                            visa_type_id: cubit.selectVisaType.toString(),
                            finger_print_id: cubit.selectVisaInterview ?? null,
                            coupon: (cubit.couponController.text.isNotEmpty) ?cubit.couponController.text : null,
                            total_price: (cubit.selectVisaType == "tourism") ? "${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}" : "${cubit.childCount * widget.childPrice + cubit.adultCount * widget.adultPrice}",
                          );
                        },)
                      ],
                    ),
                  ),
                ),
              )
          );
        }
      },
    ),
    );
  }
}
