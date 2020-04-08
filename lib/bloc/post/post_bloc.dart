import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.post, @required this.postRepository}) {
    assert(post != null);
    assert(postRepository != null);
    isPostFavorite = post['favorito'] ?? false;
  }

  final Map<String, dynamic> post;
  final PostRepository postRepository;
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
  }
}
