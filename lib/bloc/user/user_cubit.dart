import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enum/configuracao.dart';
import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    @required this.user,
    @required this.repository,
    @required this.analyticsService,
    @required this.sharedPreferencesService,
  })  : assert(user != null),
        assert(repository != null),
        assert(analyticsService != null),
        assert(sharedPreferencesService != null),
        super(InitialUser());

  final UserRepository repository;
  final AnalyticsService analyticsService;
  final SharedPreferencesService sharedPreferencesService;

  UserModel user;

  // ignore: use_setters_to_change_properties
  void storeUser(UserModel userToStore) async {
    user = userToStore;
  }

  void logout() async {
    emit(SignoutLoading());

    try {
      await analyticsService.logLogout(user.name);
      await sharedPreferencesService.setUser(null);
      await repository.signOut();
      emit(SignoutSucceded());
      emit(InitialUser());
    } on SignOutException {
      emit(SignoutFailed());
    }
  }

  void updateCurrentUser(UserModel user) async {
    await sharedPreferencesService.setUser(user);
    emit(CurrentUserUpdated(user));
  }

  void changeUserConfig(
      {UserModel currentUser, Configuracao config, bool configValue}) async {
    try {
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

      emit(
        CurrentUserConfigUpdated(
          user: user,
          config: configName,
          value: configValue,
        ),
      );
    } on Exception {
      emit(UpdateUserConfigFailed());
    }
  }

  void setUserPickedTheme(UserModel user) async {
    emit(
      CurrentUserConfigUpdated(
        user: user,
      ),
    );
  }
}
