import 'package:firebase_admob/firebase_admob.dart';

const ADMOB_APP_ID = 'ca-app-pub-5806526425473649~5721958482';

class AdService {
  MobileAdTargetingInfo targetingInfo;
  BannerAd bannerAd;

  void initAds() {
    FirebaseAdMob.instance.initialize(appId: ADMOB_APP_ID);

    targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      testDevices: <String>[],
    );

    bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (event) {
        print("BannerAd event is $event");
      },
    );
  }

  void showBanner() {
    if (bannerAd != null) {
      bannerAd
        ..load()
        ..show(
          anchorOffset: 60.0,
          horizontalCenterOffset: 10.0,
          anchorType: AnchorType.bottom,
        );
    }
  }

  void dispose() {
    bannerAd?.dispose();
  }
}
