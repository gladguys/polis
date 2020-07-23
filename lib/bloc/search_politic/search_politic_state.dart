part of 'search_politic_cubit.dart';

abstract class SearchPoliticState extends Equatable {
  const SearchPoliticState();
}

class InitialSearchPoliticState extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class FetchSearchPoliticsSuccess extends SearchPoliticState {
  FetchSearchPoliticsSuccess(this.politics);

  final List<PoliticoModel> politics;

  @override
  List<Object> get props => [politics];
}

class LoadingFetchPolitics extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class FetchSearchPoliticsFailed extends SearchPoliticState {
  @override
  List<Object> get props => [];
}

class SearchPoliticFilterChanged extends SearchPoliticState {
  SearchPoliticFilterChanged(
      {this.politics, this.statePicked, this.partidoPicked, this.searchTerm});

  final List<PoliticoModel> politics;
  final String statePicked;
  final String partidoPicked;
  final String searchTerm;

  @override
  List<Object> get props => [politics, statePicked, partidoPicked, searchTerm];
}

class FollowedSearchPoliticsUpdated extends SearchPoliticState {
  FollowedSearchPoliticsUpdated(
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

class FollowUnfollowPoliticsFailed extends SearchPoliticState {
  @override
  List<Object> get props => [];
}
