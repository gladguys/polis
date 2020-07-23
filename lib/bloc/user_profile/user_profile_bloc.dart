import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(InitialUserProfileState());

  final UserProfileRepository repository;

  UserModel user;
  List<PoliticoModel> politicsFollowing;
  List<AcaoUsuarioModel> userActions;

  void fetchUserRelatedInfo(String userId) async {
    emit(LoadingFetchUserInfo());

    try {
      user = await repository.getUserInfo(userId);
      politicsFollowing = await repository.getPoliticsFollowing(userId);
      userActions = await repository.getUserActions(userId);

      emit(
        FetchUserRelatedInfoSuccess(
          politicsFollowing: politicsFollowing,
          userActions: userActions,
        ),
      );
    } on Exception {
      emit(FetchUserRelatedInfoFailed());
    }
  }

  void getPostInfo({String postId, String politicId, PostType postType}) async {
    try {
      final post = await repository.getPostInfo(
        postId: postId,
        politicoId: politicId,
        postType: postType,
      );
      emit(
        GetPostInfoSuccess(
          post: post,
          postType: postType,
        ),
      );
    } on Exception {
      emit(GetPostInfoFailed());
    }
  }
}
