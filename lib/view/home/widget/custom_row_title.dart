import 'package:xvisa/utills/components.dart';
import '../../../generated/l10n.dart';

import 'package:flutter/material.dart';
class CustomRowTitle extends StatelessWidget {
   CustomRowTitle({
    super.key,
    required this.text,
     this.onPressed,
    this.viewAll
  });

  final String text;
  final VoidCallback? onPressed;
  bool? viewAll = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff2A2A2A),
          ),
        ),
        const Spacer(),
       if(viewAll == true) DefaultTextButton(
          text: S.of(context)!.viewAll,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff61461B)
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
