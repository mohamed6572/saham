import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_launch/flutter_launch.dart';

import 'package:flutter/material.dart';
import 'package:saham/modules/ads/ads.dart';
import 'package:saham/modules/home/home.dart';
import 'package:saham/modules/magazen/magazen.dart';
import 'package:saham/modules/malab/malab.dart';
import 'package:saham/modules/policy/policy.dart';
import 'package:saham/modules/sabla/sabla.dart';
import 'package:saham/modules/shop/shop.dart';
import 'package:saham/modules/who_are/who_are.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int CurrentIndedx = 0;
  List<String> titles = [
    'الرئيسية',
    'السبلة',
    'الملعب',
    'السوق',
    'المجلة',
  ];
  List<Widget>Screens = [
    Home(),
    Sabla(),
    Malab(),
    Shop(),
    Magazen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(titles[CurrentIndedx]),
      ),
      drawer: Container(

        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            )
        ),
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        drawer_widget(icon: Icons.group, text: 'من نحن', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => Who_are(),));
        }),
        drawer_widget(icon: Icons.sticky_note_2_outlined, text: 'شروط الاعلانات', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => ads(),));
        }),
        drawer_widget(icon: Icons.sms_outlined, text: 'سياسة الخصوصية', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => Policy(),));
        }),
        drawer_widget(icon: Icons.share, text: 'مشاركة التطبيق', function: () async{
          await Share.share("https://play.google.com/store/apps/details?id=com.sahamclub",  );
        },),
        drawer_widget(icon: Icons.logout_outlined, text: 'خروج', function: (){
          SystemNavigator.pop();
        }),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        unselectedLabelStyle:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        selectedLabelStyle:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        backgroundColor: Colors.white,
        currentIndex: CurrentIndedx,
        onTap: (i) {
          setState(() {
            CurrentIndedx = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(null), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(null), label: 'السبلة'),
          BottomNavigationBarItem(icon: Icon(null), label: 'الملعب'),
          BottomNavigationBarItem(icon: Icon(null), label: 'السوق'),
          BottomNavigationBarItem(icon: Icon(null), label: 'المجلة'),
        ],
      ),
      body: Screens[CurrentIndedx],

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _contactViaWhatsApp(context);
        },
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: const Icon(
          Icons.whatsapp_sharp,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _contactViaWhatsApp(context) async {
    String whatsAppUrl = "";

    String phoneNumber = '201158921439';
    String description = "your-custom-message";

    if (Platform.isIOS) {
      whatsAppUrl =
      'whatsapp://wa.me/$phoneNumber/?text=${Uri.parse(description)}';
    } else {
      whatsAppUrl =
      'https://wa.me/+$phoneNumber?text=${Uri.parse(description)}';
    }

    if (await canLaunchUrl(Uri.parse(whatsAppUrl))) {
      await launchUrl(
        Uri.parse(whatsAppUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      final snackBar = SnackBar(
        content: Text("Install WhatsApp First Please"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget drawer_widget(
  {
 required icon,
 required text,
 required function,

}
      ) => InkWell(
    onTap:
      function
    ,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child:  Row(
        children: [
          Icon(
              icon,
            color:  Colors.indigoAccent,
          ),
          SizedBox(width: 5,),
          Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,
            color:  Colors.indigoAccent,
            fontSize: 18


          ),)
        ],
      ),
    ),
  );
}