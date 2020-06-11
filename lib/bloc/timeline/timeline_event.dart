import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'timeline_event.g.dart';

@Sealed([
  FetchUserTimeline,
  FetchMorePosts,
  NotifyTimelineFetchedOnce,
  ReloadTimeline,
  RefreshTimeline,
  UpdateTimelineActivitiesCount,
])
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

class RefreshTimeline extends TimelineEvent {
  @override
  List<Object> get props => [];
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
