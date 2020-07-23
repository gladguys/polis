import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_monitor/flutter_bloc_monitor.dart';

import '../core/service/analytics_service.dart';
import '../core/service/services.dart';

class FlutterBlocObserver extends FlutterBlocMonitorDelegate {
  FlutterBlocObserver({@required this.analyticsService})
      : assert(analyticsService != null);

  final AnalyticsService analyticsService;

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    analyticsService.logBloc(
      event: transition.event.toString(),
      currentState: transition.currentState.toString(),
      nextState: transition.nextState.toString(),
    );
  }
}
