import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

const ADMOB_APP_ID = 'ca-app-pub-5806526425473649~5721958482';

class AdService {
  AdService({@required this.bannerAd}) : assert(bannerAd != null);

  final BannerAd bannerAd;

  void initAds() {
    FirebaseAdMob.instance.initialize(appId: ADMOB_APP_ID);
  }

  void showBanner() {
    if (bannerAd != null) {
      bannerAd
        ..load()
        ..show(
          anchorOffset: 0,
          horizontalCenterOffset: 0,
          anchorType: AnchorType.bottom,
        );
    }
  }

  void dispose() {
    bannerAd?.dispose();
  }
}
