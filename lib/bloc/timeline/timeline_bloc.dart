import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/constants.dart';
import '../../repository/abstract/timeline_repository.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({@required this.repository}) : assert(repository != null);

  final TimelineRepository repository;
  StreamSubscription _timelineSubscription;

  List<dynamic> timelinePosts = [];
  DocumentSnapshot lastDocument;

  @override
  TimelineState get initialState => InitialTimelineState();

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is FetchUserTimeline) {
      yield LoadingTimeline();

      _timelineSubscription?.cancel();
      try {
        _timelineSubscription = repository.getUserTimeline(event.userId).listen(
              (timelineData) => add(
                UpdateTimelineActivitiesCount(count: 0),
              ),
            );
      } on Exception {
        yield FetchTimelineFailed();
      }

      try {
        final timelineFirstData = await repository.getTimelineFirstPosts(
            event.userId, kTimelinePageSize);

        timelinePosts.addAll(timelineFirstData.item1);
        lastDocument = timelineFirstData.item2;

        yield TimelineUpdated(
          activities: timelinePosts,
          count: timelinePosts.length,
        );
      } on Exception {
        yield FetchTimelineFailed();
      }
    }
    if (event is FetchMorePosts) {
      try {
        final timelineData = await repository.getMorePosts(
            event.userId, kTimelinePageSize, lastDocument);

        timelinePosts.addAll(timelineData.item1);
        lastDocument = timelineData.item2;

        yield TimelineUpdated(
          activities: timelinePosts,
          count: timelinePosts.length,
        );
      } on Exception {
        yield FetchTimelineFailed();
      }
    }
  }

  @override
  Future<void> close() {
    _timelineSubscription?.cancel();
    return super.close();
  }
}
