import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

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
      _mapStoreUser(event);
    }
    if (event is Logout) {
      yield* _mapLogoutToState(event);
    }
    if (event is UpdateCurrentUser) {
      yield* _mapUpdateCurrentUserToState(event);
    }
    if (event is ChangeUserConfig) {
      yield* _mapChangeUserConfigToState(event);
    }
  }

  Stream<UserState> _mapStoreUser(StoreUser event) async* {
    user = event.user;
    //yield UserStoredLocally(user: user);
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
    //await sharedPreferencesService.setUser(user);
    yield CurrentUserUpdated(event.user);
  }

  Stream<UserState> _mapChangeUserConfigToState(ChangeUserConfig event) async* {
    try {
      final currentUser = event.user;
      final configName = event.configName;
      final userConfigs = currentUser.userConfigs;
      final configValue = !(userConfigs[event.configName] ?? false);

      userConfigs[configName] = configValue;

      user = user.copyWith(
        userConfigs: {
          ...userConfigs,
        },
      );

      await sharedPreferencesService.setUser(user);
      await repository.updateUserConfigs(user);

      yield CurrentUserConfigUpdated(
        user: user,
        config: configName,
        value: configValue,
      );
    } on Exception {
      yield UpdateUserConfigFailed();
    }
  }
}
