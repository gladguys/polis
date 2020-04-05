import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.postRepository}) : assert(postRepository != null);

  final PostRepository postRepository;

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FavoritePostForUser) {
      try {
        await postRepository.favoritePost(post: event.post, user: event.user);
        yield PostFavoritedSuccess();
      } on Exception {
        yield PostFavoritedFailed();
      }
    }
  }
}
