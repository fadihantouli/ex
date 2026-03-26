import 'package:xvisa/utills/components.dart';
import 'package:xvisa/view/best_service/widget/show_dialog_widget.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class BookShowDialog extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 46),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context)!.bookingDetails,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          defaultTextFormField(
            controller: fullNameController,
            hintText: S.of(context)!.fullName,
          ),
          const SizedBox(height: 16),
          defaultTextFormField(
            controller: phoneController,
            hintText: S.of(context)!.phoneNumber,
          ),
          const SizedBox(height: 16),
          defaultTextFormField(
            controller: emailController,
            hintText: S.of(context)!.email,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context)!.byRegister,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: const Color(0xff606060)),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () async{
              Navigator.pop(context);
              await showDialog(
              context: context,
              builder: (context) => showThankYouDialog(context, 1),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                S.of(context)!.bookNow,
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
  }
}
