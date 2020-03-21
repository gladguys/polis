import 'package:flutter/material.dart';

import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';

class FavoritePostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(FAVORITE_POSTS_PAGE),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
