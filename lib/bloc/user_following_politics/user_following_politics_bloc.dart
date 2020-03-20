import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../model/politico_model.dart';
import '../../repository/abstract/user_following_politics_repository.dart';

class UserFollowingPoliticsBloc
    extends Bloc<UserFollowingPoliticsEvent, UserFollowingPoliticsState> {
  UserFollowingPoliticsBloc({@required this.repository});

  final UserFollowingPoliticsRepository repository;
  List<PoliticoModel> politicsFollowing = [];
  String searchTerm = '';

  @override
  UserFollowingPoliticsState get initialState =>
      InitialUserFollowingPoliticsState();

  @override
  Stream<UserFollowingPoliticsState> mapEventToState(
      UserFollowingPoliticsEvent event) async* {
    if (event is FetchFollowingPolitics) {
      yield LoadingPolitics();

      try {
        politicsFollowing = await repository.getFollowingPolitics(event.userId);
        yield FetchPoliticsSuccess(politicsFollowing);
      } on Exception {
        rethrow;
      }
    }
    if (event is SearchPoliticsByTerm) {
      final term = event.term;

      if (term.isEmpty) {
        yield PoliticsFilteredByTerm(filteredPolitics: politicsFollowing);
      } else {
        final politicsMatched = politicsFollowing
            .where((politic) => politic.nomeEleitoral
                .toLowerCase()
                .contains(term.toLowerCase()))
            .toList();
        yield PoliticsFilteredByTerm(filteredPolitics: politicsMatched);
      }
    }
  }
}
