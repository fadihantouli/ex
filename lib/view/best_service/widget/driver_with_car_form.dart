import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

class DriverWithCarForm extends StatefulWidget {
  const DriverWithCarForm({super.key});

  @override
  State<DriverWithCarForm> createState() => _DriverWithCarFormState();
}

class _DriverWithCarFormState extends State<DriverWithCarForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Text(S.of(context)!.country, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            BlocConsumer<CountryAndCityCubit, CountryAndCityState>(
              listener: (context, state) {},
              builder: (context, state) {
                return buildDropdownButton(
                    onChange: (value) {
                      setState(() {
                        cubit.selectCountry = value;
                      });
                    },
                    hint: S.of(context)!.selectCountry,
                    item: CountryAndCityCubit.get(context).countries.map((value) {
                      return DropdownMenuItem(
                        value: value['name']['ar'].toString(),
                        child: Text(
                          value['name']['ar'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000)
                                  .withOpacity(0.74)),
                        ),
                      );
                    }).toList(),
                    value: cubit.selectCountry);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.flightDurationDays,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectFlightDurationInDays = value;
                  });
                },
                hint: S.of(context)!.flightDurationDays,
                item: ["+20 ${S.of(context)!.day}","20 ${S.of(context)!.day}","19 ${S.of(context)!.day}","18 ${S.of(context)!.day}","17 ${S.of(context)!.day}","16 ${S.of(context)!.day}","15 ${S.of(context)!.day}",
                  "14 ${S.of(context)!.day}","13 ${S.of(context)!.day}","12 ${S.of(context)!.day}","11 ${S.of(context)!.day}","10 ${S.of(context)!.day}","9 ${S.of(context)!.day}","8 ${S.of(context)!.day}","7 ${S.of(context)!.day}","6 ${S.of(context)!.day}",
                  "5 ${S.of(context)!.day}","4 ${S.of(context)!.day}","3 ${S.of(context)!.day}", "2 ${S.of(context)!.day}", "${S.of(context)!.day}"].map((value) {
                  return DropdownMenuItem(
                    value: value.toString(),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000)
                              .withOpacity(0.74)),
                    ),
                  );
                }).toList(),
                value: cubit.selectFlightDurationInDays),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context)!.receptionDate,
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
                    : S.of(context)!.receptionDate),
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
