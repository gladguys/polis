import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enum/configuracao.dart';
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
        assert(sharedPreferencesService != null),
        super(InitialUser());

  final UserRepository repository;
  final AnalyticsService analyticsService;
  final SharedPreferencesService sharedPreferencesService;

  UserModel user;

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
    if (event is SetUserPickedTheme) {
      yield* _mapSetUserPickedThemeToState(event);
    }
  }

  void _mapStoreUser(StoreUser event) {
    user = event.user;
  }

  Stream<UserState> _mapLogoutToState(Logout event) async* {
    yield SignoutLoading();

    try {
      await analyticsService.logLogout(user.name);
      await sharedPreferencesService.setUser(null);
      await repository.signOut();
      yield SignoutSucceded();
      yield InitialUser();
    } on SignOutException {
      yield SignoutFailed();
    }
  }

  Stream<UserState> _mapUpdateCurrentUserToState(
      UpdateCurrentUser event) async* {
    user = event.user;
    await sharedPreferencesService.setUser(user);
    yield CurrentUserUpdated(user);
  }

  Stream<UserState> _mapChangeUserConfigToState(ChangeUserConfig event) async* {
    try {
      final config = event.config;
      final configValue = event.value;
      final currentUser = event.user;

      final configName = configToStringKey(config);
      final userConfigs = currentUser.userConfigs ?? {};

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

  Stream<UserState> _mapSetUserPickedThemeToState(
      SetUserPickedTheme event) async* {
    yield CurrentUserConfigUpdated(
      user: event.user,
    );
  }
}
