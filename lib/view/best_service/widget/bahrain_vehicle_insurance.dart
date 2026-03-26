import 'package:xvisa/controller/service_cubit/cubit.dart';
import 'package:xvisa/controller/service_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

class BahrainVehicleInsurance extends StatefulWidget {
  const BahrainVehicleInsurance({super.key});

  @override
  State<BahrainVehicleInsurance> createState() => _BahrainVehicleInsuranceState();
}

class _BahrainVehicleInsuranceState extends State<BahrainVehicleInsurance> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceCubit.get(context);
        return Column(
          crossAxisAlignment:CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start: CrossAxisAlignment.end,
          children: [
            Text(
              S.of(context)!.validDriverLicense,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: ()async{
                await cubit.getImage(
                    context,
                    image1: cubit.attachmentImage,
                    image2: cubit.XImageFileAttachment,
                    list2: cubit.listXAttachmentImage,
                    one: false,
                    list: cubit.listAttachmentImage);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFFF5F5F5))),
                child: Text(
                  S.of(context)!.selectFile,
                  style: TextStyle(
                      fontFamily: 'HeadlandOne',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              S.of(context)!.validVehicleLicense,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: ()async{
                await cubit.getImage2(
                    context,
                    image1: cubit.attachmentImage2,
                    image2: cubit.XImageFileAttachment2,
                    list2: cubit.listXAttachmentImage2,
                    one: false,
                    list: cubit.listAttachmentImage2);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xFFF5F5F5))),
                child: Text(
                  S.of(context)!.selectFile,
                  style: TextStyle(
                      fontFamily: 'HeadlandOne',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)),
                ),
              ),
            ),
            const SizedBox(height: 15,),
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
