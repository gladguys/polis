import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/repository/abstract/repositories.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({@required this.repository})
      : assert(repository != null),
        super(InitialTimelineState());

  final TimelineRepository repository;

  StreamSubscription _timelineSubscription;
  double timelineCurrentPosition = 0;
  int newActivitiesCount = 0;
  List<dynamic> timelinePosts = [];
  DocumentSnapshot lastDocument;

  /// We just want to track the changes, so we don't need to make use of the
  /// the first values emitted onto the stream
  bool isTimelineFetchedOnce = false;

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is FetchUserTimeline) {
      yield* _mapFetchUserTimelineToState(event);
    }
    if (event is FetchMorePosts) {
      yield* _mapFetchMorePostsToState(event);
    }
    if (event is ReloadTimeline) {
      yield* _mapReloadTimelineToState(event);
    }
    if (event is UpdateTimelineActivitiesCount) {
      yield* _mapUpdateTimelineActivitiesCountToState(event);
    }
    if (event is NotifyTimelineFetchedOnce) {
      _notifyTimelineFetchedOnce();
    }
    if (event is RefreshTimeline) {
      yield* _mapRefreshTimelineToState(event);
    }
  }

  Stream<TimelineState> _mapFetchUserTimelineToState(
      FetchUserTimeline event) async* {
    yield LoadingTimeline();

    yield* _subscribeForNewActivitiesUpdates(event);

    try {
      final timelineFirstData = await repository.getTimelineFirstPosts(
          event.userId, kTimelinePageSize);

      final firstPosts = timelineFirstData.item1;

      timelinePosts.addAll(firstPosts);
      lastDocument = timelineFirstData.item2;

      if (firstPosts.isNotEmpty) {
        yield TimelineUpdated(
          activities: timelinePosts,
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
        );
      } else {
        yield NoPostsAvailable();
      }
    } on Exception {
      yield FetchTimelineFailed();
    }
  }

  Stream<TimelineState> _subscribeForNewActivitiesUpdates(
      FetchUserTimeline event) async* {
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
  }

  Stream<TimelineState> _mapFetchMorePostsToState(FetchMorePosts event) async* {
    timelineCurrentPosition = event.timelineCurrentPosition;
    try {
      yield ReachedEndFetchingMore(
        activities: timelinePosts,
      );
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

  Stream<TimelineState> _mapReloadTimelineToState(ReloadTimeline event) async* {
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

  Stream<TimelineState> _mapUpdateTimelineActivitiesCountToState(
      UpdateTimelineActivitiesCount event) async* {
    yield TimelineUpdated(
      activities: timelinePosts,
      postsCount: timelinePosts.length,
      updatesCount: newActivitiesCount,
    );
  }

  void _notifyTimelineFetchedOnce() {
    isTimelineFetchedOnce = true;
  }

  Stream<TimelineState> _mapRefreshTimelineToState(
      RefreshTimeline event) async* {
    yield TimelineRefreshed(
      activities: timelinePosts,
    );
  }

  @override
  Future<void> close() {
    _timelineSubscription?.cancel();
    return super.close();
  }
}
