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
import '../blocs.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    @required this.post,
    @required this.postRepository,
    @required this.actionRepository,
    @required this.shareService,
    @required this.userBloc,
    this.timelineBloc,
  }) : super(InitialPostState()) {
    assert(post != null);
    assert(postRepository != null);
    assert(actionRepository != null);
    assert(shareService != null);
    assert(userBloc != null);
    isPostFavorite = post[FAVORITO_FIELD] ?? false;
  }

  final PostRepository postRepository;
  final ActionRepository actionRepository;
  final ShareService shareService;
  final UserBloc userBloc;
  final TimelineBloc timelineBloc;
  Map<String, dynamic> post;
  bool isPostFavorite;

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FavoritePostForUser) {
      yield* _mapFavoritePostForUserToState(event);
    }
    if (event is SharePost) {
      _mapSharePost(event);
    }
    if (event is SetPostViewed) {
      yield* _mapSetPostViewedToState(event);
    }
    if (event is SetPostFavorited) {
      yield* _mapSetPostFavoritedToState(event);
    }
    if (event is LikePost) {
      yield* _mapLikePostToState(event);
    }
    if (event is StopLikingPost) {
      yield* _mapStopLikingPostToState(event);
    }
    if (event is UnlikePost) {
      yield* _mapUnlikePostToState(event);
    }
    if (event is StopUnlikingPost) {
      yield* _mapStopUnlikingPostToState(event);
    }
  }

  Stream<PostState> _mapFavoritePostForUserToState(
      FavoritePostForUser event) async* {
    try {
      isPostFavorite = !isPostFavorite;

      if (timelineBloc != null) {
        _updatePostOnTimeline(
          postUpdated: event.post,
          favoriteStatus: isPostFavorite,
        );
      } else {
        post = {
          ...post,
          FAVORITO_FIELD: isPostFavorite,
        };
      }

      yield PostFavoriteStatusChanged(post: post, isFavorite: isPostFavorite);

      if (isPostFavorite) {
        await postRepository.favoritePost(post: event.post, user: event.user);
      } else {
        await postRepository.unfavoritePost(post: event.post, user: event.user);
      }

      yield PostFavoritedSuccess();
    } on Exception {
      yield PostFavoritedFailed();
    }
  }

  void _updatePostOnTimeline({dynamic postUpdated, bool favoriteStatus}) {
    final posts = [...timelineBloc.timelinePosts];
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
    timelineBloc.timelinePosts = [...posts];
    timelineBloc.add(RefreshTimeline());
  }

  void _mapSharePost(SharePost event) async {
    final postImage = event.postImage;
    await shareService.shareFile(postImage, name: 'post.png');
  }

  Stream<PostState> _mapSetPostViewedToState(SetPostViewed event) async* {
    final userId = event.userId;
    final postId = event.postId;
    try {
      await postRepository.setPostVisible(
        userId: userId,
        postId: postId,
      );
      final posts = [...timelineBloc.timelinePosts];
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
      timelineBloc.timelinePosts = [...posts];
    } on Exception {
      yield PostViewedFailed();
    }
  }

  Stream<PostState> _mapSetPostFavoritedToState(SetPostFavorited event) async* {
    try {
      isPostFavorite = await postRepository.isPostFavorited(
        userId: event.userId,
        postId: event.postId,
      );
      yield PostFavoritedSuccess();
    } on Exception {
      yield PostFavoritedFailed();
    }
  }

  Stream<PostState> _mapLikePostToState(LikePost event) async* {
    try {
      final isUnliked = event.isUnliked ?? false;
      final user = event.user;

      yield PostLikedSuccess(
        postId: event.postId,
      );

      final likes = await postRepository.likePost(
        userId: user.userId,
        postId: event.postId,
        politicoId: event.politicoId,
        isUnliked: isUnliked,
      );
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) + 1,
        QTD_NAO_CURTIDAS_FIELD:
            (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) - (isUnliked ? 1 : 0),
      };
      userBloc.add(
        UpdateCurrentUser(
          userBloc.user
              .copyWith(userLikes: likes.item1, userUnlikes: likes.item2),
        ),
      );
      await _saveUserAction(
        user: user,
        post: post,
        actionType: AcaoType.like,
      );
    } on Exception {
      yield PostLikedFailed();
    }
  }

  Stream<PostState> _mapStopLikingPostToState(StopLikingPost event) async* {
    try {
      yield StoppedLikingPostSuccess(
        postId: event.postId,
      );

      final userLikes = await postRepository.stopLikingPost(
        userId: event.user.userId,
        postId: event.postId,
        politicoId: event.politicoId,
      );
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) - 1,
      };
      userBloc.add(
        UpdateCurrentUser(
          userBloc.user.copyWith(
            userLikes: userLikes,
          ),
        ),
      );
    } on Exception {
      yield StoppedLikingPostFailed();
    }
  }

  Stream<PostState> _mapUnlikePostToState(UnlikePost event) async* {
    try {
      final user = event.user;
      final isLiked = event.isLiked ?? false;

      yield PostUnlikedSuccess(
        postId: event.postId,
      );

      final likes = await postRepository.unlikePost(
        userId: user.userId,
        postId: event.postId,
        politicoId: event.politicoId,
        isLiked: isLiked,
      );
      post = {
        ...post,
        QTD_CURTIDAS_FIELD: (post[QTD_CURTIDAS_FIELD] ?? 0) - (isLiked ? 1 : 0),
        QTD_NAO_CURTIDAS_FIELD: (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) + 1,
      };

      userBloc.add(
        UpdateCurrentUser(
          userBloc.user.copyWith(
            userLikes: likes.item1,
            userUnlikes: likes.item2,
          ),
        ),
      );

      await _saveUserAction(
        user: user,
        post: post,
        actionType: AcaoType.unlike,
      );
    } on Exception {
      yield PostUnlikedFailed();
    }
  }

  Stream<PostState> _mapStopUnlikingPostToState(StopUnlikingPost event) async* {
    try {
      yield StoppedUnlikingPostSuccess(
        postId: event.postId,
      );

      final userUnlikes = await postRepository.stopUnlikingPost(
        userId: event.user.userId,
        postId: event.postId,
        politicoId: event.politicoId,
      );
      post = {
        ...post,
        QTD_NAO_CURTIDAS_FIELD: (post[QTD_NAO_CURTIDAS_FIELD] ?? 0) - 1,
      };
      userBloc.add(
        UpdateCurrentUser(
          userBloc.user.copyWith(
            userUnlikes: userUnlikes,
          ),
        ),
      );
    } on Exception {
      yield StoppedUnlikingPostFailed();
    }
  }

  Future<void> _saveUserAction(
      {UserModel user, dynamic post, AcaoType actionType}) async {
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
