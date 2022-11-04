import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://saham-club.net/?page_id=2099',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
