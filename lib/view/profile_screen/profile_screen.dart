import 'package:xvisa/controller/profile_cubit/cubit.dart';
import 'package:xvisa/controller/profile_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/auth/views/login_screen.dart';
import 'package:xvisa/view/profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/widgets/no_internet.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit()..getProfile(),
    child: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is LogoutSuccess){
          CacheHelper.deleteData(key: 'token').then((v){
            finishNavigate(context: context, screen: LoginScreen(fromSplash: true,));
          });
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        if(state is GetProfileLoading || cubit.getProfileModel == null)Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
        if(state is GetProfileSuccess){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context)!.profile,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
              // actions: [
              //   DefaultTextButton(
              //     onPressed: (){
              //       navigateTo(
              //           context: context,
              //           screen: EditProfileScreen(
              //             image: cubit.getProfileModel!.data!.imagePath,
              //             email: cubit.getProfileModel!.data!.email,
              //             name: cubit.getProfileModel!.data!.name!.en,
              //             address: cubit.getProfileModel!.data!.address,
              //             phone: cubit.getProfileModel!.data!.phone,
              //           )
              //       );
              //     },
              //     text: S.of(context)!.edit,
              //   ),
              // ],
            ),
            body:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 20.h),
              child: Column(
                crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
                children: [
                  ProfilePhotoSection(
                    isShowCameraIcon: false,
                    image: cubit.getProfileModel!.data!.imagePath,
                    email: cubit.getProfileModel!.data!.email,
                    userName: cubit.getProfileModel!.data!.name!.en ?? cubit.getProfileModel!.data!.name!.ar,
                  ),
                  SizedBox(height: 40,),
                  ProfileCardDetails(
                    title: S.of(context)!.phoneNumber,
                    value: cubit.getProfileModel!.data!.phone ?? '',
                  ),
                  SizedBox(height: 20,),
                  // ProfileCardDetails(
                  //   title: S.of(context)!.address,
                  //   value: cubit.getProfileModel!.data!.address??"",
                  // ),
                  SizedBox(height: 20,),
                  CustomActionButton(
                    text: S.of(context)!.deleteAccount,
                    borderRadius: BorderRadius.circular(16.r),
                    backGroundColor: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (c) => CustomDialog(
                          title: S.of(context)!.areYouSureToDelete,
                          subtitle: S.of(context)!.areYouSure,
                          labelText: S.of(context)!.yes,
                          color: Colors.red,
                          onTap: () async {
                            await cubit.logout();
                          },
                        ),
                      );
                    },
                    width: double.infinity,
                    height: 50.h,
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   padding: EdgeInsets.only(top: 10.h),
                  //   child: DefaultTextButton(
                  //     onPressed: () {
                  //       //context.push(AppRoutesString.forgetPasswordScreen);
                  //     },
                  //     text: S.of(context)!.forgotPassword,
                  //   ),
                  // ),
                ],
              ),
            )
        );}
        if(state is GetProfileError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  NoInternetConnectionWidget(context)
                 ],
              ),
            ),
          );
        }else{return Container(color: Color(0xffFFFFFF),);}
      },
    ),
    );
  }
}
