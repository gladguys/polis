import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsService {
  CrashlyticsService(this.crashlytics);

  final Crashlytics crashlytics;

  void initCrashlytics() {
    crashlytics.enableInDevMode = true;
    FlutterError.onError = crashlytics.recordFlutterError;
  }

  Function recordFlutterError(FlutterErrorDetails details) {
    return () => crashlytics.recordFlutterError(details);
  }

  Function recordError(dynamic exception, StackTrace stack) {
    return () => crashlytics.recordError(exception, stack);
  }
}
