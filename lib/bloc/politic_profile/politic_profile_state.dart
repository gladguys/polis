part of 'politic_profile_bloc.dart';

@Sealed([
  GetPoliticInfoSuccess,
  GetPoliticInfoFailed,
  LoadingPoliticInfo,
  PoliticMoreActivitiesSuccess,
  UserFollowingPoliticChanged,
  FollowPoliticFailed,
  PoliticDontHaveValidEmail,
  OpenEmailIntentFailed,
])
abstract class PoliticProfileState extends Equatable {
  const PoliticProfileState();
}

class InitialPoliticProfileState extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class GetPoliticInfoSuccess extends PoliticProfileState {
  GetPoliticInfoSuccess({
    @required this.politic,
    @required this.lastActivities,
    @required this.activitiesCount,
    @required this.isBeingFollowedByUser,
  })  : assert(politic != null),
        assert(lastActivities != null),
        assert(activitiesCount != null),
        assert(isBeingFollowedByUser != null);

  final PoliticoModel politic;
  final List<dynamic> lastActivities;
  final int activitiesCount;
  final bool isBeingFollowedByUser;

  @override
  List<Object> get props => [politic, activitiesCount, isBeingFollowedByUser];
}

class GetPoliticInfoFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticInfo extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class PoliticMoreActivitiesSuccess extends PoliticProfileState {
  PoliticMoreActivitiesSuccess({@required this.activities})
      : assert(activities != null);

  final List<dynamic> activities;

  @override
  List<Object> get props => [activities];
}

class UserFollowingPoliticChanged extends PoliticProfileState {
  UserFollowingPoliticChanged(
      {@required this.politico, @required this.isUserFollowingPolitic})
      : assert(politico != null),
        assert(isUserFollowingPolitic != null);

  final PoliticoModel politico;
  final bool isUserFollowingPolitic;

  @override
  List<Object> get props => [politico, isUserFollowingPolitic];
}

class FollowPoliticFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class PoliticDontHaveValidEmail extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class OpenEmailIntentFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}
