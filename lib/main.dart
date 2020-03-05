import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/routing/polis_routing_observer.dart';
import 'core/service/analytics_service.dart';
import 'page/signin/signin_page_connected.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();

// TODO(rodrigo): locator this
AnalyticsService analyticsService =
    AnalyticsService(firebaseAnalytics: analytics);

const ADMOB_APP_ID = 'ca-app-pub-5806526425473649~5721958482';

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>[],
);

BannerAd myBanner = BannerAd(
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = InterstitialAd(
  adUnitId: InterstitialAd.testAdUnitId,
  targetingInfo: targetingInfo,
  listener: (event) {
    print("InterstitialAd event is $event");
  },
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: ADMOB_APP_ID);
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate();
  SimpleRouter.setKey(Get.key);

  myBanner
    ..load()
    ..show(
      anchorOffset: 60.0,
      horizontalCenterOffset: 10.0,
      anchorType: AnchorType.bottom,
    );

  /*myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );*/

  runZoned(() {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Get.key,
      home: SigninPageConnected(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
        PolisRoutingObserver(),
      ],
    );
  }
}
