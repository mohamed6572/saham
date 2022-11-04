import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  WebView(
      initialUrl: 'https://saham-club.net/',
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}



