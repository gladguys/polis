import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class FavoritePostsPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<FavoritePostsCubit>(
      bloc: FavoritePostsCubit(
        repository: context.repository<FirebaseFavoritePostsRepository>(),
      )..fetchUserFavoritePosts(
          context.bloc<UserCubit>().user.userId,
        ),
      page: FavoritePostsPage(),
    );
  }
}
