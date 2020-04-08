import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services.dart';

final GetIt G = GetIt.instance;

void initLocator([SharedPreferences sharedPreferences]) {
  G.registerSingleton(
    AdService(
      bannerAd: BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.smartBanner,
        targetingInfo: const MobileAdTargetingInfo(
          keywords: <String>['flutterio', 'beautiful apps'],
          contentUrl: 'https://flutter.io',
          childDirected: false,
          testDevices: <String>[],
        ),
      ),
    ),
  );
  G.registerSingleton(
    AnalyticsService(analytics: FirebaseAnalytics()),
  );
  G.registerSingleton(
    CrashlyticsService(crashlytics: Crashlytics.instance),
  );
  G.registerSingleton(
    SharedPreferencesService(sharedPreferences: sharedPreferences),
  );
  G.registerSingleton(
    UrlLauncherService(),
  );
}
