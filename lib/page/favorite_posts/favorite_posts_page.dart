import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/widget/text_title.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';
import '../timeline/widget/timeline.dart';

class FavoritePostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(FAVORITE_POSTS_PAGE),
      body: SafeArea(
        child: BlocBuilder<FavoritePostsBloc, FavoritePostsState>(
          builder: (_, state) {
            if (state is FetchUserFavoritePostsSuccess) {
              return _buildList(state.posts);
            } else {
              return CenteredLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List posts) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        const TextTitle(FAVORITE_POSTS),
        Expanded(
          child: Timeline(
            activities: posts,
          ),
        ),
      ],
    );
  }
}
