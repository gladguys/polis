import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

import 'bloc/blocs.dart';
import 'bloc/flutter_bloc_delegate.dart';
import 'core/routing/polis_routing_observer.dart';
import 'core/service/ad_service.dart';
import 'core/service/locator.dart';
import 'core/service/services.dart';
import 'model/user_model.dart';
import 'page/signin/signin_page_connected.dart';
import 'repository/concrete/firebase/repositories.dart';

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
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(
        user: UserModel(),
        repository: FirebaseUserRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
      ),
      child: MaterialApp(
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
      ),
    );
  }
}
