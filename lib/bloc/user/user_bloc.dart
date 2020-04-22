import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/exception/exceptions.dart';
import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../repository/abstract/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
      {@required this.user,
      @required this.repository,
      @required this.analyticsService,
      @required this.sharedPreferencesService})
      : assert(user != null),
        assert(repository != null),
        assert(analyticsService != null),
        assert(sharedPreferencesService != null);

  final UserRepository repository;
  final AnalyticsService analyticsService;
  final SharedPreferencesService sharedPreferencesService;

  UserModel user;

  @override
  UserState get initialState => InitialUser();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is StoreUser) {
      user = event.user;
    }
    if (event is Logout) {
      yield SignoutLoading();

      try {
        await analyticsService.logLogout(user.name);
        await sharedPreferencesService.setUser(null);
        await repository.signOut();
        yield SignoutSucceded();
      } on SignOutException {
        yield SignoutFailed();
      }
    }
    if (event is UpdateCurrentUser) {
      user = event.user;
      yield CurrentUserUpdated(event.user);
    }
  }
}
