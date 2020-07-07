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
    if (event is AddCommentToUser) {
      yield* _mapAddCommentToUserToState(event);
    }
    if (event is DeleteCommentToUser) {
      yield* _mapDeleteCommentToUserToState(event);
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
    } on SignOutException {
      yield SignoutFailed();
    }
  }

  Stream<UserState> _mapUpdateCurrentUserToState(
      UpdateCurrentUser event) async* {
    user = event.user;
    await sharedPreferencesService.setUser(user);
    yield CurrentUserUpdated(event.user);
  }

  Stream<UserState> _mapAddCommentToUserToState(AddCommentToUser event) async* {
    try {
      final comment = event.comment;
      final userComments = user.userComments ?? {};
      final userWithComments = user.copyWith(
        userComments: {
          ...userComments,
          '${comment.id}': true,
        },
      );
      user = userWithComments;

      await repository.saveUserComments(user: user, comments: userComments);
      await sharedPreferencesService.setUser(user);

      yield CurrentUserUpdated(user);
    } on Exception {
      yield UpdateCurrentUserFailed();
    }
  }

  Stream<UserState> _mapDeleteCommentToUserToState(
      DeleteCommentToUser event) async* {
    try {
      final comment = event.comment;
      final userComments = user.userComments ?? {};
      userComments.remove(comment.id);

      user = user.copyWith(
        userComments: userComments,
      );

      await repository.saveUserComments(user: user, comments: userComments);
      await sharedPreferencesService.setUser(user);

      yield CurrentUserUpdated(user);
    } on Exception {
      yield UpdateCurrentUserFailed();
    }
  }
}
