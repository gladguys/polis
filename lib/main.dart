import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/service/ad_service.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'widget/my_app.dart';

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
