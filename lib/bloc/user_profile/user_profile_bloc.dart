import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../repository/abstract/user_profile_repository.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({@required this.repository}) : assert(repository != null);

  final UserProfileRepository repository;
  List<PoliticoModel> politicsFollowing;
  List<AcaoUsuarioModel> userActions;

  @override
  UserProfileState get initialState => InitialUserProfileState();

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is FetchUserRelatedInfo) {
      yield* _mapFetchUserRelatedInfoToState(event);
    }
  }

  Stream<UserProfileState> _mapFetchUserRelatedInfoToState(
      FetchUserRelatedInfo event) async* {
    yield LoadingFetchUserInfo();

    try {
      politicsFollowing = await repository.getPoliticsFollowing(event.userId);
      userActions = await repository.getUserActions(event.userId);

      yield FetchUserRelatedInfoSuccess(
        politicsFollowing: politicsFollowing,
        userActions: userActions,
      );
    } on Exception {
      yield FetchUserRelatedInfoFailed();
    }
  }
}
