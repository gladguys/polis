import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/favorite_posts_repository.dart';

part 'favorite_posts_event.dart';
part 'favorite_posts_state.dart';

class FavoritePostsBloc extends Bloc<FavoritePostsEvent, FavoritePostsState> {
  FavoritePostsBloc({@required this.repository})
      : assert(repository != null),
        super(InitialFavoritePostsState());

  final FavoritePostsRepository repository;

  @override
  Stream<FavoritePostsState> mapEventToState(FavoritePostsEvent event) async* {
    if (event is FetchUserFavoritePosts) {
      yield* _mapFetchUserFavoritePostsToState(event);
    }
  }

  Stream<FavoritePostsState> _mapFetchUserFavoritePostsToState(
      FetchUserFavoritePosts event) async* {
    yield LoadingFavoritesPosts();
    try {
      final favoritePosts = await repository.getUserFavoritePosts(event.userId);

      yield FetchUserFavoritePostsSuccess(favoritePosts);
    } on Exception {
      yield FetchUserFavoritePostsFailed();
    }
  }
}
