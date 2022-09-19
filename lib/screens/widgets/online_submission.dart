import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class OnlineVideo extends StatefulWidget {
  final String title;
  final String website;

  const OnlineVideo({super.key, required this.title, required this.website});

  @override
  State<OnlineVideo> createState() => _OnlineVideoState();
}

class _OnlineVideoState extends State<OnlineVideo> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WebView(
          initialUrl: widget.website,
          javascriptMode: JavascriptMode.unrestricted,
          // onWebViewCreated: (WebViewController con),
        ));
  }
}
