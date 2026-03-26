import 'package:xvisa/controller/country_and_city/cubit.dart';
import 'package:xvisa/controller/country_and_city/state.dart';
import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class PTETestForm extends StatefulWidget {
  const PTETestForm({super.key});

  @override
  State<PTETestForm> createState() => _PTETestFormState();
}

class _PTETestFormState extends State<PTETestForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Text(S.of(context)!.whereyouWantTest, style: Theme.of(context).textTheme.bodyMedium,),
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
                    hint: S.of(context)!.country,
                    item: CountryAndCityCubit.get(context).countries.map((value) {
                      return DropdownMenuItem(
                        value: value['id'].toString(),
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
            buildTextField("**********", cubit.yourPhoneController, isPhone: true,inputType: TextInputType.number),
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
