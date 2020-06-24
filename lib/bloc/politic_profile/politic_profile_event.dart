part of 'politic_profile_bloc.dart';

abstract class PoliticProfileEvent extends Equatable {
  const PoliticProfileEvent();
}

class GetPoliticInfo extends PoliticProfileEvent {
  GetPoliticInfo(this.politicId);

  final String politicId;

  @override
  List<Object> get props => [politicId];
}

class GetMoreActivities extends PoliticProfileEvent {
  GetMoreActivities(this.politicId);

  final String politicId;

  @override
  List<Object> get props => [politicId];
}

class FollowUnfollowProfilePolitic extends PoliticProfileEvent {
  FollowUnfollowProfilePolitic({@required this.isFollowing})
      : assert(isFollowing != null);

  final bool isFollowing;

  @override
  List<Object> get props => [isFollowing];
}

class SendEmailToPolitic extends PoliticProfileEvent {
  @override
  List<Object> get props => [];
}
