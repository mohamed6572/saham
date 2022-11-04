import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../consttant/const.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {



//ads
  late BannerAd myBanner;

  void buildBannerad() {
    myBanner = BannerAd(
      adUnitId: bannerIDD, //test
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
        onAdOpened: (Ad ad) => print('Ad opened.'),
        onAdClosed: (Ad ad) => print('Ad closed.'),
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );
    myBanner.load();
  } //ads
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildBannerad();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        WebView(
          initialUrl: 'https://saham-club.net/?page_id=2735',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        Container(
          child: AdWidget(ad:myBanner),
          width:myBanner.size.width.toDouble(),
          height:myBanner.size.height.toDouble(),
        ),

      ],
    );
  }
}

