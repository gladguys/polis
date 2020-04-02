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

class UpdateTimeline extends TimelineEvent {
  UpdateTimeline({this.activities});

  final List<dynamic> activities;

  @override
  List<Object> get props => [activities];
}
