import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Who_are extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('من نحن'),
      ),
      body: Directionality(textDirection: TextDirection.rtl, child:  WebView(
        initialUrl: 'https://saham-club.net/?page_id=2097',
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
