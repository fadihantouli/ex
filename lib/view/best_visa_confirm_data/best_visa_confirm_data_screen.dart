import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/controller/visa_booking_cubit/cubit.dart';
import 'package:xvisa/controller/visa_booking_cubit/state.dart';
import 'package:xvisa/controller/visa_cubit/cubit.dart';
import 'package:xvisa/controller/visa_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/payment/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class BestVisaConfirmDataScreen extends StatelessWidget {
  var selectedCountries;
  BestVisaConfirmDataScreen(this.selectedCountries);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VisaCubit()
              ..getOneVisaCheckout(id: CacheHelper.getInt("visa-id")),
          ),
          BlocProvider(
            create: (context) => VisaBookingCubit(),
          ),
          BlocProvider(
            create: (context) => ServiceCubit(),
          ),
        ],
        child: BlocConsumer<ServiceCubit, ServiceState>(
          listener: (context, state) {
            if(state is PostPaymentSuccessState){
              navigateTo(
                  context: context,
                  screen: WebViewStack(url: state.url,)
              );
            }
          },
          builder: (context, state) {
            return BlocConsumer<VisaCubit, VisaState>(
              listener: (context, state) {
                if(state is PostVisaBookingSuccessStates){
                  ServiceCubit.get(context).postPayment(
                      CustomerEmail: CacheHelper.getString("user-email"),
                      CustomerMobile: CacheHelper.getString("user-phone"),
                      InvoiceValue: VisaCubit.get(context).getOneVisaCheckoutModel!.data!.totalPrice,
                      CustomerName: "${VisaBookingCubit.get(context).firstNameController.text} ${VisaBookingCubit.get(context).lastNameController.text}",
                      type: "visa",
                      visa_checkout_id: CacheHelper.getInt("visa-id")
                  );
                }
              },
              builder: (context, state) {
                var cubit = VisaCubit.get(context);
                if (state is GetOneVisaLoadingStates) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return BlocConsumer<VisaBookingCubit, VisaBookingState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubits = VisaBookingCubit.get(context);
                      return defaultScaffold(
                          context: context,
                          body: (cubit.getOneVisaCheckoutModel != null)?Directionality(
                            textDirection: CacheHelper.getString("language") == "ar"? TextDirection.rtl:TextDirection.rtl,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      S.of(context)!.countryAndTypeOfVisa,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: const Color(0xff333333)),

                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "${cubit.getOneVisaCheckoutModel!.data!.visa!.country!.name!.ar} / ${cubit.getOneVisaCheckoutModel!.data!.visaType!.title!.ar}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Color(0xff333333)),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      S.of(context)!.travelHistoryAndNumberOfPassengers,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: const Color(0xff333333)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "${cubit.getOneVisaCheckoutModel!.data!.startDate}/${int.parse(cubit.getOneVisaCheckoutModel!.data!.quantityAdult!) + int.parse(cubit.getOneVisaCheckoutModel!.data!.quantityChild!)} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color:Color(0xff333333)),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context)!.totalPrice,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: const Color(0xff333333)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "${cubit.getOneVisaCheckoutModel!.data!.totalPrice}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color:Color(0xff333333)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    if(state is PostVisaBookingLoadingStates)Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    if(state is! PostVisaBookingLoadingStates)
                                      DefaultCustomButton(
                                      title: S.of(context)!.bookNow,
                                      onPressed: () async {
                                        cubits.postVisaBooking( (){
                                          ServiceCubit.get(context).postPayment(

                                              CustomerEmail: CacheHelper.getString("user-email"),
                                              CustomerMobile: CacheHelper.getString("user-phone"),
                                              InvoiceValue: VisaCubit.get(context).getOneVisaCheckoutModel!.data!.totalPrice,
                                              CustomerName: "${VisaBookingCubit.get(context).firstNameController.text} ${VisaBookingCubit.get(context).lastNameController.text}",
                                              type: "visa",
                                              visa_checkout_id: CacheHelper.getInt("visa-id")
                                          );
                                        },context,
                                          countries: selectedCountries,
                                          first_name: cubits.firstNameController.text,
                                          last_name: cubits.lastNameController.text,
                                          first_name_for_mother:
                                          cubits.firstMotherNameController.text,
                                          last_name_for_mother:
                                          cubits.lastMotherNameController,
                                          nationality_for_mother:
                                          cubits.nationalityMotherController.text,
                                          passport_path:
                                          cubits.listXAttachmentPassportImage,
                                          personal_photo_path:
                                          cubits.listXAttachmentPersonalImage,
                                          country_visa: cubits.selectHaveVisaBefore,
                                          country_visa_path: cubits
                                              .listXTravelAmericaBeforePathImage,
                                          travel_country:
                                          cubits.selectTravelAmericaBefore,
                                          date: cubits.selectedDate,
                                          period_stay: cubits.periodStayController,
                                          driver_license:
                                          cubits.selectHaveDriverLicence,
                                          refusal_travel_country:
                                          cubits.selectDeniedOrCancelled,
                                          explain: cubits.refusedExplainController,
                                          marital_status: cubits.selectMaritalStatus,
                                          relatives_living_in_country:
                                          cubits.selectRelativesLivingCountry,
                                          visa_checkout_id:
                                          CacheHelper.getInt("visa-id"),
                                          genre_relatives_living_in_country: cubits
                                              .selectRelativesLivingCountryPebole,
                                          sponsor_name: cubits.ownerOfTheAccountStatementController.text,
                                          account_statement_path: cubits.listXAccoutStatementPathImage,
                                          salary_statement_path: cubits.listXSalaryImagePathImage,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ) :
                              Center(
                                // child: CircularProgressIndicator(),
                              )
                      );
                    },
                  );
                }
              },
            );
          },
        )
    );
  }
}
