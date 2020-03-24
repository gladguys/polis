import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polis/widget/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/service/ad_service.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'widget/my_app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator(await SharedPreferences.getInstance());
  G<AdService>().initAds();
  G<CrashlyticsService>().initCrashlytics();
  FlutterError.onError = G<CrashlyticsService>().crashlytics.recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate();

  runZoned(() {
    runApp(
      MyAppInjections(
        child: MyApp(),
      ),
    );
  }, onError: G<CrashlyticsService>().crashlytics.recordError);
}
