import 'package:equatable/equatable.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();
}

class FetchUserTimeline extends TimelineEvent {
  FetchUserTimeline(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ReloadTimeline extends TimelineEvent {
  ReloadTimeline(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class FetchMorePosts extends TimelineEvent {
  FetchMorePosts(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class UpdateTimelineActivitiesCount extends TimelineEvent {
  UpdateTimelineActivitiesCount({this.count});

  final int count;

  @override
  List<Object> get props => [count];
}
