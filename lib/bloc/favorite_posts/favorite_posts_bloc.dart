import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './bloc.dart';
import '../../repository/abstract/favorite_posts_repository.dart';

class FavoritePostsBloc extends Bloc<FavoritePostsEvent, FavoritePostsState> {
  FavoritePostsBloc({@required this.repository}) : assert(repository != null);

  final FavoritePostsRepository repository;

  @override
  FavoritePostsState get initialState => InitialFavoritePostsState();

  @override
  Stream<FavoritePostsState> mapEventToState(FavoritePostsEvent event) async* {
    if (event is FetchUserFavoritePosts) {
      try {
        final favoritePosts =
            await repository.getUserFavoritePosts(event.userId);

        yield FetchUserFavoritePostsSuccess(favoritePosts);
      } on Exception {
        yield FetchUserFavoritePostsFailed();
      }
    }
  }
}
