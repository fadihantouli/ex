import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/controller/profile_cubit/state.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/widgets/custpm_card.dart';
import 'package:xvisa/widgets/no_internet.dart';

class MyBookingScreen extends StatelessWidget {
  bool? arrow = true;

  MyBookingScreen({this.arrow});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        ProfileCubit()
          ..getBooking(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ProfileCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      S.of(context)!.myBooking,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xff1D1B23),
                          fontSize: 16),
                    ),
                    centerTitle: true,
                    leading: (arrow == true)
                        ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ))
                        : Container(),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                        // Container(
                        //   width: double.infinity,
                        //   alignment: Alignment.center,
                        //   child: CircleAvatar(
                        //     radius: 45,
                        //     backgroundColor: Colors.grey,
                        //     child: Container(
                        //       height: 76,
                        //       width: 76,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //           color: Color(0xff61461B),
                        //           shape: BoxShape.circle
                        //       ),
                        //       child: Text("MB", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 25,),
                        ListView.separated(
                        padding: EdgeInsets.zero,
                            reverse: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                            state is! GetBookingLoading
                                ? Row(
                              children: [
                                //

                                Expanded(
                                  child: cardWidget(
                                      null,
                                      Container(
                                          padding:
                                          EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(

                                                    child: Container(width: MediaQuery.sizeOf(context).width/2,
                                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(height: 5,),
                                                          Text(
                                                              S.of(
                                                                  context)!
                                                                  .country,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  15)),
                                                          Text(
                                                            cubit
                                                                .visaBooking[index]['visa']
                                                            [
                                                            'country']
                                                            [
                                                            'name']['ar'],
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff9FA2AB),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontSize:
                                                                13),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  // SizedBox(width: MediaQuery.sizeOf(context).width/2.3,),
                                                  Container(width: MediaQuery.sizeOf(context).width/2.8,
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        7),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          S.of(
                                                              context)!
                                                              .startDate,
                                                          style: TextStyle(
                                                              fontSize:
                                                              15),
                                                        ),
                                                        Text(
                                                          (cubit
                                                              .visaBooking[index]['start_date'] !=
                                                              null)
                                                              ? cubit
                                                              .visaBooking[index]
                                                          [
                                                          'start_date']
                                                              : "0",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff9FA2AB),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              13),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    S.of(
                                                        context)!
                                                        .visaType,
                                                    style: TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    cubit.visaBooking[
                                                    index]
                                                    [
                                                    'visa_type']
                                                    [
                                                    'title']['ar'],
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff1D1B23),
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(height: 5,)
                                                ],
                                              )
                                            ],
                                          )),
                                      null,
                                      null),
                                )
                              ],
                            )
                                : Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: double.infinity,
                                height:
                                100.0, // Adjust height as needed
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Adjust if needed
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  height: 20,
                                ),
                            itemCount: state is! GetBookingLoading
                                ? cubit.visaBooking.length
                                : 3),
                        if (state is! GetBookingLoading)
                    SizedBox(
                    height: 20,
                  ),





                  ListView.separated(
                  padding: EdgeInsets.zero,
                  reverse: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => state
              is! GetBookingLoading
              ? Row(


              children: [




              Expanded(
              child: cardWidget(
              null,
              Container(
              padding:
              EdgeInsets.symmetric(
              horizontal: 10),
              child: Column(
              mainAxisAlignment:
              MainAxisAlignment
                  .start,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
              Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .start,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
              Container(

              child: Container(width: MediaQuery.sizeOf(context).width/2,
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 5,),
                Text(
                S.of(
                context)!
                    .academics,
                style: TextStyle(
                fontSize:
                15)),
                Text(
                cubit.academyBooking[index]
                ['academy']['title']['ar'],
                style: TextStyle(
                color: Color(0xff9FA2AB),
                fontWeight: FontWeight.w500,
                fontSize: 13),
                ),
                ],
                ),
              ),
              ),

              // SizedBox(width: MediaQuery.sizeOf(context).width/2.3,),
              Container(width: MediaQuery.sizeOf(context).width/2.8,
              padding: EdgeInsets
                  .symmetric(
              horizontal:
              7),
              child: Column(
              children: [
              Text(
              S.of(
              context)!
                  .startDate,
              style: TextStyle(
              fontSize:
              15),
              ),
              Text(
              (cubit.academyBooking[index]
              ['start_date'] !=
              null)
              ? cubit.academyBooking[index]
              ['start_date']
                  : "0",
              style: TextStyle(
              color: Color(0xff9FA2AB),
              fontWeight: FontWeight.w500,
              fontSize: 13),
              ),
              ],
              ),
              ),
              ],
              ),
              Column(
              mainAxisAlignment:
              MainAxisAlignment
                  .start,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
              Text(
              S.of(
              context)!
                  .totalPrice,
              style: TextStyle(
              fontSize: 15),
              ),
              Text(
              cubit.academyBooking[index]
              ['total_price'],
              style: TextStyle(
              color: Color(0xff1D1B23),
              fontWeight: FontWeight.w500,
              fontSize: 14),
              ),
              SizedBox(height: 5,)
              ],
              )
              ],
              )),
              null,
              null),
              )
,
              //
              //
              // Container(
              // width:
              // MediaQuery.sizeOf(context).width *
              // 0.3,
              // child: Text(
              // cubit.academyBooking[index]
              // ['academy']['title']['ar'],
              // style: TextStyle(
              // color: Color(0xff9FA2AB),
              // fontWeight: FontWeight.w500,
              // fontSize: 13),
              // )),
              // Text(
              // (cubit.academyBooking[index]
              // ['start_date'] !=
              // null)
              // ? cubit.academyBooking[index]
              // ['start_date']
              //     : "0",
              // style: TextStyle(
              // color: Color(0xff9FA2AB),
              // fontWeight: FontWeight.w500,
              // fontSize: 13),
              // ),
              // Text(
              // cubit.academyBooking[index]
              // ['total_price'],
              // style: TextStyle(
              // color: Color(0xff1D1B23),
              // fontWeight: FontWeight.w500,
              // fontSize: 14),
              // ),
              ],
              )
                  : Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
              width: double.infinity,
              height: 100.0, // Adjust height as needed
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
              8.0), // Adjust if needed
              ),
              ),
              ),
              separatorBuilder: (context, index) => SizedBox(
              height: 20,
              ),
              itemCount: state is! GetBookingLoading
              ? cubit.academyBooking.length
                  : 3),
              if (state is GetBookingSuccess &&
              cubit.academyBooking.isEmpty &&
              cubit.visaBooking.isEmpty)
              Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              alignment: Alignment.center,
              child: Text(
              S.of(context)!.noReservations),
              ),
              if (state is GetBookingError)
              Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [NoInternetConnectionWidget(context)],
              ),
              ),
              ],
              )
              ,
              )
              ,
              )
              ,
              );
            }));
  }
}
