import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/timeline_repository.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({@required this.repository}) : assert(repository != null);

  final TimelineRepository repository;
  StreamSubscription _timelineSubscription;

  @override
  TimelineState get initialState => InitialTimelineState();

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is FetchUserTimeline) {
      _timelineSubscription?.cancel();
      try {
        _timelineSubscription = repository.getUserTimeline(event.userId).listen(
              (timelineData) => add(
                UpdateTimeline(
                  despesas: timelineData.item1,
                  propostas: timelineData.item2,
                ),
              ),
            );
      } on Exception {
        yield FetchTimelineFailed();
      }
    }
    if (event is UpdateTimeline) {
      yield TimelineUpdated(
        despesas: event.despesas,
        propostas: event.propostas,
      );
    }
  }

  @override
  Future<void> close() {
    _timelineSubscription?.cancel();
    return super.close();
  }
}
