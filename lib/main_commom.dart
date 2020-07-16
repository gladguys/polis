import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_monitor/shared_preferences_monitor.dart';
import 'package:simple_router/simple_router.dart';

import 'bloc/flutter_bloc_observer.dart';
import 'core/domain/model/models.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'widget/core/my_app_connected.dart';
import 'widget/my_app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesMonitor.init();
  SharedPreferencesMonitor.setKey(SimpleRouter.getKey());
  await initHive();
  initLocator(await SharedPreferences.getInstance());
  G<CrashlyticsService>().initCrashlytics();
  await G<MessageService>().initMessaging();
  FlutterError.onError = G<CrashlyticsService>().crashlytics.recordFlutterError;
  Bloc.observer = FlutterBlocObserver(
    analyticsService: G<AnalyticsService>(),
    performanceService: G<PerformanceService>(),
  );
  initializeDateFormatting('pt_BR', null);

  runZoned(
    () {
      runApp(
        MyAppInjections(
          child: MyAppConnected(
            sharedPreferencesService: G<SharedPreferencesService>(),
          ),
        ),
      );
    },
    onError: G<CrashlyticsService>().crashlytics.recordError,
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PartidoModelAdapter());
  Hive.registerAdapter(PoliticoModelAdapter());
  Hive.registerAdapter(OrgaoModelAdapter());
}
