import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';

class FavoritePostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(FAVORITE_POSTS_PAGE),
      body: BlocBuilder<FavoritePostsBloc, FavoritePostsState>(
        builder: (_, state) {
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
