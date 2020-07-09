import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/widget/my_app_injections.dart';
import 'package:simple_router/simple_router.dart';

import 'mock.dart';

final MockNavigatorObserver mockObserver = MockNavigatorObserver();

Widget connectedWidget(Widget widget,
    {bool withScaffold = false, List<RepositoryProvider> extraProviders}) {
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
      child: extraProviders != null
          ? MultiRepositoryProvider(
              providers: [
                ...extraProviders,
              ],
              child: TestApp(widget: widget, withScaffold: withScaffold),
            )
          : TestApp(widget: widget, withScaffold: withScaffold),
    ),
  );
}

class TestApp extends StatelessWidget {
  TestApp({this.widget, this.withScaffold});

  final Widget widget;
  final bool withScaffold;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        mockObserver,
      ],
      navigatorKey: SimpleRouter.getKey(),
      home: withScaffold
          ? Scaffold(
              body: widget,
            )
          : widget,
    );
  }
}
