import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
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
        var choosedTheme = lightTheme;
        if (state is CurrentUserConfigUpdated && isThemeConfig(state.config)) {
          choosedTheme = _getThemeForUser(state.user);
        } else {
          choosedTheme = _getThemeForUser(user);
        }
        return MaterialApp(
          title: POLIS,
          debugShowCheckedModeBanner: false,
          theme: choosedTheme,
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

  ThemeData _getThemeForUser(UserModel user) {
    if (user.hasNoConfigsSet) {
      return lightTheme;
    }
    return isConfigEnabledForUser(
      user: user,
      configuracao: Configuracao.isDarkModeEnabled,
    )
        ? darkTheme
        : lightTheme;
  }
}
