import 'package:xvisa/utills/colors.dart';
import 'package:xvisa/utills/components.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewStack extends StatefulWidget {
  final String? url;
  WebViewStack({this.url});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}
class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse('${widget.url}'))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (mounted) {
              setState(() {
                loadingPercentage = 0;
              });
            }
          },
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                loadingPercentage = progress;
              });
            }
          },
          onPageFinished: (url) {
            if (mounted) {
              setState(() {
                loadingPercentage = 100;
              });
            }
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (navigation.url.contains('payment-success')) {
              if (mounted) {
                if (Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      title: "PAYMENT SUCCESSFULLY",
                      subtitle: "PAYMENT SUCCESSFULLY",
                      labelText: "PAYMENT SUCCESSFULLY",
                      color: AppColors.green,
                    ),
                  );
                }
              }
            }
            else if (navigation.url.contains('payment-failed')) {
              if (mounted) {
                if (Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => const CustomDialog(
                      title: "PAYMENT Failed",
                      subtitle: "PAYMENT Failed",
                      labelText: "PAYMENT Failed",
                      color: AppColors.redAppColor,
                    ),
                  );
                }
              }
            }
            if (host.contains('youtube.com')) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Blocking navigation to $host')),
                );
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
          }
        },
      );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 30,),
        WebViewWidget(controller: controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(value: loadingPercentage / 100.0),
      ],
    );
  }
}
