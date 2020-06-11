import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sealed_class/sealed_class.dart';

part 'politic_profile_event.g.dart';

@Sealed([
  GetPoliticInfo,
  GetMoreActivities,
  FollowUnfollowProfilePolitic,
  SendEmailToPolitic,
])
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
