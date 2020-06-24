import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'search_politic_event.freezed.dart';

@freezed
abstract class SearchPoliticEvent with _$SearchPoliticEvent {
  factory SearchPoliticEvent.fetchPolitics(String userId) = FetchPolitics;
  factory SearchPoliticEvent.changeSearchPoliticFilter(
      {String estado, String partido, String term}) = ChangeSearchPoliticFilter;
  factory SearchPoliticEvent.followUnfollowSearchPolitic(
      {@required UserModel user,
      @required PoliticoModel politico}) = FollowUnfollowSearchPolitic;
  factory SearchPoliticEvent.changeFollowPoliticStatus(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) = ChangeFollowPoliticStatus;
}
