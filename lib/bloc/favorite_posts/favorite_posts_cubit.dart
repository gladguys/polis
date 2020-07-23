import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/repository/abstract/favorite_posts_repository.dart';

part 'favorite_posts_state.dart';

class FavoritePostsCubit extends Cubit<FavoritePostsState> {
  FavoritePostsCubit({@required this.repository})
      : assert(repository != null),
        super(InitialFavoritePostsState());

  final FavoritePostsRepository repository;

  void fetchUserFavoritePosts(String userId) async {
    emit(LoadingFavoritesPosts());
    try {
      final favoritePosts = await repository.getUserFavoritePosts(userId);

      emit(FetchUserFavoritePostsSuccess(favoritePosts));
    } on Exception {
      emit(FetchUserFavoritePostsFailed());
    }
  }
}
