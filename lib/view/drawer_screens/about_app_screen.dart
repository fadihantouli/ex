
import 'package:xvisa/view/drawer_screens/widget/faq_details_appbar_widget.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CacheHelper.getString("language") == "ar" ?CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            FAQDetailsAppbarWidget(
              image: "assets/images/faqs.png", title: S.of(context)!.privacyPolicy,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xff61461B)
                    ),
                    child: Text(S.of(context)!.privacyPolicy,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(S.of(context)!.privacyScreenContain,
                    style: const TextStyle(fontSize: 16,
                        color: Color(0xff8D94A2),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

