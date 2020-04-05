import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

abstract class PoliticProfileState extends Equatable {
  const PoliticProfileState();
}

class InitialPoliticProfileState extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class GetPoliticInfoSuccess extends PoliticProfileState {
  GetPoliticInfoSuccess(
      {@required this.politic,
      @required this.lastActivities,
      @required this.isBeingFollowedByUser})
      : assert(politic != null),
        assert(lastActivities != null),
        assert(isBeingFollowedByUser != null);

  final PoliticoModel politic;
  final List<dynamic> lastActivities;
  final bool isBeingFollowedByUser;

  @override
  List<Object> get props => [politic, isBeingFollowedByUser];
}

class GetPoliticInfoFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class LoadingPoliticInfo extends PoliticProfileState {
  @override
  List<Object> get props => [];
}

class UserFollowingPoliticChanged extends PoliticProfileState {
  UserFollowingPoliticChanged({this.isUserFollowingPolitic});

  final bool isUserFollowingPolitic;

  @override
  List<Object> get props => [isUserFollowingPolitic];
}

class FollowPoliticFailed extends PoliticProfileState {
  @override
  List<Object> get props => [];
}
