import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsService {
  CrashlyticsService({@required this.crashlytics})
      : assert(crashlytics != null);

  final Crashlytics crashlytics;

  void initCrashlytics() {
    crashlytics.enableInDevMode = true;
    FlutterError.onError = crashlytics.recordFlutterError;
  }
}
