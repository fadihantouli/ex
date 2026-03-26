import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class UAEVisaForResidentsForm extends StatefulWidget {
  const UAEVisaForResidentsForm({super.key});

  @override
  State<UAEVisaForResidentsForm> createState() => _UAEVisaForResidentsFormState();
}

class _UAEVisaForResidentsFormState extends State<UAEVisaForResidentsForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Text(S.of(context)!.numberOfPassports, style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 10,),
            buildDropdownButton(
                onChange: (value) {
                  setState(() {
                    cubit.selectPassportCount = value;
                  });
                },
                hint: S.of(context)!.numberOfPassports,
                item: [19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1].map((value) {
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
                value: cubit.selectPassportCount),
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
