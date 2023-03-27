import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  const ArticleView({Key? key, required this.postUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
 late final WebViewController controller;

 @override
  void initState() {
   String str = widget.postUrl;
   controller = WebViewController()..loadRequest(
     Uri.parse(str)
   );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
