import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_suggestion_state.freezed.dart';

@freezed
abstract class PoliticSuggestionState with _$PoliticSuggestionState {
  factory PoliticSuggestionState.initial() = InitialPoliticSuggestionState;
  factory PoliticSuggestionState.fetchSuggestedPoliticsSuccess(
      List<PoliticoModel> politicos) = FetchSuggestedPoliticsSuccess;
  factory PoliticSuggestionState.fetchSuggestedPoliticsFailed() =
      FetchSuggestedPoliticsFailed;
  factory PoliticSuggestionState.savedSuggestedPolitics() =
      SavedSuggestedPolitics;
  factory PoliticSuggestionState.saveSuggestedPoliticsFailed() =
      SaveSuggestedPoliticsFailed;
  factory PoliticSuggestionState.changedPoliticsFollowingStatus(
      PoliticoModel politico,
      {bool isFollowing}) = ChangedPoliticsFollowingStatus;
  factory PoliticSuggestionState.loadingFetch() = LoadingFetch;
  factory PoliticSuggestionState.loadingSaveFollowPolitics() =
      LoadingSaveFollowPolitics;
}
