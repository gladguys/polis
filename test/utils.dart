import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/theme/light_theme.dart';
import 'package:polis/widget/my_app_injections.dart';
import 'package:simple_router/simple_router.dart';

import 'mock.dart';

final MockNavigatorObserver mockObserver = MockNavigatorObserver();

Widget connectedWidget(Widget widget) {
  SimpleRouter.setKey(GlobalKey<NavigatorState>());
  return MyAppInjections(
    child: BlocProvider<UserBloc>(
      create: (_) => UserBloc(
        user: UserModel(
          userId: '1',
        ),
        repository: MockUserRepository(),
        analyticsService: MockAnalyticsService(),
        sharedPreferencesService: MockSharedPreferencesService(),
      ),
      child: MaterialApp(
        navigatorObservers: [
          mockObserver,
        ],
        theme: lightTheme,
        navigatorKey: SimpleRouter.getKey(),
        home: widget,
      ),
    ),
  );
}
