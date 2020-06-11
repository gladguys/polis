import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'politic_suggestion_state.g.dart';

@Sealed([
  InitialPoliticSuggestionState,
  FetchSuggestedPoliticsSuccess,
  FetchSuggestedPoliticsFailed,
  SavedSuggestedPolitics,
  SaveSuggestedPoliticsFailed,
  ChangedPoliticsFollowingStatus,
  LoadingFetch,
  LoadingSaveFollowPolitics,
])
abstract class PoliticSuggestionState extends Equatable {
  const PoliticSuggestionState();
}

class InitialPoliticSuggestionState extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}

class FetchSuggestedPoliticsSuccess extends PoliticSuggestionState {
  FetchSuggestedPoliticsSuccess(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  List<Object> get props => [politicos];
}

class FetchSuggestedPoliticsFailed extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}

class SavedSuggestedPolitics extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}

class SaveSuggestedPoliticsFailed extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}

class ChangedPoliticsFollowingStatus extends PoliticSuggestionState {
  ChangedPoliticsFollowingStatus(this.politico, {this.isFollowing});

  final PoliticoModel politico;
  final bool isFollowing;

  @override
  List<Object> get props => [politico, isFollowing];
}

class LoadingFetch extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}

class LoadingSaveFollowPolitics extends PoliticSuggestionState {
  @override
  List<Object> get props => [];
}
