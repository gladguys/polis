import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'user_following_politics_state.dart';

class UserFollowingPoliticsCubit extends Cubit<UserFollowingPoliticsState> {
  UserFollowingPoliticsCubit(
      {@required this.userFollowingPoliticsRepository,
      @required this.followRepository})
      : assert(userFollowingPoliticsRepository != null),
        assert(followRepository != null),
        super(InitialUserFollowingPoliticsState());

  final UserFollowingPoliticsRepository userFollowingPoliticsRepository;
  final FollowRepository followRepository;

  List<PoliticoModel> politicsFollowing = [];
  Map<String, bool> isPoliticFollowed = {};
  String searchTerm = '';

  bool isPoliticBeingFollowed(PoliticoModel politico) =>
      isPoliticFollowed[politico.id] ?? false;

  void _initPoliticBeingFollowed() {
    for (var politic in politicsFollowing) {
      isPoliticFollowed[politic.id] = true;
    }
  }

  void fetchFollowingPolitics({@required String userId}) async {
    assert(userId != null);

    emit(LoadingPolitics());

    try {
      politicsFollowing =
          await userFollowingPoliticsRepository.getFollowingPolitics(userId);
      _initPoliticBeingFollowed();

      emit(FetchPoliticsSuccess(politicsFollowing));
    } on Exception {
      emit(FetchPoliticsFailed());
    }
  }

  void searchPoliticsByTerm(String term) async {
    if (term.isEmpty) {
      emit(PoliticsFilteredByTerm(filteredPolitics: politicsFollowing));
    } else {
      final politicsMatched = politicsFollowing
          .where((politic) =>
              politic.nomeEleitoral.toLowerCase().contains(term.toLowerCase()))
          .toList();
      emit(PoliticsFilteredByTerm(filteredPolitics: politicsMatched));
    }
  }

  void followUnfollowPolitic(
      {@required UserModel user, @required PoliticoModel politico}) async {
    try {
      final isBeingFollowed = isPoliticBeingFollowed(politico);

      if (isBeingFollowed) {
        await followRepository.unfollowPolitic(user: user, politico: politico);
      } else {
        await followRepository.followPolitic(user: user, politico: politico);
      }
      isPoliticFollowed[politico.id] = !isBeingFollowed;

      emit(
        FollowedPoliticsUpdated(
          followedPolitics: [...politicsFollowing],
          politicoUpdated: politico,
          isFollowing: isBeingFollowed,
        ),
      );
    } on Exception {
      emit(FollowUnfollowFailed());
    }
  }
}
