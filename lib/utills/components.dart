import 'dart:io';
import 'package:flutter/material.dart';
  import '../../generated/l10n.dart';

import 'package:xvisa/controller/main_cubit/cubit.dart';
import 'package:xvisa/controller/main_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/utills/assets.dart';
import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/locale_keys.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShimmerAnimatedLoading extends StatefulWidget {
  final double? height, width, circularRaduis, maxHeight, maxWidth;

  const ShimmerAnimatedLoading(
      {super.key,
      this.height,
      this.width,
      this.circularRaduis,
      this.maxHeight,
      this.maxWidth});

  @override
  State<ShimmerAnimatedLoading> createState() => _ShimmerAnimatedLoadingState();
}

class _ShimmerAnimatedLoadingState extends State<ShimmerAnimatedLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _color;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _color = ColorTween(
            begin: Colors.black.withOpacity(.02),
            end: Colors.black.withOpacity(.09))
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _color,
      builder: (BuildContext context, Widget? child) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: widget.maxWidth ?? double.infinity,
            maxHeight: widget.maxHeight ?? double.infinity,
          ),
          height: widget.height,
          width: widget.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: _color.value,
              borderRadius: BorderRadius.all(
                  Radius.circular(widget.circularRaduis ?? 1))),
        );
      },
    );
  }
}

Widget buildCustomContainer({file}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 10),
    child: Container(
      width: 94,
      height: 94,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF011A51), width: 2),
      ),
      child: Image(
        image: FileImage(file!),
        fit: BoxFit.fill,
      ),
    ),
  );
}

finishNavigate({context, screen}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

navigateTo({context, screen}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.0.h,
    );
  }
}

class IconButtonWithWhiteBackground extends StatelessWidget {
  const IconButtonWithWhiteBackground({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.icon,
  });

  final double width;
  final double height;
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.whiteAppColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

Widget defaultTextFormField(
    {TextEditingController? controller,
    String? hintText,
    Widget? suffixIcon,
    bool? hasShadows = true,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
    List<BoxShadow>? boxShadow,
    double? containerHeight,
    double? containerWidth,
    Color? borderColor,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted}) {
  return Container(
    height: containerHeight ?? 50,
    width: containerWidth ?? double.infinity,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.symmetric(
        horizontal: 16, vertical: (maxLines! > 1) ? 16 : 0),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: borderColor ?? const Color(0xffE3E5E5),
          width: 1.0,
        ),
      ),
      shadows: (hasShadows == true)
          ? const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 10,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ]
          : null,
    ),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: hintText ?? "Input",
        labelStyle: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff191C1F)),
        hintStyle: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff464646)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    ),
  );
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.controller,
    this.onTap,
    this.onChanged,
    this.readOnly,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        border: Border.all(color: AppColors.greySearchText),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 15),
          hintText: S.of(context)!.search,
          hintStyle: const TextStyle(
              color: AppColors.greySearchText,
              fontSize: 12,
              fontWeight: FontWeight.w400),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greySearchText,
          ),
        ),
        onChanged: onChanged,
        readOnly: false,
        onSubmitted: onSubmitted,
      ),
    );
  }
}

class DefaultCustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? containerWidth;
  bool? cancel = false;
  final Color? color; // Background color property
  final Color? textColor; // Text color property

  DefaultCustomButton({
    required this.onPressed,
    required this.title,
    this.color,
    this.cancel,
    this.containerWidth,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: color ?? const Color(0xff61461B),
          borderRadius: BorderRadius.circular(11)),
      width: containerWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xff61461B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: textColor ?? const Color(0xffFFFFFF),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.backGroundColor,
    required this.onTap,
    required this.width,
    required this.height,
    this.style,
  });

  final String text;
  final BorderRadius borderRadius;
  final Color backGroundColor;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: backGroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: style ??
                Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Color(0xffFFFFFF)),
          ),
        ),
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
    this.textColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  var textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style ??
            Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColor ?? AppColors.textAndBackgroundColorButton,
                ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String labelText;
  final Color color;
  final void Function()? onTap;

  const CustomDialog({
    required this.title,
    required this.subtitle,
    required this.labelText,
    this.color = AppColors.redAppColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColors.whiteAppColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                    top: 70.h,
                    bottom: 20.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          height: 1.32,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                        child: CustomActionButton(
                          text: labelText,
                          borderRadius: BorderRadius.circular(16.r),
                          backGroundColor: color,
                          onTap: () {
                            Navigator.pop(context);
                            onTap?.call();
                          },
                          width: double.infinity,
                          height: 50.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -60.h,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCircleAvatar(
                        iconData: Icons.check,
                        radius: 45.h,
                        borderWidth: 10.h,
                        backgroundColor: color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final double iconSize;
  final String? avatarText;
  final Color backgroundColor;
  final ImageProvider<Object>? backgroundImage;
  final IconData? iconData;

  const CustomCircleAvatar({
    this.radius = 90,
    this.borderWidth = 0,
    this.iconSize = 50,
    this.backgroundColor = AppColors.textAndBackgroundColorButton,
    this.backgroundImage,
    this.iconData,
    this.avatarText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: backgroundColor.withOpacity(0.07),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        child: iconData != null
            ? Icon(
                iconData,
                color: AppColors.white,
                size: iconSize,
              )
            : avatarText != null
                ? Text(
                    avatarText!,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : null,
      ),
    );
  }
}

Widget defaultDropdownField(
    {String? value,
    String? title,
    bool? isExpanded,
    Color? borderColor,
    ContainerWidth,
    containerHeight,
    bool change = false,
    containerColor,
    required items,
    required void Function(String?)? onChanged}) {
  return Container(
    height: containerHeight ?? 50,
    width: ContainerWidth ?? double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        horizontal: (change == false) ? 16 : 6, vertical: 0),
    decoration: ShapeDecoration(
      color: containerColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((change == false) ? 10 : 4),
        side: BorderSide(
          color: borderColor ?? const Color(0xffE3E5E5),
          width: 1.0,
        ),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 10,
          offset: Offset(0, 1),
          spreadRadius: 0,
        )
      ],
    ),
    child: DropdownButton<String>(
        dropdownColor: Colors.white,
        icon: const Icon(
          Icons.arrow_drop_down_sharp,
          color: Color(0xffE6007E),
        ),
        isExpanded: isExpanded ?? true,
        value: value,
        hint: Text(
          title!,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: (change == false) ? 12 : 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff464646)),
        ),
        items: items,
        underline: const SizedBox.shrink(),
        onChanged: onChanged),
  );
}

class PrimaryTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool isObscureText;
  final bool autofocus;
  final bool readOnly;
  final bool isEnabled;
  final bool isTextAria;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final Color textColor;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  var hintColor;
  PrimaryTextField({
    super.key,
    required this.controller,
    this.label,
    this.onChanged,
    this.hintColor,
    this.hint,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.validator,
    this.readOnly = false,
    this.isEnabled = true,
    this.isTextAria = false,
    this.textColor = AppColors.black,
    this.suffix,
    this.padding,
    this.focusNode,
    this.onTap,
    this.prefix,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CacheHelper.getString("language") == "ar"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          if (widget.label != null)
            SizedBox(
              height: 8.h,
            ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            focusNode: widget.focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: widget.textInputAction,
            keyboardType: widget.inputType,
            obscureText: widget.isObscureText && !isVisibleText,
            onChanged: widget.onChanged ??
                (value) {
                  setState(() {});
                },
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: widget.hintColor ?? Colors.white,
                  letterSpacing: 1.5,
                ),
            // textDirection: widget.inputType == TextInputType.phone
            //     ? TextDirection.LTR
            //     : widget.controller.text.isNotEmpty && widget.controller.text.trim().isNotEmpty
            //     ? RegExp(r'^[a-zA-Z0-9٠-٩]').hasMatch(widget.controller.text)
            //     ? TextDirection.LTR
            //     : null
            //     : null,
            maxLines: widget.isTextAria ? 7 : 1,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: widget.hintColor ?? Colors.white,
                  ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: widget.hintColor ?? Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: widget.hintColor ?? Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: widget.hintColor ?? Colors.white,
                ),
              ),
              prefix: widget.prefix ?? null,
              suffixIcon: widget.isObscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisibleText = !isVisibleText;
                        });
                      },
                      icon: isVisibleText
                          ? Icon(
                              CupertinoIcons.lock_open,
                              color: AppColors.textAndBackgroundColorButton,
                            )
                          : const Icon(
                              CupertinoIcons.lock,
                              color: AppColors.textAndBackgroundColorButton,
                            ),
                    )
                  : widget.suffix,
              errorStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.redAppColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                  ),
              errorMaxLines: 2,
            ),
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            enabled: widget.isEnabled,
          ),
        ],
      ),
    );
  }
}

class ButtonId extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ButtonId({

    required this.onPressed,
    required this.title,


    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: MediaQuery.of(context).size.height / 16,
      width: MediaQuery.of(context).size.width * 1,
      child:
Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
  ElevatedButton(

  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 35,
      vertical: 12,
    ),
    // backgroundColor: Color(0xFF011A51),
    backgroundColor:    Color(0xff61461B),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Row(
    mainAxisAlignment: CacheHelper.getString("language") == "ar"
        ? MainAxisAlignment.start
        : MainAxisAlignment.end,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 8),
      const Icon(
        Icons.add,
        color: Color(0xff7CB041),
      ),
    ],
  ),
),
        )    );
  }
}

