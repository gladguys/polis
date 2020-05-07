part of 'timeline_bloc.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();
}

class FetchUserTimeline extends TimelineEvent {
  FetchUserTimeline(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class NotifyTimelineFetchedOnce extends TimelineEvent {
  @override
  List<Object> get props => [];
}

class ReloadTimeline extends TimelineEvent {
  ReloadTimeline(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class FetchMorePosts extends TimelineEvent {
  FetchMorePosts(this.userId, this.timelineCurrentPosition);

  final String userId;
  final double timelineCurrentPosition;

  @override
  List<Object> get props => [userId, timelineCurrentPosition];
}

class UpdateTimelineActivitiesCount extends TimelineEvent {
  UpdateTimelineActivitiesCount({this.count});

  final int count;

  @override
  List<Object> get props => [count];
}
