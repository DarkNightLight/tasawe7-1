// ignore_for_file: override_on_non_overriding_member


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../compnent/Bar.dart';


class MasrScreen extends StatefulWidget {

  @override
  State<MasrScreen> createState() => _MasrScreenState();
}

class _MasrScreenState extends State<MasrScreen> {
  @override


  //  void initState() {
  //    super.initState();
  //    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  //  }


// late final PlatformWebViewControllerCreationParams params;
// if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//   params = WebKitWebViewControllerCreationParams(
//     allowsInlineMediaPlayback: true,
//     mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//   );
// } else {
//   params = const PlatformWebViewControllerCreationParams();
// }

// final WebViewController controller =
//     WebViewController.fromPlatformCreationParams(params);
// // ···
// if (controller.platform is AndroidWebViewController) {
//   AndroidWebViewController.enableDebugging(true);
//   (controller.platform as AndroidWebViewController)
//       .setMediaPlaybackRequiresUserGesture(false);
// }





var  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
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
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: WebViewWidget( controller: controller,),
              )
            );

  }
}

