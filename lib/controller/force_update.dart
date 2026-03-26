import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xvisa/controller/models/force_update/force_response.dart';
import 'package:http/http.dart' as http;

import '../generated/l10n.dart';
import '../utills/const.dart';

class ForceUpdateController extends GetxController {
  RxString version = "".obs;
  RxString platform = "".obs;
  Rx<AppVersionResponse> respo = AppVersionResponse().obs;
  RxBool isForce=false.obs;
  @override
  onInit() async {
    super.onInit();
    checkPlatform();
    await getVersion();
    await forceUpdate( Get.context!);
  }

  // Future<void> forceUpdate(BuildContext? context) async {
  //   var headers = {
  //     'platform': platform.value,
  //     'app-version': version.value,
  //     // 'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST',
  //       Uri.parse('https://www.exvisas.com/api/auth/admin/app-version'));
  //
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     final res = await response.stream.bytesToString();
  //     AppVersionResponse responses =
  //     AppVersionResponse.fromJson(jsonDecode(res));
  //     // if (responses.data?.forceUpdate ?? false) {
  //       respo.value = responses;
  //          // isForce.value=true;;
  //
  //     }
  //    else {
  //     print(response.reasonPhrase);
  //   }
  //
  //   // AppConstant
  // }

  Future<void> forceUpdate(BuildContext? context) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://www.exvisas.com/api/auth/admin/app-version'),
    );

    request.fields.addAll({
      'platform': platform.value,        // android / ios
      'app_version': version.value,       // 1.0.3
    });

    try {
      final response = await request.send();
      final body = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final result = AppVersionResponse.fromJson(jsonDecode(body));

        respo.value = result;
        if(result.data?.latestVersion!=version.value)
          isForce.value=true;
        else
          isForce.value =false;

        //   if (isForce.value) {
        //     if(Platform.isAndroid)
        //     _showForceUpdateDialog(Get.context!,"https://play.google.com/store/apps/details?id=com.workerappspace.xvisas");
        //      else
        //     _showForceUpdateDialog(Get.context!,"https://play.google.com/store/apps/details?id=com.workerappspace.xvisas");
        //
        // }
      } else {
        print('❌ API Error ${response.statusCode}: $body');
      }
    } catch (e) {
      print('🔥 Exception: $e');
    }
  }
  void checkPlatform() {
    if (Platform.isAndroid) {
      print("Running on Android");
      platform.value = "android";
    } else if (Platform.isIOS) {
      platform.value = "ios";

      print("Running on iOS");
    } else {
      print("Other platform");
    }
  }
  void _showForceUpdateDialog(BuildContext context, String? storeUrl) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('تحديث إجباري'),
            content: const Text(
              'يرجى تحديث التطبيق للاستمرار في استخدامه.',
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (storeUrl != null) {
                    launchUrl(Uri.parse(storeUrl),
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text('تحديث الآن'),
              ),
            ],
          ),
        );
      },
    );
  }
  void unAuthPopUp(
      BuildContext context, String txt, AppVersionResponse res) async {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              txt,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Opacity(
                opacity: 0.7,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      final String url = Platform.isAndroid
                          ? "https://play.google.com/store/apps/details?id=com.workerappspace.xvisas" ??
                          ""
                          : "https://apps.apple.com/jo/app/exvisas-app/id6754181656" ??
                          "";

                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw "Could not launch $url";
                      }
                    },
                    child: Text(
                      S.of(context).account,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
    );
  }

  Future<void> getVersion() async {
    final info = await PackageInfo.fromPlatform();

    String versionName = info.version; // example: 1.0.3
    String buildNumber = info.buildNumber; // example: 12
    version.value = versionName;
    print("Version Name: $versionName");
    print("Build Number: $buildNumber");
  }

  void showForceUpdateDialog(
      BuildContext context, String title, AppVersionResponse res) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: const Text(
            "You must update the app to continue.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final String url = Platform.isAndroid
                    ? "https://play.google.com/store/apps/details?id=com.workerappspace.xvisas" ??
                    ""
                    : "https://apps.apple.com/jo/app/exvisas-app/id6754181656" ??
                    "";

                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                } else {
                  throw "Could not launch $url";
                }
              },
              child: const Text("UPDATE"),
            ),
          ],
        );
      },
    );
  }
}
int compareVersions(String v1, String v2) {
  final v1Parts = v1.split('.').map(int.parse).toList();
  final v2Parts = v2.split('.').map(int.parse).toList();

  final maxLength = v1Parts.length > v2Parts.length
      ? v1Parts.length
      : v2Parts.length;

  for (int i = 0; i < maxLength; i++) {
    final p1 = i < v1Parts.length ? v1Parts[i] : 0;
    final p2 = i < v2Parts.length ? v2Parts[i] : 0;

    if (p1 > p2) return 1;
    if (p1 < p2) return -1;
  }
  return 0;
}
