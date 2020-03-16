import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/politico_model.dart';

abstract class PoliticSuggestionEvent extends Equatable {
  const PoliticSuggestionEvent();
}

class FetchSuggestedPolitics extends PoliticSuggestionEvent {
  @override
  List<Object> get props => [];
}

class FollowOrUnfollowPolitic extends PoliticSuggestionEvent {
  FollowOrUnfollowPolitic(this.politico);

  final PoliticoModel politico;

  @override
  List<Object> get props => [politico];
}

class SavePoliticsToFollow extends PoliticSuggestionEvent {
  SavePoliticsToFollow({@required this.userId}) : assert(userId != null);

  final String userId;

  @override
  List<Object> get props => [userId];
}
