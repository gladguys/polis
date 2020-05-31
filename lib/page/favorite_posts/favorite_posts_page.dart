import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/blocs.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/empty_info.dart';
import '../../widget/error_container.dart';
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
          builder: (_, state) {
            if (state is FetchUserFavoritePostsSuccess) {
              return _buildList(state.posts, context);
            } else if (state is LoadingFavoritesPosts) {
              return FavoritesPostsSkeleton();
            } else {
              return ErrorContainer();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List posts, BuildContext context) {
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
