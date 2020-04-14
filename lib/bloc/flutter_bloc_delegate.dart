import 'package:bloc/bloc.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';

import '../core/service/analytics_service.dart';
import '../core/service/services.dart';
import 'blocs.dart';

class FlutterBlocDelegate extends BlocDelegate {
  FlutterBlocDelegate(
      {@required this.analyticsService, @required this.performanceService})
      : assert(analyticsService != null),
        assert(performanceService != null);

  final AnalyticsService analyticsService;
  final PerformanceService performanceService;

  @override
  void onEvent(Bloc bloc, Object event) async {
    if (bloc is TimelineBloc) {
      Trace trace;
      if (event is FetchUserTimeline) {
        trace = await performanceService.getTrace(
            trace: 'TIMELINE_FetchUserTimeline');
      }
      if (event is FetchMorePosts) {
        trace =
            await performanceService.getTrace(trace: 'TIMELINE_FetchMorePosts');
      }
      if (event is ReloadTimeline) {
        trace =
            await performanceService.getTrace(trace: 'TIMELINE_ReloadTimeline');
      }
      if (trace != null) {
        trace.start();
        super.onEvent(bloc, event);
        trace.stop();
      } else {
        super.onEvent(bloc, event);
      }
    } else {
      super.onEvent(bloc, event);
    }

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
