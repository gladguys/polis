import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../bloc/blocs.dart';
import '../core/routing/route_names.dart';
import '../i18n/i18n.dart';
import '../page/pages.dart';

class DefaultBottombar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    final route = ModalRoute.of(context).settings.name;
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 12),
            route == TIMELINE_PAGE
                ? Text(
                    POLIS,
                    style: TextStyle(
                      fontFamily: 'Philosopher',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: SimpleRouter.back,
                  ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    iconSize: 36,
                    onPressed: () => SimpleRouter.forward(
                      TimelinePage(),
                      name: TIMELINE_PAGE,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 36,
                    onPressed: () => SimpleRouter.forward(
                      SearchPoliticPage(),
                      name: SEARCH_POLITIC_PAGE,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    iconSize: 36,
                    onPressed: () => SimpleRouter.forward(
                      FavoritePostsPage(),
                      name: FAVORITE_POSTS_PAGE,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => SimpleRouter.forward(
                UserProfilePageConnected(),
                name: USER_PROFILE_PAGE,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl ?? ''),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
