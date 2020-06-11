import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import '../blocs.dart';

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
    yield* event.join(
      _mapStoreUser,
      _mapLogoutToState,
      _mapUpdateCurrentUserToState,
    );
  }

  Stream<UserState> _mapStoreUser(StoreUser event) async* {
    user = event.user;
    yield UserStoredSuccess();
  }

  Stream<UserState> _mapLogoutToState(Logout event) async* {
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

  Stream<UserState> _mapUpdateCurrentUserToState(
      UpdateCurrentUser event) async* {
    user = event.user;
    yield CurrentUserUpdated(event.user);
  }
}
