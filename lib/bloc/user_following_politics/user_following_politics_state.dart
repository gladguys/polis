import 'package:equatable/equatable.dart';

import '../../model/politico_model.dart';

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

class LoadingPolitics extends UserFollowingPoliticsState {
  @override
  List<Object> get props => [];
}

class FollowedPoliticsUpdated extends UserFollowingPoliticsState {
  FollowedPoliticsUpdated({this.followedPolitics});

  final List<PoliticoModel> followedPolitics;

  @override
  List<Object> get props => [followedPolitics];
}

class PoliticsFilteredByTerm extends UserFollowingPoliticsState {
  PoliticsFilteredByTerm({this.filteredPolitics});

  final List<PoliticoModel> filteredPolitics;

  @override
  List<Object> get props => [filteredPolitics];
}