Widget buildDropdownButton({
  value,
  hint,
  item,
  onChange,
}) {
  return Directionality(
    textDirection: (CacheHelper.getString("LOCALE") == "ar")
        ? TextDirection.rtl
        : TextDirection.ltr,
    child: Container(
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xFFF5F5F5))),
        child: DropdownButton(
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Divider(
              color: Colors.white,
            ),
            value: value,
            hint: Text(
              '$hint',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000).withOpacity(0.74)),
            ),
            items: item,
            onChanged: onChange)),
  );
}

Widget buildTextField(String labelText, TextEditingController controller,
    {bool isPassword = false,
    validator,
    onChange,
    double? containerWidth,
    validateText,
    inputType,
    bool isPhone = false}) {
  return Directionality(
    textDirection: (CacheHelper.getString("LOCALE") == "ar")
        ? TextDirection.rtl
        : TextDirection.ltr,
    child: Container(
      height: 48,
      width: containerWidth ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFF5F5F5))),
      child: TextFormField(
        controller: controller,
        validator: (String? value) {
          return '$validateText';
        },
        keyboardType: inputType ?? TextInputType.text,
        onChanged: onChange,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: labelText,
            prefix: isPhone == true
                ? Text(
                    "966  ",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : null,
            border: InputBorder.none),
      ),
    ),
  );
}

Widget buildTextFieldDate({String? labelText, onTap}) {
  return Directionality(
    textDirection: (CacheHelper.getString("LOCALE") == "ar")
        ? TextDirection.rtl
        : TextDirection.ltr,
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 48,
          width: double.infinity,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFF5F5F5))),
          child: Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000).withOpacity(0.74)),
              ),
              Spacer(),
              SvgPicture.asset("assets/images/calender.svg")
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var cubit = context.read<MainCubit>();
        return CurvedNavigationBar(
          height: 100,
          key: const Key('curvedNavigationBar_en'),
          items: [
            CurvedNavigationBarItem(

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  "assets/images/home_icon.svg",
                ),
              ),
              label: S.of(context)!.home,
              labelStyle: TextStyle(
                color: cubit.currentTab == 0
                    ? AppColors.textAndBackgroundColorButton
                    : AppColors.white,
                fontSize: 10.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  "assets/images/booking_icon.svg",
                ),
              ),
              label: S.of(context)!.booking,
              labelStyle: TextStyle(
                color: cubit.currentTab == 2
                    ? AppColors.textAndBackgroundColorButton
                    : AppColors.white,
                fontSize: 10.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  "assets/images/req_icon.svg",
                ),
              ),
              label: S.of(context)!.requirements,
              labelStyle: TextStyle(
                color: cubit.currentTab == 3
                    ? AppColors.textAndBackgroundColorButton
                    : AppColors.white,
                fontSize: 10.sp,
              ),
            ),
            CurvedNavigationBarItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset(
                  "assets/images/account_icon.svg",
                ),
              ),
              label: S.of(context)!.account,
              labelStyle: TextStyle(
                color: cubit.currentTab == 4
                    ? AppColors.textAndBackgroundColorButton
                    : AppColors.white,
                fontSize: 10.sp,
              ),
            ),
          ],
          index: cubit.currentTab,
          onTap: cubit.changeCurrentTab,
          letIndexChange: (value) {
            return true;
          },
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: const Color(0xffE09A1E),
          color: AppColors.blogItemBackgroundColor,
          animationDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}

class ProfilePhotoSection extends StatefulWidget {
  // final Client? client;
  final bool isShowCameraIcon;
  var image;
  var email;
  var userName;
  final void Function()? onFilePicked;

  ProfilePhotoSection({
    // required this.client,
    this.isShowCameraIcon = false,
    this.onFilePicked,
    this.image,
    this.email,
    this.userName,
    super.key,
  });

  @override
  State<ProfilePhotoSection> createState() => _ProfilePhotoSectionState();
}

class _ProfilePhotoSectionState extends State<ProfilePhotoSection> {
  XFile? pickedImage;
  var images;
  bool imageHasErrorWhenLoad = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: (!widget.image.contains(".svg"))
                    ? CachedNetworkImage(
                        imageUrl: widget.image ?? "",
                        height: 70.h,
                        width: 70,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const ShimmerAnimatedLoading(
                              circularRaduis: 50,
                            ),
                        errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                            ))
                    : SvgPicture.network(
                        widget.image,
                        height: 70.h,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
              ),
              if (widget.isShowCameraIcon)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(50.r),
                    child: CustomCircleAvatar(
                      backgroundColor: AppColors
                          .blogItemContainerBackgroundColor
                          .withOpacity(0.5),
                      radius: 30.r,
                      iconData: CupertinoIcons.camera,
                      iconSize: 30.h,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            widget.userName ?? "",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            widget.email ?? "",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.grayLight,
                ),
          ),
        ],
      ),
    );
  }
}

class ProfileCardDetails extends StatelessWidget {
  final String title;
  final String value;

  const ProfileCardDetails({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CacheHelper.getString("language") == "ar"
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.grayLight,
                ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
