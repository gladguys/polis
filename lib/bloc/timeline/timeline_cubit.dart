import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/repository/abstract/repositories.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit({
    @required this.repository,
  })  : assert(repository != null),
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

  Future<void> fetchUserTimeline(String userId) async {
    emit(LoadingTimeline());

    await _subscribeForNewActivitiesUpdates(userId);

    try {
      final timelineFirstData =
          await repository.getTimelineFirstPosts(userId, kTimelinePageSize);

      final firstPosts = timelineFirstData.item1;

      timelinePosts.addAll(firstPosts);
      lastDocument = timelineFirstData.item2;

      if (firstPosts.isNotEmpty) {
        emit(
          TimelineUpdated(
            activities: timelinePosts,
            postsCount: timelinePosts.length,
            updatesCount: newActivitiesCount,
          ),
        );
      } else {
        emit(NoPostsAvailable());
      }
    } on Exception {
      emit(FetchTimelineFailed());
    }
  }

  Future<void> _subscribeForNewActivitiesUpdates(String userId) async {
    _timelineSubscription?.cancel();
    try {
      _timelineSubscription = repository.getNewActivitiesCounter(userId).listen(
        (count) {
          if (isTimelineFetchedOnce) {
            newActivitiesCount += count;
            updateTimelineActivitiesCount(count: newActivitiesCount);
          } else {
            notifyTimelineFetchedOnce();
            isTimelineFetchedOnce = true;
          }
        },
      );
    } on Exception {
      emit(FetchTimelineFailed());
    }
  }

  void fetchMorePosts(String userId, double timelineCurrentPosition) async {
    try {
      emit(
        ReachedEndFetchingMore(
          activities: timelinePosts,
        ),
      );
      final timelineData = await repository.getMorePosts(
          userId, kTimelinePageSize, lastDocument);

      timelinePosts.addAll(timelineData.item1);
      lastDocument = timelineData.item2;

      emit(
        TimelineUpdated(
          activities: timelinePosts,
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
        ),
      );
    } on Exception {
      emit(FetchTimelineFailed());
    }
  }

  void reloadTimeline(String userId) async {
    emit(LoadingTimeline());

    try {
      final timelineFirstData =
          await repository.getTimelineFirstPosts(userId, kTimelinePageSize);

      newActivitiesCount = 0;
      timelinePosts = [...timelineFirstData.item1];
      lastDocument = timelineFirstData.item2;

      emit(
        TimelineUpdated(
          activities: timelinePosts,
          postsCount: timelinePosts.length,
          updatesCount: newActivitiesCount,
        ),
      );
    } on Exception {
      emit(FetchTimelineFailed());
    }
  }

  void updateTimelineActivitiesCount({int count}) async {
    emit(
      TimelineUpdated(
        activities: timelinePosts,
        postsCount: timelinePosts.length,
        updatesCount: newActivitiesCount,
      ),
    );
  }

  void notifyTimelineFetchedOnce() {
    isTimelineFetchedOnce = true;
  }

  void refreshTimeline() async {
    emit(
      TimelineRefreshed(
        activities: timelinePosts,
      ),
    );
  }

  @override
  Future<void> close() {
    _timelineSubscription?.cancel();
    return super.close();
  }
}
