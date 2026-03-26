import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

showThankYouDialog(BuildContext context ,id) => AlertDialog(
  backgroundColor: Colors.white,
  surfaceTintColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 100,
      ),
      SizedBox(height: 16),
      Text(
        S.of(context)!.submitSuccess,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Color(0xff9FA2AB),
        ),
      ),
      SizedBox(height: 20),
      Text(
        S.of(context)!.thankYou,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        'Order No.: $id',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            S.of(context)!.backToHomepage,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  ),
);


