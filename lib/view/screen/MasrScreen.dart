// ignore_for_file: override_on_non_overriding_member, file_names


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widget/compnent/Bar.dart';

class MasrScreen extends StatefulWidget {
   const MasrScreen({Key? key}) : super(key: key);

  @override
  State<MasrScreen> createState() => _MasrScreenState();
}

class _MasrScreenState extends State<MasrScreen> {
  @override

var  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://digital.gov.eg/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://digital.gov.eg/'));

     @override
  Widget build(BuildContext context) {
    return  Bar3(
              title: "منصة مصر الرقمية",
              child: WebViewWidget( controller: controller,)
            );

  }
}

