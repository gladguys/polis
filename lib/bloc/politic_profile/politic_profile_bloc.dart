import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../core/constants.dart';
import '../../core/service/services.dart';
import '../../core/validators.dart';
import '../../model/models.dart';
import '../../repository/abstract/follow_repository.dart';
import '../../repository/abstract/politic_profile_repository.dart';

class PoliticProfileBloc
    extends Bloc<PoliticProfileEvent, PoliticProfileState> {
  PoliticProfileBloc({
    @required this.user,
    @required this.politicProfileRepository,
    @required this.followRepository,
    @required this.urlLauncherService,
  })  : assert(user != null),
        assert(politicProfileRepository != null),
        assert(followRepository != null),
        assert(urlLauncherService != null);

  final UserModel user;
  final PoliticProfileRepository politicProfileRepository;
  final FollowRepository followRepository;
  final UrlLauncherService urlLauncherService;

  PoliticoModel politico;
  List<dynamic> lastActivities;
  bool isPoliticBeingFollowedByUser;
  int followersCount;

  @override
  PoliticProfileState get initialState => InitialPoliticProfileState();

  @override
  Stream<PoliticProfileState> mapEventToState(
      PoliticProfileEvent event) async* {
    if (event is GetPoliticInfo) {
      try {
        yield LoadingPoliticInfo();

        final politicId = event.politicId;

        isPoliticBeingFollowedByUser = await followRepository
            .isPoliticBeingFollowed(user: user, politicId: politicId);

        politico = await politicProfileRepository.getInfoPolitic(politicId);
        followersCount = politico.quantidadeSeguidores?.toInt() ?? 0;
        lastActivities = await politicProfileRepository.getLastActivities(
            politicId: politicId, count: kLastActivitiesQuantity);

        yield GetPoliticInfoSuccess(
          politic: politico,
          lastActivities: lastActivities,
          isBeingFollowedByUser: isPoliticBeingFollowedByUser,
        );
      } on Exception {
        yield GetPoliticInfoFailed();
      }
    }
    if (event is FollowUnfollowProfilePolitic) {
      final shouldFollowPolitic = !event.isFollowing;

      final quantidadeSeguidores = politico.quantidadeSeguidores ?? 0;
      final newFollowersCount = shouldFollowPolitic
          ? quantidadeSeguidores + 1
          : max(quantidadeSeguidores - 1, 0);

      politico =
          politico.copyWith(quantidadeSeguidores: newFollowersCount.toDouble());

      yield UserFollowingPoliticChanged(
        politico: politico,
        isUserFollowingPolitic: shouldFollowPolitic,
      );

      try {
        if (shouldFollowPolitic) {
          await followRepository.followPolitic(user: user, politico: politico);
        } else {
          await followRepository.unfollowPolitic(
              user: user, politico: politico);
        }
      } on Exception {
        yield FollowPoliticFailed();
      }
    }
    if (event is SendEmailToPolitic) {
      final email = politico.email;
      if (Validators.validateEmail(email)) {
        if (await urlLauncherService.canLaunchEmailUrl(email)) {
          await urlLauncherService.launchEmailUrl(email);
        } else {
          yield OpenEmailIntentFailed();
        }
      } else {
        yield PoliticDontHaveValidEmail();
      }
    }
  }
}
