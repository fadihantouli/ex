import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../utills/components.dart';
import 'auth/views/login_screen.dart';

void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          S.of(context).login_required_title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          S.of(context).login_required_msg,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).close),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              finishNavigate(
                  context: context,
                  screen: LoginScreen(
                    fromSplash: true,
                  ));
            },
            child: Text(S.of(context).login),
          ),
        ],
      );
    },
  );
}
