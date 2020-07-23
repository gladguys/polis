import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/service/services.dart';
import '../../core/validators.dart';

part 'politic_profile_state.dart';

class PoliticProfileCubit extends Cubit<PoliticProfileState> {
  PoliticProfileCubit({
    @required this.user,
    @required this.politicProfileRepository,
    @required this.followRepository,
    @required this.urlLauncherService,
  })  : assert(user != null),
        assert(politicProfileRepository != null),
        assert(followRepository != null),
        assert(urlLauncherService != null),
        super(InitialPoliticProfileState());

  final UserModel user;
  final PoliticProfileRepository politicProfileRepository;
  final FollowRepository followRepository;
  final UrlLauncherService urlLauncherService;

  PoliticoModel politico;
  List<dynamic> lastActivities;
  bool isPoliticBeingFollowedByUser;
  int followersCount;
  DocumentSnapshot lastDocument;

  void getPoliticInfo(String politicId) async {
    try {
      emit(LoadingPoliticInfo());

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

      emit(
        GetPoliticInfoSuccess(
          politic: politico,
          lastActivities: lastActivities,
          activitiesCount: lastActivities.length,
          isBeingFollowedByUser: isPoliticBeingFollowedByUser,
        ),
      );
    } on Exception {
      emit(GetPoliticInfoFailed());
    }
  }

  void followUnfollowProfilePolitic({bool isFollowing}) async {
    final shouldFollowPolitic = !isFollowing;

    final quantidadeSeguidores = politico.quantidadeSeguidores ?? 0;
    final newFollowersCount = shouldFollowPolitic
        ? quantidadeSeguidores + 1
        : max(quantidadeSeguidores - 1, 0);

    politico =
        politico.copyWith(quantidadeSeguidores: newFollowersCount.toDouble());

    emit(
      UserFollowingPoliticChanged(
        politico: politico,
        isUserFollowingPolitic: shouldFollowPolitic,
      ),
    );

    try {
      if (shouldFollowPolitic) {
        await followRepository.followPolitic(user: user, politico: politico);
      } else {
        await followRepository.unfollowPolitic(user: user, politico: politico);
      }
    } on Exception {
      emit(FollowPoliticFailed());
    }
  }

  void sendEmailToPolitic() async {
    final email = politico.email;
    if (Validators.validateEmail(email)) {
      if (await urlLauncherService.canLaunchEmailUrl(email)) {
        await urlLauncherService.launchEmailUrl(email);
      } else {
        emit(OpenEmailIntentFailed());
      }
    } else {
      emit(PoliticDontHaveValidEmail());
    }
  }

  void getMoreActivities(String politicId) async {
    try {
      final activitiesData = await politicProfileRepository.getMoreActivities(
        politicId: politicId,
        count: kLastActivitiesQuantity,
        lastDocument: lastDocument,
      );
      lastActivities.addAll(activitiesData.item1);
      lastDocument = activitiesData.item2;
      emit(
        GetPoliticInfoSuccess(
          politic: politico,
          lastActivities: lastActivities,
          activitiesCount: lastActivities.length,
          isBeingFollowedByUser: isPoliticBeingFollowedByUser,
        ),
      );
    } on Exception {
      emit(GetPoliticInfoFailed());
    }
  }
}
