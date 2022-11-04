import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  WebView(
      initialUrl: 'https://saham-club.net/',
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
