part of 'timeline_bloc.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();
}

class InitialTimelineState extends TimelineState {
  @override
  List<Object> get props => [];
}

class NoPostsAvailable extends TimelineState {
  @override
  List<Object> get props => [];
}

class TimelineUpdated extends TimelineState {
  TimelineUpdated(
      {@required this.activities,
      @required this.postsCount,
      @required this.updatesCount})
      : assert(activities != null),
        assert(postsCount != null),
        assert(updatesCount != null);

  final List<dynamic> activities;
  final int postsCount;
  final int updatesCount;

  @override
  List<Object> get props => [activities, postsCount, updatesCount];
}

class FetchTimelineFailed extends TimelineState {
  @override
  List<Object> get props => [];
}

class ReachedEndFetchingMore extends TimelineState {
  ReachedEndFetchingMore({@required this.activities})
      : assert(activities != null);

  final List<dynamic> activities;

  @override
  List<Object> get props => [activities];
}

class LoadingTimeline extends TimelineState {
  @override
  List<Object> get props => [];
}
