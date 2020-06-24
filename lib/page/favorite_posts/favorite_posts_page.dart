import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/empty_info.dart';
import '../../widget/text_title.dart';
import 'widget/favorites_post_list.dart';
import 'widget/favorites_posts_skeleton.dart';

class FavoritePostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(FAVORITE_POSTS_PAGE),
      body: SafeArea(
        child: BlocBuilder<FavoritePostsBloc, FavoritePostsState>(
          builder: (_, state) => state.map(
            initial: _mapLoadingStateToWidget,
            fetchUserFavoritePostsSuccess: _mapSuccessStateToWidget,
            fetchUserFavoritePostsFailed: mapErrorStateToWidget,
            loadingFavoritesPosts: _mapLoadingStateToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapLoadingStateToWidget(state) {
    return const FavoritesPostsSkeleton();
  }

  Widget _mapSuccessStateToWidget(FetchUserFavoritePostsSuccess state) {
    final posts = state.posts;
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(FAVORITE_POSTS),
        const SizedBox(height: 8),
        posts.isNotEmpty
            ? Expanded(
                child: FavoritesPostList(posts),
              )
            : Expanded(
                child: EmptyInfo(
                  text: NO_FAVORITE_POST,
                  icon: FontAwesomeIcons.folderOpen,
                ),
              ),
      ],
    );
  }
}
