import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/repository/abstract/repositories.dart';
import '../../core/repository/concrete/firebase/firebase.dart';
import '../../core/service/services.dart';
import '../blocs.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    @required this.post,
    @required this.postRepository,
    @required this.shareService,
    this.timelineBloc,
  }) {
    assert(post != null);
    assert(postRepository != null);
    assert(shareService != null);
    isPostFavorite = post[FAVORITO_FIELD] ?? false;
  }

  final PostRepository postRepository;
  final ShareService shareService;
  final TimelineBloc timelineBloc;
  Map<String, dynamic> post;
  bool isPostFavorite;

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    yield* event.map(
      likePost: _mapLikePostToState,
      favoritePostForUser: _mapFavoritePostForUserToState,
      sharePost: _mapSharePost,
      setPostViewed: _mapSetPostViewedToState,
      setPostFavorited: _mapSetPostFavoritedToState,
    );
  }

  Stream<PostState> _mapLikePostToState(LikePost event) async* {}

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
        return post.idPropostaPolitico == postUpdated['idPropostaPolitico'];
      } else {
        return post.id == postUpdated['id'];
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

  Stream<PostState> _mapSharePost(SharePost event) async* {
    final postImage = event.postImage;
    try {
      await shareService.shareFile(postImage, name: 'post.png');
      yield PostSharedSuccess();
    } on Exception {
      yield PostSharedFailed();
    }
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
}
