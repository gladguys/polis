import 'package:freezed_annotation/freezed_annotation.dart';

part 'politic_profile_event.freezed.dart';

@freezed
abstract class PoliticProfileEvent with _$PoliticProfileEvent {
  factory PoliticProfileEvent.getPoliticInfo(String politicId) = GetPoliticInfo;
  factory PoliticProfileEvent.getMoreActivities(String politicId) =
      GetMoreActivities;
  factory PoliticProfileEvent.followUnfollowProfilePolitic(
      {@required bool isFollowing}) = FollowUnfollowProfilePolitic;
  factory PoliticProfileEvent.sendEmailToPolitic() = SendEmailToPolitic;
}
