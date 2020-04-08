import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class FavoritePostsPageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<FavoritePostsBloc>(
      bloc: FavoritePostsBloc(
        repository: context.repository<FirebaseFavoritePostsRepository>(),
      )..add(
          FetchUserFavoritePosts(
            userId: context.bloc<UserBloc>().user.userId,
          ),
        ),
      page: FavoritePostsPage(),
    );
  }
}
