import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'search_politic_state.freezed.dart';

@freezed
abstract class SearchPoliticState with _$SearchPoliticState {
  factory SearchPoliticState.initial() = InitialSearchPoliticState;
  factory SearchPoliticState.fetchSearchPoliticsSuccess(
      List<PoliticoModel> politics) = FetchSearchPoliticsSuccess;
  factory SearchPoliticState.loadingFetchPolitics() = LoadingFetchPolitics;
  factory SearchPoliticState.fetchSearchPoliticsFailed() =
      FetchSearchPoliticsFailed;
  factory SearchPoliticState.searchPoliticFilterChanged(
      {List<PoliticoModel> politics,
      String statePicked,
      String partidoPicked,
      String searchTerm}) = SearchPoliticFilterChanged;
  factory SearchPoliticState.followedSearchPoliticsUpdated({
    List<PoliticoModel> followedPolitics,
    PoliticoModel politicoUpdated,
    bool isFollowing,
  }) = FollowedSearchPoliticsUpdated;
  factory SearchPoliticState.followUnfollowPoliticsFailed() =
      FollowUnfollowPoliticsFailed;
}
