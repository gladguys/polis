import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../widget/default_bottombar.dart';
import '../../widget/loading.dart';
import '../../widget/text_title.dart';
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
              return Loading();
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
        TextTitle(FAVORITE_POSTS),
        const SizedBox(height: 8),
        Expanded(
          child: Timeline(
            activities: posts,
            updatesCount: 0,
          ),
        ),
      ],
    );
  }
}
