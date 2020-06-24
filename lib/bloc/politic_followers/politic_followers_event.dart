import 'package:freezed_annotation/freezed_annotation.dart';

part 'politic_followers_event.freezed.dart';

@freezed
abstract class PoliticFollowersEvent with _$PoliticFollowersEvent {
  factory PoliticFollowersEvent.getPoliticFollowers(String politicId) =
      GetPoliticFollowers;
}
