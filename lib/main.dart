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
import 'page/signin/signin_page_connected.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  G<AdService>().initAds();
  G<CrashlyticsService>().initCrashlytics();
  FlutterError.onError = G<CrashlyticsService>().recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate();
  SimpleRouter.setKey(Get.key);

  runZoned(() {
    runApp(MyApp());
  }, onError: G<CrashlyticsService>().recordError);
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
        FirebaseAnalyticsObserver(analytics: G<AnalyticsService>().analytics),
        PolisRoutingObserver(),
      ],
    );
  }
}
