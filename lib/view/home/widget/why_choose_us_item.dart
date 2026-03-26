import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class WhyChooseUSItem extends StatelessWidget {
  const WhyChooseUSItem({
    super.key,
    required this.child,
    required this.text,
    this.descriptionText,
    this.descriptionTextStyle,
  });

  final Widget child;
  final String text;
  final String? descriptionText;
  final TextStyle? descriptionTextStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
            children: [
              SizedBox(
                child: child,
              ),
              SizedBox(
                width: 6.0.w,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          if (descriptionText != null && descriptionText!.isNotEmpty)
            Text(
              descriptionText!,
              style: descriptionTextStyle,
            ),
        ],
      ),
    );
  }
}
