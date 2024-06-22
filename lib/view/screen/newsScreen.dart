// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widget/compnent/Bar.dart';

class NewsScreen extends StatefulWidget {
 
  final String title;
  final String link;
  

   const NewsScreen ({Key? key, required this.title, required this.link}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Handle progress updates if needed
          },
          onPageStarted: (String url) {
            // Handle page started loading
          },
          onPageFinished: (String url) {
            // Handle page finished loading
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource error
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.link)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Bar3(
      title: widget.title,
      child: WebViewWidget(controller: _controller),
    );
  }
}
