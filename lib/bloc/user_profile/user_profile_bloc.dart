import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/user_profile_repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({@required this.repository}) : assert(repository != null);

  final UserProfileRepository repository;
  List<PoliticoModel> politicsFollowing;
  List<dynamic> userActivities;

  @override
  UserProfileState get initialState => InitialUserProfileState();

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is FetchUserRelatedInfo) {
      yield LoadingFetchUserInfo();

      try {
        politicsFollowing = await repository.getPoliticsFollowing(event.userId);
        userActivities = await repository.getUserActivities(event.userId);

        yield FetchUserRelatedInfoSuccess(
          politicsFollowing: politicsFollowing,
          userActivities: userActivities,
        );
      } on Exception {
        yield FetchUserRelatedInfoFailed();
      }
    }
  }
}
