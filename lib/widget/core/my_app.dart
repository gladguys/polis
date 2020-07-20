import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/configuracao.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/polis_routing_observer.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../page/pages.dart';
import '../../page/theme/dark_theme.dart';
import '../../page/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({this.user, this.isUserLogged = false});

  final UserModel user;
  final bool isUserLogged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          current is InitialUser || current is CurrentUserConfigUpdated,
      builder: (_, state) {
        var themeMode = ThemeMode.system;
        if (state is CurrentUserConfigUpdated && isThemeConfig(state.config)) {
          themeMode = _getThemeForUser(state.user);
        } else {
          themeMode = _getThemeForUser(user);
        }
        _setSystemBarColor(themeMode);
        return MaterialApp(
          title: POLIS,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: SimpleRouter.getKey(),
          home: isUserLogged
              ? TimelinePageConnected(
                  appUpdateService: G<AppUpdateService>(),
                )
              : InitialPageConnected(),
          navigatorObservers: [
            FirebaseAnalyticsObserver(
              analytics: G<AnalyticsService>().analytics,
            ),
            PolisRoutingObserver(),
          ],
        );
      },
    );
  }

  ThemeMode _getThemeForUser(UserModel user) {
    if (user == null || user.hasNoConfigsSet) {
      return ThemeMode.system;
    }
    return isConfigEnabledForUser(
      user: user,
      configuracao: Configuracao.isDarkModeEnabled,
    )
        ? ThemeMode.dark
        : ThemeMode.system;
  }

  void _setSystemBarColor(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isUserLogged
            ? themeMode == ThemeMode.dark
                ? darkTheme.scaffoldBackgroundColor
                : lightTheme.scaffoldBackgroundColor
            : Colors.black,
        systemNavigationBarIconBrightness: isUserLogged
            ? themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark
            : Brightness.light,
      ),
    );
  }
}
