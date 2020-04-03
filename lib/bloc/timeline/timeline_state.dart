import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();
}

class InitialTimelineState extends TimelineState {
  @override
  List<Object> get props => [];
}

class TimelineUpdated extends TimelineState {
  TimelineUpdated({@required this.activities}) : assert(activities != null);

  final List<dynamic> activities;

  @override
  List<Object> get props => [activities];
}

class FetchTimelineFailed extends TimelineState {
  @override
  List<Object> get props => [];
}

class LoadingTimeline extends TimelineState {
  @override
  List<Object> get props => [];
}
