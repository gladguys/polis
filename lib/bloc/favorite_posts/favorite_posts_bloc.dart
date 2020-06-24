import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/favorite_posts_repository.dart';
import 'favorite_posts_event.dart';
import 'favorite_posts_state.dart';

class FavoritePostsBloc extends Bloc<FavoritePostsEvent, FavoritePostsState> {
  FavoritePostsBloc({@required this.repository}) : assert(repository != null);

  final FavoritePostsRepository repository;

  @override
  FavoritePostsState get initialState => FavoritePostsState.initial();

  @override
  Stream<FavoritePostsState> mapEventToState(FavoritePostsEvent event) async* {
    yield* event.map(
      fetchUserFavoritePosts: _mapFetchUserFavoritePostsToState,
    );
  }

  Stream<FavoritePostsState> _mapFetchUserFavoritePostsToState(
      FavoritePostsEvent event) async* {
    yield FavoritePostsState.loadingFavoritesPosts();
    try {
      final favoritePosts = await repository.getUserFavoritePosts(event.userId);

      yield FavoritePostsState.fetchUserFavoritePostsSuccess(favoritePosts);
    } on Exception {
      yield FavoritePostsState.fetchUserFavoritePostsFailed();
    }
  }
}
