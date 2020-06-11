import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sealed_class/sealed_class.dart';

import '../../core/domain/model/models.dart';

part 'user_profile_state.g.dart';

@Sealed([
  InitialUserProfileState,
  FetchUserRelatedInfoSuccess,
  LoadingFetchUserInfo,
  FetchUserRelatedInfoFailed,
])
abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class InitialUserProfileState extends UserProfileState {
  @override
  List<Object> get props => [];
}

class FetchUserRelatedInfoSuccess extends UserProfileState {
  FetchUserRelatedInfoSuccess(
      {@required this.politicsFollowing, @required this.userActions})
      : assert(politicsFollowing != null),
        assert(userActions != null);

  final List<PoliticoModel> politicsFollowing;
  final List<AcaoUsuarioModel> userActions;

  @override
  List<Object> get props => [politicsFollowing, userActions];
}

class LoadingFetchUserInfo extends UserProfileState {
  @override
  List<Object> get props => [];
}

class FetchUserRelatedInfoFailed extends UserProfileState {
  @override
  List<Object> get props => [];
}
