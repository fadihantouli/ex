import 'package:xvisa/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.transparent,
    ),
    primaryColor: AppColors.textAndBackgroundColorButton,
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: AppColors.materialPrimary,
    //   backgroundColor: AppColors.white,
    // ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 32.sp,
        color: Color(0xff121B51),
        fontWeight: FontWeight.w700,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 16.sp,
        color: AppColors.backgroundWhite,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.sp,
        color: Color(0xff121B51),
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.sp,
        color: AppColors.textAndBackgroundColorButton,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.sp,
        color: AppColors.greySearchText,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.lineThrough,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 10.sp,
        color: AppColors.grey,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 10.sp,
        color: AppColors.whiteAppColor,
      ),
    ),
  );
}
