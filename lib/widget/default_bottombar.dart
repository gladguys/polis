import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../bloc/blocs.dart';
import '../core/routing/route_names.dart';
import '../i18n/i18n.dart';
import '../page/pages.dart';

class DefaultBottombar extends StatelessWidget {
  DefaultBottombar(this.routeName, {this.onPopCallback = SimpleRouter.back});

  final String routeName;
  final VoidCallback onPopCallback;

  @override
  Widget build(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Container(
            width: 72,
            height: 40,
            alignment: Alignment.centerLeft,
            child: routeName == TIMELINE_PAGE
                ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      POLIS,
                      style: TextStyle(
                        fontFamily: 'Philosopher',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                : _buildButtonBottomAppBar(
                    key: const ValueKey('arrow-back-btn'),
                    icon: FontAwesomeIcons.chevronLeft,
                    onPressed: onPopCallback,
                  ),
          ),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: <Widget>[
                _buildButtonBottomAppBar(
                  icon: FontAwesomeIcons.home,
                  onPressed: () => SimpleRouter.forward(
                    TimelinePage(),
                    name: TIMELINE_PAGE,
                  ),
                ),
                _buildButtonBottomAppBar(
                  icon: FontAwesomeIcons.search,
                  onPressed: () => SimpleRouter.forward(
                    SearchPoliticPage(),
                    name: SEARCH_POLITIC_PAGE,
                  ),
                ),
                _buildButtonBottomAppBar(
                  icon: FontAwesomeIcons.solidBookmark,
                  onPressed: () => SimpleRouter.forward(
                    FavoritePostsPage(),
                    name: FAVORITE_POSTS_PAGE,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 72,
            height: 40,
            alignment: Alignment.centerRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => SimpleRouter.forward(
                UserProfilePageConnected(),
                name: USER_PROFILE_PAGE,
              ),
              child: ClipRRect(
                child: user.photoUrl != null
                    ? FancyShimmerImage(
                        imageUrl: user.photoUrl,
                        width: 30,
                        height: 30,
                      )
                    : FaIcon(
                        FontAwesomeIcons.solidUserCircle,
                        size: 30,
                      ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildButtonBottomAppBar({
    IconData icon,
    Function onPressed,
    Key key,
  }) {
    return Container(
      width: 40,
      height: 40,
      child: FlatButton(
        key: key,
        child: Icon(icon),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      ),
    );
  }
}
