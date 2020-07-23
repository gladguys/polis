import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enum/acao_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/repository/concrete/firebase/firebase.dart';
import '../../core/service/services.dart';
import '../../core/utils/general_utils.dart';
import '../cubits.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({
    @required this.post,
    @required this.postRepository,
    @required this.actionRepository,
    @required this.shareService,
    @required this.userCubit,
    this.timelineCubit,
  }) : super(InitialPostState()) {
    assert(post != null);
    assert(postRepository != null);
    assert(actionRepository != null);
    assert(shareService != null);
    assert(userCubit != null);
    isPostFavorite = post[FAVORITO_FIELD] ?? false;
  }

  final PostRepository postRepository;
  final ActionRepository actionRepository;
  final ShareService shareService;
  final UserCubit userCubit;
  final TimelineCubit timelineCubit;
  Map<String, dynamic> post;
  bool isPostFavorite;

  void favoritePostForUser({Map<String, dynamic> post, UserModel user}) async {
    try {
      isPostFavorite = !isPostFavorite;

      if (timelineCubit != null) {
        _updatePostOnTimeline(
          postUpdated: post,
          favoriteStatus: isPostFavorite,
        );
      } else {
        post = {
          ...post,
          FAVORITO_FIELD: isPostFavorite,
        };
      }

      print(post);
      print(isPostFavorite);
      emit(
        PostFavoriteStatusChanged(post: post, isFavorite: isPostFavorite),
      );

      if (isPostFavorite) {
        await postRepository.favoritePost(post: post, user: user);
      } else {
        await postRepository.unfavoritePost(post: post, user: user);
      }

      emit(PostFavoritedSuccess());
    } on Exception {
      emit(PostFavoritedFailed());
    }
  }

  void _updatePostOnTimeline({dynamic postUpdated, bool favoriteStatus}) {
    final posts = [...timelineCubit.timelinePosts];
    final postToUpdateViewedIndex = posts.indexWhere((post) {
      if (post is PropostaModel) {
        return post.idPropostaPolitico ==
            postUpdated[ID_PROPOSTA_POLITICO_FIELD];
      } else {
        return post.id == postUpdated[ID_FIELD];
      }
    });
    final postFound = posts[postToUpdateViewedIndex];
    posts.removeAt(postToUpdateViewedIndex);
    posts.insert(
      postToUpdateViewedIndex,
      postFound.copyWith(favorito: favoriteStatus),
    );
    timelineCubit.timelinePosts = [...posts];
    timelineCubit.refreshTimeline();
  }

  void sharePost(File postImage) async {
    await shareService.shareFile(postImage, name: 'post.png');
  }

  void setPostViewed({String userId, String postId}) async {
    try {
      await postRepository.setPostVisible(
        userId: userId,
        postId: postId,
      );
      final posts = [...timelineCubit.timelinePosts];
      final postToUpdateViewedIndex = posts.indexWhere((post) {
        if (post is PropostaModel) {
          return post.idPropostaPolitico == postId;
        } else {
          return post.id == postId;
        }
      });
      final postFound = posts[postToUpdateViewedIndex];
      posts.removeAt(postToUpdateViewedIndex);
      posts.insert(
        postToUpdateViewedIndex,
        postFound.copyWith(visualizado: true),
      );
      timelineCubit.timelinePosts = [...posts];
    } on Exception {
      emit(PostViewedFailed());
    }
  }

  void setPostFavorited({String userId, String postId}) async {
    try {
      isPostFavorite = await postRepository.isPostFavorited(
        userId: userId,
        postId: postId,
      );
      emit(PostFavoritedSuccess());
    } on Exception {
      emit(PostFavoritedFailed());
    }
  }

  void likePost({
    UserModel user,
    String postId,
    String politicoId,
    bool isUnliked = false,
  }) async {
    try {
      emit(
        PostLikedSuccess(
          postId: postId,
        ),
      );

      final likes = await postRepository.likePost(
        userId: user.userId,
        postId: postId,
        politicoId: politicoId,
        isUnliked: isUnliked,
      );
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) + 1,
        QTD_NAO_CURTIDAS_FIELD:
            (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) - (isUnliked ? 1 : 0),
      };
      userCubit.updateCurrentUser(
        userCubit.user
            .copyWith(userLikes: likes.item1, userUnlikes: likes.item2),
      );
      await _saveUserAction(
        user: user,
        post: post,
        actionType: AcaoType.like,
      );
    } on Exception {
      emit(PostLikedFailed());
    }
  }

  void stopLikingPost({
    UserModel user,
    String postId,
    String politicoId,
  }) async {
    try {
      emit(
        StoppedLikingPostSuccess(
          postId: postId,
        ),
      );

      final userLikes = await postRepository.stopLikingPost(
        userId: user.userId,
        postId: postId,
        politicoId: politicoId,
      );
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) - 1,
      };
      userCubit.updateCurrentUser(
        userCubit.user.copyWith(
          userLikes: userLikes,
        ),
      );
    } on Exception {
      emit(StoppedLikingPostFailed());
    }
  }

  void unlikePost({
    UserModel user,
    String postId,
    String politicoId,
    bool isLiked = false,
  }) async {
    try {
      emit(
        PostUnlikedSuccess(
          postId: postId,
        ),
      );

      final likes = await postRepository.unlikePost(
          userId: user.userId,
          postId: postId,
          politicoId: politicoId,
          isLiked: isLiked);
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) - (isLiked ? 1 : 0),
        QTD_NAO_CURTIDAS_FIELD: (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) + 1,
      };

      userCubit.updateCurrentUser(
        userCubit.user.copyWith(
          userLikes: likes.item1,
          userUnlikes: likes.item2,
        ),
      );

      await _saveUserAction(
        user: user,
        post: post,
        actionType: AcaoType.unlike,
      );
    } on Exception {
      emit(PostUnlikedFailed());
    }
  }

  void stopUnlikingPost({
    UserModel user,
    String postId,
    String politicoId,
  }) async {
    try {
      emit(
        StoppedUnlikingPostSuccess(
          postId: postId,
        ),
      );

      final userUnlikes = await postRepository.stopUnlikingPost(
          userId: user.userId, postId: postId, politicoId: politicoId);
      post = {
        ...post,
        QTD_NAO_CURTIDAS_FIELD: (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) - 1,
      };
      userCubit.updateCurrentUser(
        userCubit.user.copyWith(
          userUnlikes: userUnlikes,
        ),
      );
    } on Exception {
      emit(StoppedUnlikingPostFailed());
    }
  }

  Future<void> _saveUserAction({
    UserModel user,
    dynamic post,
    AcaoType actionType,
  }) async {
    try {
      await actionRepository.saveUserAction(
        user: user,
        acao: AcaoUsuarioModel(
          idPost: getPostIdFromJson(post),
          idPolitico: getPoliticoIdFromPostJson(post),
          nomePolitico: post[NOME_POLITICO_FIELD],
          urlFotoPolitico: post[FOTO_POLITICO_FIELD],
          tipo: actionType,
          tipoPost: getPostTypeFromJson(post),
          data: DateTime.now(),
        ),
      );
    } on Exception {
      rethrow;
    }
  }
}
