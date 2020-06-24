import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/routing/polis_routing_observer.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/pages.dart';
import '../../page/theme/main_theme.dart';

class MyApp extends StatefulWidget {
  MyApp({@required this.sharedPreferencesService})
      : assert(sharedPreferencesService != null);

  final SharedPreferencesService sharedPreferencesService;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel user;
  bool isUserLogged;

  SharedPreferencesService get sharedPreferencesService =>
      widget.sharedPreferencesService;

  @override
  void initState() {
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
        systemNavigationBarIconBrightness:
            isUserLogged ? Brightness.dark : Brightness.light,
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
        home: isUserLogged
            ? TimelinePageConnected(
                appUpdateService: G<AppUpdateService>(),
              )
            : InitialPageConnected(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: G<AnalyticsService>().analytics),
          PolisRoutingObserver(),
        ],
      ),
    );
  }
}
