import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/politic_followers_repository.dart';

part 'politic_followers_state.dart';

class PoliticFollowersCubit extends Cubit<PoliticFollowersState> {
  PoliticFollowersCubit({@required this.repository})
      : assert(repository != null),
        super(InitialPoliticFollowersState());

  final PoliticFollowersRepository repository;

  void getPoliticFollowers(String politicId) async {
    try {
      emit(LoadingPoliticFollowers());

      final followers = await repository.getUsersFollowingPolitic(politicId);
      emit(GetPoliticFollowersSuccess(followers: followers));
    } on Exception {
      emit(GetPoliticFollowersFailed());
    }
  }
}
