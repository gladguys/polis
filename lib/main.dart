import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/routing/polis_routing_observer.dart';
import 'core/service/ad_service.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'page/initial/initial_page.dart';
import 'page/theme/main_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  G<AdService>().initAds();
  G<CrashlyticsService>().initCrashlytics();
  FlutterError.onError = G<CrashlyticsService>().crashlytics.recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate();
  SimpleRouter.setKey(Get.key);

  runZoned(() {
    runApp(MyApp());
  }, onError: G<CrashlyticsService>().crashlytics.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polis',
      debugShowCheckedModeBanner: false,
      theme: theme,
      navigatorKey: Get.key,
      home: InitialPage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: G<AnalyticsService>().analytics),
        PolisRoutingObserver(),
      ],
    );
  }
}
