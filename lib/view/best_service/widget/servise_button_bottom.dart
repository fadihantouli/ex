import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/view/best_service/widget/show_dialog_widget.dart';
import 'package:xvisa/view/payment/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

class ServiseButtonBottom extends StatelessWidget {
  String? price = "0";
  ServiseButtonBottom({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
        listener: (context, state) {
          if(state is PostServiceSuccessState){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return showThankYouDialog(context, state.id);
              },
            );
          }
        },
    builder: (context, state) {
          var cubit = ServiceCubit.get(context);
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${S.of(context)!.serviceCost} : $price ${S.of(context)!.sar}", style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            Text(S.of(context)!.costWillBeDecided,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 11),),
            const SizedBox(height: 10,),
            Text(S.of(context)!.bySubmitService,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              ),),
            const SizedBox(height: 30,),
            if(state is PostServiceLoadingState )const Center(child: CircularProgressIndicator(),),
           if(state is! PostServiceLoadingState )
             DefaultCustomButton(title: S.of(context)!.submitNow, onPressed: () {
              if(cubit.selectRequiredServiceId == "1"){
                cubit.postService(context,
                    service_type_id: "1",
                airport_type: cubit.selectAirportServiceType.toString(),
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                    airport_receipt_location: cubit.placeOfPickupController.text,
                    airport_place_of_delivery: cubit.placeOfDeliveryController.text,
                    airport_date: cubit.selectedDate.toString()
                );
              }
              if(cubit.selectRequiredServiceId == "2"){
                cubit.postService(context,
                    service_type_id: "2",
                    driver_country:  cubit.selectCountry,
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                    driver_trip_duration_in_days: cubit.selectFlightDurationInDays.toString(),
                    driver_receipt_date:cubit.selectedDate.toString()
                );
              } if(cubit.selectRequiredServiceId == "3"){
                cubit.postService(context,
                    service_type_id: "3",
                    licence_count:  cubit.selectLicenseCount.toString(),
                    licence_receipt_location : cubit.selectLicenseReceive.toString(),
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                );
              }if(cubit.selectRequiredServiceId == "4"){
                cubit.postService(context,
                    service_type_id: "4",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  Fill_out_travel_forms:  cubit.selectModelType.toString(),
                );
              }if(cubit.selectRequiredServiceId == "5"){
                cubit.postService(context,
                    service_type_id: "5",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  university_country:  cubit.selectCountry.toString(),
                  university_nationality:  cubit.nationalityController.text,
                  university_payment_method:  cubit.selectUniversityPaymentWay.toString(),
                  university_specialization:  cubit.requiredSpecializationController.text,
                  university_educational_qualification:  cubit.selectYourEducation.toString(),
                  university_academic_last_certificate:  cubit.selectYourLastEducation.toString(),
                  university_IELTS_TOEFL:  cubit.selectIELTESCertificate.toString(),
                  university_preferred_call_time:  cubit.selectPreferredCallTime.toString(),
                );
              }if(cubit.selectRequiredServiceId == "6"){
                cubit.postService(context,
                    service_type_id: "6",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  translation_count:  cubit.selectApproximateNumberOfPages.toString(),
                  translation_file:  cubit.listXAttachmentImage,
                  translation_type_preferred:  cubit.selectContentToBeTranslated.toString(),
                );
              }if(cubit.selectRequiredServiceId == "7"){
                cubit.postService(context,
                    service_type_id: "7",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  passports_count:  cubit.selectPassportCount.toString(),
                  passports_country:  cubit.selectCountry.toString(),
                );
              }if(cubit.selectRequiredServiceId == "8"){
                cubit.postService(context,
                    service_type_id: "8",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  uae_visa_count:  cubit.selectPassportCount.toString(),
                );
              }if(cubit.selectRequiredServiceId == "9"){
                cubit.postService(context,
                    service_type_id: "9",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  b_visa_count:  cubit.selectPassportCount.toString(),
                );
              }if(cubit.selectRequiredServiceId == "10"){
                cubit.postService(context,
                    service_type_id: "10",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  q_visa_count:  cubit.selectPassportCount.toString(),
                );
              }if(cubit.selectRequiredServiceId == "11"){
                cubit.postService(context,
                    service_type_id: "11",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  IELTS_test_city_id:  cubit.selectCountry.toString(),
                );
              }if(cubit.selectRequiredServiceId == "12"){
                cubit.postService(context,
                    service_type_id: "12",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  PTE_test_city_id:  cubit.selectCountry.toString(),
                );
              }if(cubit.selectRequiredServiceId == "13"){
                cubit.postService(context,
                    service_type_id: "13",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  DUOLINGO_test_city_id:  cubit.selectCountry.toString(),
                );
              }if(cubit.selectRequiredServiceId == "14"){
                cubit.postService(context,
                    service_type_id: "14",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  licence2_count:  cubit.selectLicenseCardCount.toString(),
                  licence2_receipt_location:  cubit.selectLicenseReceive.toString(),
                );
              }if(cubit.selectRequiredServiceId == "15"){
                cubit.postService(context,
                    service_type_id: "15",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  insurance_licence_driver_file:  cubit.listXAttachmentImage,
                  insurance_licence_car_file:  cubit.listXAttachmentImage2,
                );
              }if(cubit.selectRequiredServiceId == "16"){
                cubit.postService(context,
                    service_type_id: "16",
                  name: cubit.yourNameController.text,
                  email: cubit.emailController.text,
                  phone: "966${cubit.yourPhoneController.text}",
                  visa_children_count:  cubit.selectPassportCount.toString(),
                  visa_children_country_id:  cubit.selectCountry.toString(),
                );
              }
              },
            )
          ],
        ),
      );
    },
    );
  }
}
