import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class InitialUserProfileState extends UserProfileState {
  @override
  List<Object> get props => [];
}

class FetchUserRelatedInfoSuccess extends UserProfileState {
  FetchUserRelatedInfoSuccess(
      {@required this.politicsFollowing, @required this.userActivities})
      : assert(politicsFollowing != null),
        assert(userActivities != null);

  final List<PoliticoModel> politicsFollowing;
  final dynamic userActivities;

  @override
  List<Object> get props => [politicsFollowing];
}

class FetchUserRelatedInfoFailed extends UserProfileState {
  @override
  List<Object> get props => [];
}

class LoadingFetchUserInfo extends UserProfileState {
  @override
  List<Object> get props => [];
}
