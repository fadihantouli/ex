import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/controller/profile_cubit/state.dart';
import 'package:xvisa/main.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/view/home/main_screen.dart';

class EditProfileScreen extends StatelessWidget {
   var name;
   var phone;
   var email;
   var address;
   var image;
   EditProfileScreen({this.name, this.email, this.address, this.phone, this.image});
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  TextEditingController fullNameEditingController =TextEditingController();
  TextEditingController phoneEditingController =TextEditingController();
  TextEditingController emailEditingController =TextEditingController();
  TextEditingController addressEditingController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit(),
    child: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is UpdateProfileSuccess){
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   ProfileCubit.get(context).getProfile();
          // });
          finishNavigate(
            context: context,
            screen: MyApp()
          );
        }
      },
      builder: (context, state) {
        if(name != null)fullNameEditingController.text = name;
        if(phone != null)phoneEditingController.text = phone;
        if(email != null)emailEditingController.text = email;
        if(address != null)addressEditingController.text = address;
        var cubit = ProfileCubit.get(context);
       return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context)!.editProfile,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      if(cubit.listAttachmentPersonalImage.isNotEmpty)ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:Image.file(cubit.listAttachmentPersonalImage[0]['view'] , height: 100.h,
                          width: 100,
                          fit: BoxFit.cover,),
                      ),
                      if(cubit.listAttachmentPersonalImage.isEmpty)ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:(!image.contains(".svg"))?
                        CachedNetworkImage(
                            imageUrl: image ?? "",
                            height: 100.h,
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: (context,
                                url) =>
                            const ShimmerAnimatedLoading(
                              circularRaduis:
                              50,
                            ),
                            errorWidget: (context,
                                url, error) =>
                            const Icon(
                              Icons
                                  .image_not_supported_outlined,
                            )) : SvgPicture.network(image , height: 70.h,
                          width: 70,
                          fit: BoxFit.cover,),
                      ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () async{
                              await cubit.getImage(
                                  context,
                                  image1: cubit.attachmentPersonalImage,
                                  image2: cubit.XImageFileAttachmentPersonal,
                                  list2: cubit.listXAttachmentPersonalImage,
                                  one: false,
                                  list: cubit.listAttachmentPersonalImage);
                              if(cubit.listAttachmentPersonalImage[1] != null){
                                cubit.listAttachmentPersonalImage.removeAt(0);
                              }
                            },
                            borderRadius: BorderRadius.circular(50.r),
                            child: Icon(Icons.camera)
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Form(
                key: updateFormKey,
                child: Column(
                  children: [
                    PrimaryTextField(
                      controller: fullNameEditingController,
                      hint: S.of(context)!.fullName,
                      hintColor: Colors.black,
                      //validator: (value) => AppValidator.validateName(value),
                    ),
                    PrimaryTextField(
                      controller: emailEditingController,
                      hint: S.of(context)!.email,
                      inputType: TextInputType.emailAddress,
                      hintColor: Colors.black,
                      //validator: (value) => AppValidator.validateEmail(value),
                    ),
                    PrimaryTextField(
                      controller: phoneEditingController,
                      hint: S.of(context)!.phoneNumber,
                      inputType: TextInputType.phone,
                      hintColor: Colors.black,
                      //validator: (value) => AppValidator.validatePhone(value),
                    ),
                    PrimaryTextField(
                      controller: addressEditingController,
                      hint: S.of(context)!.address,
                      hintColor: Colors.black,
                      //validator: (value) => AppValidator.validateRequired(value),
                    ),
                  ],
                ),
              ),
              if(state is UpdateProfileLoading)const Center(
                child: CircularProgressIndicator(),
              ),
              if(state is! UpdateProfileLoading)Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                  top: 30.h,
                ),
                child: CustomActionButton(
                  text: S.of(context)!.update,
                  borderRadius: BorderRadius.circular(16.r),
                  backGroundColor: Color(0xff61461B),
                  onTap: (){
                    cubit.editProfile(
                      context: context,
                      imagePath: cubit.listXAttachmentPersonalImage,
                      phone: phoneEditingController.text,
                      email: emailEditingController.text,
                      address: addressEditingController.text,
                      nameEn: fullNameEditingController.text
                    );
                  },
                  width: double.infinity,
                  height: 50.h,
                ),
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
