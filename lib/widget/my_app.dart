import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../bloc/blocs.dart';
import '../core/routing/polis_routing_observer.dart';
import '../core/service/locator.dart';
import '../core/service/services.dart';
import '../i18n/i18n.dart';
import '../model/models.dart';
import '../page/pages.dart';
import '../page/theme/main_theme.dart';
import '../repository/concrete/repositories.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel user;
  bool isUserLogged;
  SharedPreferencesService sharedPreferencesService;

  @override
  void initState() {
    sharedPreferencesService = G<SharedPreferencesService>();
    user = sharedPreferencesService.getUser();
    isUserLogged = sharedPreferencesService.isUserLogged();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            isUserLogged ? theme.scaffoldBackgroundColor : Colors.black,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(
        user: user ?? UserModel(),
        repository: context.repository<FirebaseUserRepository>(),
        analyticsService: G<AnalyticsService>(),
        sharedPreferencesService: G<SharedPreferencesService>(),
      ),
      child: MaterialApp(
        title: POLIS,
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorKey: SimpleRouter.getKey(),
        home: isUserLogged ? TimelinePageConnected() : InitialPageConnected(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: G<AnalyticsService>().analytics),
          PolisRoutingObserver(),
        ],
      ),
    );
  }
}
