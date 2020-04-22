import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../repository/abstract/timeline_repository.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({@required this.repository}) : assert(repository != null);

  final TimelineRepository repository;

  StreamSubscription _timelineSubscription;
  int newActivitiesCount = 0;
  List<dynamic> timelinePosts = [];
  DocumentSnapshot lastDocument;

  /// We just want to track the changes, so we don't need to make use of the
  /// the first values emitted onto the stream
  bool isTimelineFetchedOnce = false;

  @override
  TimelineState get initialState => InitialTimelineState();

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is FetchUserTimeline) {
      yield LoadingTimeline();

      _timelineSubscription?.cancel();
      try {
        _timelineSubscription =
            repository.getNewActivitiesCounter(event.userId).listen(
          (count) {
            if (isTimelineFetchedOnce) {
              newActivitiesCount += count;
              add(UpdateTimelineActivitiesCount(count: newActivitiesCount));
            } else {
              add(NotifyTimelineFetchedOnce());
              isTimelineFetchedOnce = true;
            }
          },
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
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
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
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
        );
      } on Exception {
        yield FetchTimelineFailed();
      }
    }
    if (event is ReloadTimeline) {
      yield LoadingTimeline();

      try {
        final timelineFirstData = await repository.getTimelineFirstPosts(
            event.userId, kTimelinePageSize);

        newActivitiesCount = 0;
        timelinePosts = [...timelineFirstData.item1];
        lastDocument = timelineFirstData.item2;

        yield TimelineUpdated(
          activities: timelinePosts,
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
        );
      } on Exception {
        yield FetchTimelineFailed();
      }
    }
    if (event is UpdateTimelineActivitiesCount) {
      yield TimelineUpdated(
        activities: timelinePosts,
        postsCount: timelinePosts.length,
        updatesCount: newActivitiesCount,
      );
    }
    if (event is NotifyTimelineFetchedOnce) {
      isTimelineFetchedOnce = true;
    }
  }

  @override
  Future<void> close() {
    _timelineSubscription?.cancel();
    return super.close();
  }
}
