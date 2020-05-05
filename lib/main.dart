import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'model/models.dart';
import 'widget/my_app.dart';
import 'widget/my_app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initLocator(await SharedPreferences.getInstance());
  G<CrashlyticsService>().initCrashlytics();
  FlutterError.onError = G<CrashlyticsService>().crashlytics.recordFlutterError;
  BlocSupervisor.delegate = FlutterBlocDelegate(
    analyticsService: G<AnalyticsService>(),
    performanceService: G<PerformanceService>(),
  );
  initializeDateFormatting("pt_BR", null);

  runZoned(() {
    runApp(
      MyAppInjections(
        child: MyApp(),
      ),
    );
  }, onError: G<CrashlyticsService>().crashlytics.recordError);
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PartidoModelAdapter());
  Hive.registerAdapter(PoliticoModelAdapter());
  Hive.registerAdapter(OrgaoModelAdapter());
}
