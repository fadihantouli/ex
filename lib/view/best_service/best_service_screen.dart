import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/model/servise_type_model.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/utills/scafold_widget.dart';
import 'package:xvisa/view/best_service/widget/airport_reception_form.dart';
import 'package:xvisa/view/best_service/widget/bahrain_vehicle_insurance.dart';
import 'package:xvisa/view/best_service/widget/bahrain_visa_for_residents_form.dart';
import 'package:xvisa/view/best_service/widget/decument_transelate_form.dart';
import 'package:xvisa/view/best_service/widget/driver_with_car_form.dart';
import 'package:xvisa/view/best_service/widget/duolingo_test_form.dart';
import 'package:xvisa/view/best_service/widget/ieltes_test_form.dart';
import 'package:xvisa/view/best_service/widget/international_license_card_form.dart';
import 'package:xvisa/view/best_service/widget/international_license_form.dart';
import 'package:xvisa/view/best_service/widget/issuing_passports_for_resident_children.dart';
import 'package:xvisa/view/best_service/widget/passport_renewal_for_workers_form.dart';
import 'package:xvisa/view/best_service/widget/pte_test_form.dart';
import 'package:xvisa/view/best_service/widget/qatar_visa_for_residents_form.dart';
import 'package:xvisa/view/best_service/widget/servise_button_bottom.dart';
import 'package:xvisa/view/best_service/widget/travel_forms_form.dart';
import 'package:xvisa/view/best_service/widget/uae_visa_for_residents_form.dart';
import 'package:xvisa/view/best_service/widget/university_admission_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xvisa/view/payment/webview_screen.dart';
import 'package:xvisa/widgets/no_internet.dart';

class BestServiceScreen extends StatefulWidget {
  var serviceName;
  var serviceId;
  BestServiceScreen({this.serviceId, this.serviceName});
  @override
  State<BestServiceScreen> createState() => _BestServiceScreenState();
}

class _BestServiceScreenState extends State<BestServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=> ServiceCubit()..getServiceType(context),
    child: BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if(state is PostServiceSuccessState){
          ServiceCubit.get(context).postPayment(
            CustomerEmail: CacheHelper.getString("user-email"),
            CustomerMobile: CacheHelper.getString("user-phone"),
            InvoiceValue: ServiceCubit.get(context).selectRequiredServicePrice ?? 0,
            CustomerName: CacheHelper.getString("user-name"),
            type: "service",
          );
        }
        if(state is PostPaymentSuccessState){
          navigateTo(
              context: context,
              screen: WebViewStack(url: state.url,)
          );
        }
      },
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        if(widget.serviceId != null){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              cubit.selectRequiredServiceId = widget.serviceId.toString();
            });
          });
        }
        return(state is! GetServiceTypeErrorState)?
        (cubit.serviseTypeModel != null)?
        defaultScaffold(
            context: context,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.start,
                children: [
                 Text(S.of(context)!.requiredService, style: Theme.of(context).textTheme.bodyMedium,),
                 const SizedBox(height: 20,),
                  Directionality(
                    textDirection: (CacheHelper.getString("language") == "ar")? TextDirection.rtl:TextDirection.ltr,
                    child: Container(
                        height: 55,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFFF5F5F5))),
                        child:DropdownButton<Data?>(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          underline: Divider(
                            color: Colors.white,
                          ),
                          value: cubit.serviseTypeModel!.data!
                              .where((service) => service.id.toString() == cubit.selectRequiredServiceId)
                              .isEmpty
                              ? null
                              : cubit.serviseTypeModel!.data!
                              .firstWhere((service) => service.id.toString() == cubit.selectRequiredServiceId),
                          onChanged: (selectedService) {
                            if (selectedService != null) {
                              cubit.selectCountry = null;
                              cubit.selectedDate= null;
                              cubit.selectLicenseReceive= null;
                              cubit.selectPassportCount= null;
                              cubit.nationalityController.clear();
                              cubit.listXAttachmentImage.clear();
                              cubit.listXAttachmentImage2.clear();
                              cubit.yourNameController.clear();
                              cubit.yourPhoneController.clear();
                              cubit.emailController.clear();
                              setState(() {
                                cubit.selectRequiredServiceId = selectedService.id.toString();
                                cubit.selectRequiredServicePrice = selectedService.price; // Store the price
                              });
                            }
                          },
                          hint:  Text((widget.serviceName != null) ?widget.serviceName : S.of(context)!.serviceType,style:TextStyle(
                              fontFamily: 'HeadlandOne',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000)),),
                          items: cubit.serviseTypeModel!.data!.map((service) {
                            return DropdownMenuItem<Data>(
                              value: service,
                              child: Text(
                                service.type != null?  CacheHelper.getString("language") == "ar"? service.type!.ar! :service.type!.en!  : '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000).withOpacity(0.74),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                    ),
                  ),
                  const SizedBox(height: 15,),
                  if(cubit.selectRequiredServiceId == "1")const AirportReceptionForm(),
                  if(cubit.selectRequiredServiceId == "2")const DriverWithCarForm(),
                  if(cubit.selectRequiredServiceId == "3")const InternationalLicenseForm(),
                  if(cubit.selectRequiredServiceId == "4")const TravelFormsForm(),
                  if(cubit.selectRequiredServiceId == "5")const UniversityAdmissionForm(),
                  if(cubit.selectRequiredServiceId == "6")const DecumentTranselateForm(),
                  if(cubit.selectRequiredServiceId == "7")const PassportRenewalForWorkersForm(),
                  if(cubit.selectRequiredServiceId == "8")const UAEVisaForResidentsForm(),
                  if(cubit.selectRequiredServiceId == "9")const BahrainVisaForResidentsForm(),
                  if(cubit.selectRequiredServiceId == "10")const QatarVisaForResidentsForm(),
                  if(cubit.selectRequiredServiceId == "11")const IELTESTestForm(),
                  if(cubit.selectRequiredServiceId == "12")const PTETestForm(),
                  if(cubit.selectRequiredServiceId == "13")const DuolingoTestForm(),
                  if(cubit.selectRequiredServiceId == "14")const InternationalLicenseCardForm(),
                  if(cubit.selectRequiredServiceId == "15")const BahrainVehicleInsurance(),
                  if(cubit.selectRequiredServiceId == "16")const IssuingPassportsForResidentChildren(),
                  const SizedBox(height: 50,),
                  ServiseButtonBottom(
                    price: (cubit.selectRequiredServicePrice != null)?cubit.selectRequiredServicePrice : "0",
                  )
              ],
            ),
          ),
        )
        ): defaultScaffold(
          body: const Center(child: CircularProgressIndicator(),)
        ): defaultScaffold(
            body: Center(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NoInternetConnectionWidget(context)
              ],
            ),)
        );
      },
    ),
    );
  }
}
