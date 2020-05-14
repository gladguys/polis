import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services.dart';

final GetIt G = GetIt.instance;

void initLocator([SharedPreferences sharedPreferences]) {
  G.registerSingleton(
    AnalyticsService(analytics: FirebaseAnalytics()),
  );
  G.registerSingleton(
    CrashlyticsService(crashlytics: Crashlytics.instance),
  );
  G.registerSingleton(
    PerformanceService(performance: FirebasePerformance.instance),
  );
  G.registerSingleton(
    SharedPreferencesService(sharedPreferences: sharedPreferences),
  );
  G.registerSingleton(
    UrlLauncherService(),
  );
  G.registerSingleton(
    ShareService(),
  );
  G.registerSingleton(
    MessageService(
      firebaseMessaging: FirebaseMessaging(),
      firestore: Firestore.instance,
      sharedPreferencesService: G<SharedPreferencesService>(),
    ),
  );
}
