import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/models.dart';

part 'politic_profile_state.freezed.dart';

@freezed
abstract class PoliticProfileState with _$PoliticProfileState {
  factory PoliticProfileState.initial() = InitialPoliticProfileState;
  factory PoliticProfileState.getPoliticInfoSuccess({
    @required PoliticoModel politic,
    @required List<dynamic> lastActivities,
    @required int activitiesCount,
    @required bool isBeingFollowedByUser,
  }) = GetPoliticInfoSuccess;
  factory PoliticProfileState.politicMoreActivitiesSuccess(
      {@required List<dynamic> activities}) = PoliticMoreActivitiesSuccess;
  factory PoliticProfileState.getPoliticInfoFailed() = GetPoliticInfoFailed;
  factory PoliticProfileState.loadingPoliticInfo() = LoadingPoliticInfo;
  factory PoliticProfileState.userFollowingPoliticChanged(
      {@required PoliticoModel politico,
      @required bool isUserFollowingPolitic}) = UserFollowingPoliticChanged;
  factory PoliticProfileState.followPoliticFailed() = FollowPoliticFailed;
  factory PoliticProfileState.politicDontHaveValidEmail() =
      PoliticDontHaveValidEmail;
  factory PoliticProfileState.openEmailIntentFailed() = OpenEmailIntentFailed;
}
