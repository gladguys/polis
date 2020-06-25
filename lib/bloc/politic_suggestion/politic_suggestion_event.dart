part of 'politic_suggestion_bloc.dart';

abstract class PoliticSuggestionEvent extends Equatable {
  const PoliticSuggestionEvent();
}

class FetchSuggestedPolitics extends PoliticSuggestionEvent {
  FetchSuggestedPolitics(this.stateOption)
      : assert(stateOption != null && stateOption != '');

  final String stateOption;

  @override
  List<Object> get props => [stateOption];
}

class FollowOrUnfollowPolitic extends PoliticSuggestionEvent {
  FollowOrUnfollowPolitic(this.politico);

  final PoliticoModel politico;

  @override
  List<Object> get props => [politico];
}

class SavePoliticsToFollow extends PoliticSuggestionEvent {
  SavePoliticsToFollow({@required this.user}) : assert(user != null);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
