part of 'user_following_politics_bloc.dart';

abstract class UserFollowingPoliticsState extends Equatable {
  const UserFollowingPoliticsState();
}

class InitialUserFollowingPoliticsState extends UserFollowingPoliticsState {
  @override
  List<Object> get props => [];
}

class FetchPoliticsSuccess extends UserFollowingPoliticsState {
  FetchPoliticsSuccess(this.politics);

  final List<PoliticoModel> politics;

  @override
  List<Object> get props => [politics];
}

class FetchPoliticsFailed extends UserFollowingPoliticsState {
  @override
  List<Object> get props => [];
}

class FollowUnfollowFailed extends UserFollowingPoliticsState {
  @override
  List<Object> get props => [];
}

class LoadingPolitics extends UserFollowingPoliticsState {
  @override
  List<Object> get props => [];
}

class FollowedPoliticsUpdated extends UserFollowingPoliticsState {
  FollowedPoliticsUpdated(
      {@required this.followedPolitics,
      @required this.politicoUpdated,
      @required this.isFollowing})
      : assert(followedPolitics != null),
        assert(politicoUpdated != null),
        assert(isFollowing != null);

  final List<PoliticoModel> followedPolitics;
  final PoliticoModel politicoUpdated;
  final bool isFollowing;

  @override
  List<Object> get props => [followedPolitics, politicoUpdated, isFollowing];
}

class PoliticsFilteredByTerm extends UserFollowingPoliticsState {
  PoliticsFilteredByTerm({@required this.filteredPolitics})
      : assert(filteredPolitics != null);

  final List<PoliticoModel> filteredPolitics;

  @override
  List<Object> get props => [filteredPolitics];
}
