import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({@required this.repository}) : assert(repository != null);

  final UserProfileRepository repository;
  List<PoliticoModel> politicsFollowing;
  List<AcaoUsuarioModel> userActions;

  @override
  UserProfileState get initialState => InitialUserProfileState();

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is FetchUserRelatedInfo) {
      yield* _mapFetchUserRelatedInfoToState(event);
    }
    if (event is GetPostInfo) {
      yield* _mapGetPostInfoToState(event);
    }
  }

  Stream<UserProfileState> _mapFetchUserRelatedInfoToState(
      FetchUserRelatedInfo event) async* {
    yield LoadingFetchUserInfo();

    try {
      politicsFollowing = await repository.getPoliticsFollowing(event.userId);
      userActions = await repository.getUserActions(event.userId);

      yield FetchUserRelatedInfoSuccess(
        politicsFollowing: politicsFollowing,
        userActions: userActions,
      );
    } on Exception {
      yield FetchUserRelatedInfoFailed();
    }
  }

  Stream<UserProfileState> _mapGetPostInfoToState(GetPostInfo event) async* {
    try {
      final postType = event.postType;
      final post = await repository.getPostInfo(
        postId: event.postId,
        politicoId: event.politicId,
        postType: postType,
      );
      yield GetPostInfoSuccess(
        post: post,
        postType: postType,
      );
    } on Exception {
      yield GetPostInfoFailed();
    }
  }
}
