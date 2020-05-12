import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/service/services.dart';
import '../../model/models.dart';
import '../../repository/abstract/post_repository.dart';
import '../blocs.dart';

part 'post_event.dart';
part 'post_state.dart';

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
    isPostFavorite = post['favorito'] ?? false;
  }

  final Map<String, dynamic> post;
  final PostRepository postRepository;
  final ShareService shareService;
  final TimelineBloc timelineBloc;
  bool isPostFavorite;

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FavoritePostForUser) {
      try {
        isPostFavorite = !isPostFavorite;
        yield PostFavoriteStatusChanged(isFavorite: isPostFavorite);

        if (isPostFavorite) {
          await postRepository.favoritePost(post: event.post, user: event.user);
        } else {
          await postRepository.unfavoritePost(
              post: event.post, user: event.user);
        }

        yield PostFavoritedSuccess();
      } on Exception {
        yield PostFavoritedFailed();
      }
    }
    if (event is SharePost) {
      final postImage = event.postImage;
      await shareService.shareFile(postImage, name: 'post.png');
    }
    if (event is SetPostViewed) {
      final userId = event.userId;
      final postId = event.postId;
      try {
        await postRepository.setPostVisible(
          userId: userId,
          postId: postId,
        );
        final posts = [...timelineBloc.timelinePosts];
        final postToUpdateViewedIndex =
            posts.indexWhere((post) => post.id == postId);
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
  }
}
