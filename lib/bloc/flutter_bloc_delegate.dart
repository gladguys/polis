import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../core/service/analytics_service.dart';

class FlutterBlocDelegate extends BlocDelegate {
  FlutterBlocDelegate({@required this.analyticsService})
      : assert(analyticsService != null);

  final AnalyticsService analyticsService;

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('[Bloc] Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('[Bloc] State Transition: '
        '[${transition.currentState} => ${transition.nextState}]');

    analyticsService.logBloc(
      event: transition.event.toString(),
      currentState: transition.currentState.toString(),
      nextState: transition.nextState.toString(),
    );
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
