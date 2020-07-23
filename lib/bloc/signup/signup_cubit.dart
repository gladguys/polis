import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/exception/exceptions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    @required this.repository,
    @required this.analyticsService,
  })  : assert(repository != null),
        assert(analyticsService != null),
        super(InitialSignup());

  final SignupRepository repository;
  final AnalyticsService analyticsService;

  void signup({@required UserModel user, File profilePhoto}) async {
    emit(SignupLoading());
    try {
      await repository.createUserWithEmailAndPassword(user, profilePhoto);
      await analyticsService.logSignup();
      emit(UserCreated());
    } on EmailAlreadyInUseException {
      emit(UserCreationFailed(EMAIL_ALREADY_IN_USE));
    } on WeakPasswordException {
      emit(UserCreationFailed(PASSWORD_IS_WEAK));
    } on InvalidEmailException {
      emit(UserCreationFailed(EMAIL_IS_INVALID));
    } on Exception catch (_) {
      emit(SignupFailed(ERROR_CREATING_USER));
    }
  }
}
