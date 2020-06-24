import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_suggestion_event.freezed.dart';

@freezed
abstract class PoliticSuggestionEvent with _$PoliticSuggestionEvent {
  factory PoliticSuggestionEvent.fetchSuggestedPolitics(String stateOption) =
      FetchSuggestedPolitics;
  factory PoliticSuggestionEvent.followOrUnfollowPolitic(
      PoliticoModel politico) = FollowOrUnfollowPolitic;
  factory PoliticSuggestionEvent.savePoliticsToFollow(
      {@required UserModel user}) = SavePoliticsToFollow;
}
