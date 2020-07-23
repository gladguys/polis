import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'politic_suggestion_state.dart';

class PoliticSuggestionCubit extends Cubit<PoliticSuggestionState> {
  PoliticSuggestionCubit(
      {@required this.politicSuggestionRepository,
      @required this.userRepository})
      : assert(politicSuggestionRepository != null),
        assert(userRepository != null),
        super(InitialPoliticSuggestionState());

  final PoliticSuggestionRepository politicSuggestionRepository;
  final UserRepository userRepository;

  List<PoliticoModel> politics;
  List<PoliticoModel> followedPolitics = [];

  void fetchSuggestedPolitics(String stateOption) async {
    emit(LoadingFetch());

    try {
      politics =
          await politicSuggestionRepository.getSuggestedPolitics(stateOption);
      emit(FetchSuggestedPoliticsSuccess(politics));
    } on Exception {
      emit(FetchSuggestedPoliticsFailed());
    }
  }

  void followOrUnfollowPolitic(PoliticoModel politico) async {
    final isFollowing = isPoliticBeenFollowed(politico);
    if (isFollowing) {
      followedPolitics.remove(politico);
    } else {
      followedPolitics.add(politico);
    }
    emit(
      ChangedPoliticsFollowingStatus(
        politico,
        isFollowing: !isFollowing,
      ),
    );
  }

  void savePoliticsToFollow({UserModel user}) async {
    emit(LoadingSaveFollowPolitics());

    try {
      await politicSuggestionRepository.savePoliticsToFollow(
        userId: user.userId,
        politics: followedPolitics,
      );
      await politicSuggestionRepository.saveFollowerToPolitics(
        user: user,
        politics: followedPolitics,
      );
      await userRepository.setFirstLoginDone(user);

      emit(SavedSuggestedPolitics());
    } on Exception {
      emit(SaveSuggestedPoliticsFailed());
    }
  }

  bool isPoliticBeenFollowed(PoliticoModel politico) {
    return followedPolitics.contains(politico);
  }
}
