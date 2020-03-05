import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

import 'services.dart';

final GetIt G = GetIt.instance;

void initLocator() {
  G.registerSingleton(AdService());
  G.registerSingleton(AnalyticsService(analytics: FirebaseAnalytics()));
  G.registerSingleton(CrashlyticsService(Crashlytics.instance));
}
