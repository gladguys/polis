import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'politic_suggestion_event.g.dart';

@Sealed([
  FetchSuggestedPolitics,
  FollowOrUnfollowPolitic,
  SavePoliticsToFollow,
])
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
