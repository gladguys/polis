import 'dart:async';

import 'package:bloc/bloc.dart';
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

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate();
  SimpleRouter.setKey(Get.key);

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
