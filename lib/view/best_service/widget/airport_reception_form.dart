import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

class AirportReceptionForm extends StatefulWidget {
  const AirportReceptionForm({super.key});

  @override
  State<AirportReceptionForm> createState() => _AirportReceptionFormState();
}

class _AirportReceptionFormState extends State<AirportReceptionForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context)!.service,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectAirportServiceType = value;
                  });
                },
                hint: S.of(context)!.serviceType,
                item: [S.of(context)!.receptionAndFarewell,
                  S.of(context)!.receptionOnly].map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000).withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectAirportServiceType),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.placeOfPickup,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextField( S.of(context)!.placeOfPickup, cubit.placeOfPickupController),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.placeOfDelivery,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextField(S.of(context)!.placeOfDelivery, cubit.placeOfDeliveryController),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.pickupDate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextFieldDate(
                onTap: () async {
                  await cubit.selectDate(context);
                },
                labelText: (cubit.selectedDate != null)
                    ? '${cubit.selectedDate}'
                    : S.of(context)!.pickupDate),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.providerName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextField(CacheHelper.getString("language") == "ar" ?"مثلا : نايف" : "ex : Nayf",
                cubit.yourNameController),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.currentQualification,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectYourEducation = value;
                  });
                },
                hint: S.of(context)!.qualification,
                item: [S.of(context)!.master, S.of(context)!.bachelor, S.of(context)!.secondary].map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000).withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectYourEducation),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.doYouHaveATOEFLOrIELTSCertificate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectIELTESCertificate = value;
                  });
                },
                hint: S.of(context)!.doYouHave,
                item: ["TOEFL - توفل", "IELTS - ايليتس", S.of(context)!.iDonotHaveACertificate]
                    .map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000).withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectIELTESCertificate),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.providerName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextField(CacheHelper.getString("language") == "ar" ?"مثلا : نايف" : "ex : Nayf", cubit.yourNameController),
            const SizedBox(
              height: 15,
            ),
            Text(S.of(context)!.phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildTextField("**********", cubit.yourPhoneController,isPhone: true, inputType: TextInputType.number),
            const SizedBox(height: 15,),
            Text(S.of(context)!.email, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildTextField("abc@xyz.com", cubit.emailController),
          ],
        );
      },
    );
  }
}
