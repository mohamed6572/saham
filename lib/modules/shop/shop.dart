import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://saham-club.net/?page_id=2735',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
