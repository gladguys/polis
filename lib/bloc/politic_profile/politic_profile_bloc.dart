import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import '../../core/validators.dart';
import 'politic_profile_event.dart';
import 'politic_profile_state.dart';

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
  DocumentSnapshot lastDocument;

  @override
  PoliticProfileState get initialState => InitialPoliticProfileState();

  @override
  Stream<PoliticProfileState> mapEventToState(
      PoliticProfileEvent event) async* {
    yield* event.map(
      getPoliticInfo: _mapGetPoliticInfoToState,
      getMoreActivities: _mapGetMoreActivitiesToState,
      followUnfollowProfilePolitic: _mapFollowUnfollowProfilePoliticToState,
      sendEmailToPolitic: _mapSendEmailToPoliticToState,
    );
  }

  Stream<PoliticProfileState> _mapGetPoliticInfoToState(
      GetPoliticInfo event) async* {
    try {
      yield LoadingPoliticInfo();

      final politicId = event.politicId;

      isPoliticBeingFollowedByUser = await followRepository
          .isPoliticBeingFollowed(user: user, politicId: politicId);

      politico = await politicProfileRepository.getInfoPolitic(politicId);
      followersCount = politico.quantidadeSeguidores?.toInt() ?? 0;

      final activitiesData = await politicProfileRepository.getLastActivities(
        politicId: politicId,
        count: kLastActivitiesQuantity,
      );
      lastActivities = activitiesData.item1;
      lastDocument = activitiesData.item2;

      yield GetPoliticInfoSuccess(
        politic: politico,
        lastActivities: lastActivities,
        activitiesCount: lastActivities.length,
        isBeingFollowedByUser: isPoliticBeingFollowedByUser,
      );
    } on Exception {
      yield GetPoliticInfoFailed();
    }
  }

  Stream<PoliticProfileState> _mapFollowUnfollowProfilePoliticToState(
      FollowUnfollowProfilePolitic event) async* {
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
        await followRepository.unfollowPolitic(user: user, politico: politico);
      }
    } on Exception {
      yield FollowPoliticFailed();
    }
  }

  Stream<PoliticProfileState> _mapSendEmailToPoliticToState(
      SendEmailToPolitic event) async* {
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

  Stream<PoliticProfileState> _mapGetMoreActivitiesToState(
      GetMoreActivities event) async* {
    try {
      final activitiesData = await politicProfileRepository.getMoreActivities(
        politicId: event.politicId,
        count: kLastActivitiesQuantity,
        lastDocument: lastDocument,
      );
      lastActivities.addAll(activitiesData.item1);
      lastDocument = activitiesData.item2;
      yield GetPoliticInfoSuccess(
        politic: politico,
        lastActivities: lastActivities,
        activitiesCount: lastActivities.length,
        isBeingFollowedByUser: isPoliticBeingFollowedByUser,
      );
    } on Exception {
      yield GetPoliticInfoFailed();
    }
  }
}
