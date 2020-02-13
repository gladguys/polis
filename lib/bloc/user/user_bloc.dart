import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/exception/exceptions.dart';
import '../../model/user_model.dart';
import '../../repository/abstract/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({@required this.user, @required this.repository})
      : assert(user != null),
        assert(repository != null);

  UserModel user;
  UserRepository repository;

  @override
  UserState get initialState => InitialUser();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is Logout) {
      yield SignoutLoading();

      try {
        await repository.signOut();
        yield SignoutSucceded();
      } on SignOutException {
        yield SignoutFailed();
      }
    }
  }
}
