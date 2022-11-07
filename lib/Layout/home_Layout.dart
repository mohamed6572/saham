import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_launch/flutter_launch.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  ///interstitial ad
 String interstitialIDD ='ca-app-pub-5247717174476440/6896164033';

  late InterstitialAd _interstitialAd;
  bool isADready = false;

  void loadintersitialAd() {
    InterstitialAd.load(
        adUnitId: interstitialIDD,
        request: AdRequest(),
        adLoadCallback:
        InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          isADready = true;
          _interstitialAd = ad;
        }, onAdFailedToLoad: (error) {
          print('errorr $error');
        }));
  }
  late InterstitialAd _interstitialAd1;
  bool isADready1 = false;

  void loadintersitialAd1() {
    InterstitialAd.load(
        adUnitId: interstitialIDD,
        request: AdRequest(),
        adLoadCallback:
        InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          isADready1 = true;
          _interstitialAd1 = ad;
        }, onAdFailedToLoad: (error) {
          print('errorr $error');
        }));
  }
  void showInterstitialAd(){
    if(isADready){
      _interstitialAd.show();
    }
  } void showInterstitialAd1(){
    if(isADready){
      _interstitialAd.show();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadintersitialAd();
    loadintersitialAd1();
  }

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
    Magazen(),

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
        drawer_widget(icon: Icons.home_outlined, text: 'الرئيسية', function: (){
        setState(() {
          CurrentIndedx=0;
        });
        }), drawer_widget(icon: Icons.group, text: 'من نحن', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => Who_are(),));
        }),
        drawer_widget(icon: Icons.sticky_note_2_outlined, text: 'شروط الاعلانات', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => ads(),));

        }),
        drawer_widget(icon: Icons.sms_outlined, text: 'سياسة الخصوصية', function: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => Policy(),));
          setState(() {
            showInterstitialAd1();
          });
        }),
        drawer_widget(icon: Icons.share, text: 'مشاركة التطبيق', function: () async{
          await Share.share("https://play.google.com/store/apps/details?id=com.sahamclub",  );
          setState(() {
            showInterstitialAd();
          });
        },),
        drawer_widget(icon: Icons.logout_outlined, text: 'خروج', function: (){
          SystemNavigator.pop();
        }),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 10.0,
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: Colors.black,
      //   unselectedLabelStyle:
      //   TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      //   selectedLabelStyle:
      //   TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      //   backgroundColor: Colors.white,
      //   currentIndex: CurrentIndedx,
      //   onTap: (i) {
      //     setState(() {
      //       CurrentIndedx = i;
      //       showInterstitialAd();
      //     });
      //   },
      //   items: [
      //
      //     BottomNavigationBarItem(icon: Icon(null), label: 'السبلة'),
      //     BottomNavigationBarItem(icon: Icon(null), label: 'الملعب'),
      //     BottomNavigationBarItem(icon: Icon(null), label: 'السوق'),
      //     BottomNavigationBarItem(icon: Icon(null), label: 'المجلة'),
      //   ],
      // ),
      body:Column(
        children: [
          Expanded(child:  Screens[CurrentIndedx]),
          Container(
            padding: EdgeInsets.symmetric(horizontal:25),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               InkWell(
                 onTap: (){
                   setState(() {
                     CurrentIndedx = 1;
                     showInterstitialAd();
                   });
                 },
                 child:  Text('السبلة',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: CurrentIndedx == 1?Colors.black:Colors.grey),),
               ),
               InkWell(
                 onTap: (){
                   setState(() {
                     CurrentIndedx = 2;
                     showInterstitialAd();
                   });
                 },
                 child:  Text('الملعب',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: CurrentIndedx == 2?Colors.black:Colors.grey),),
               ),
               InkWell(
                 onTap: (){
                   setState(() {
                     CurrentIndedx = 3;
                     showInterstitialAd();
                   });
                 },
                 child:  Text('السوق',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: CurrentIndedx == 3?Colors.black:Colors.grey),),
               ),
               InkWell(
                 onTap: (){
                   setState(() {
                     CurrentIndedx = 4;
                     showInterstitialAd();
                   });
                 },
                 child:  Text('المجلة',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: CurrentIndedx == 4?Colors.black:Colors.grey),),
               ),

              ],
            ),
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          onPressed: () async {
            _contactViaWhatsApp(context);
          },
          backgroundColor: Colors.green,
          tooltip: 'Increment',
          child: const Icon(
            Icons.whatsapp_sharp,
            color: Colors.white,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _contactViaWhatsApp(context) async {
    String whatsAppUrl = "";

    String phoneNumber = '96895516675';
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


