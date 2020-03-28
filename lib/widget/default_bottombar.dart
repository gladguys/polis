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
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
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
                    padding: const EdgeInsets.only(right: 3),
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
                  padding: const EdgeInsets.only(right: 3),
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
            width: 80,
            height: 40,
            alignment: Alignment.centerRight,
            child: _buildUserButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildUserButton(BuildContext context) {
    final user = context.bloc<UserBloc>().user;
    return user.photoUrl != null
        ? _buildButtonBottomAppBar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FancyShimmerImage(
                imageUrl: user.photoUrl,
                width: 30,
                height: 30,
                boxFit: BoxFit.cover,
              ),
            ),
            onPressed: _onPressedUserButton,
          )
        : _buildButtonBottomAppBar(
            icon: FontAwesomeIcons.solidUserCircle,
            iconSize: 28,
            padding: const EdgeInsets.only(left: 1, bottom: 3),
            onPressed: _onPressedUserButton,
          );
  }

  void _onPressedUserButton() {
    SimpleRouter.forward(
      UserProfilePageConnected(),
      name: USER_PROFILE_PAGE,
    );
  }

  Widget _buildButtonBottomAppBar({
    Widget child,
    IconData icon,
    double iconSize,
    EdgeInsets padding = EdgeInsets.zero,
    Function onPressed,
    Key key,
  }) {
    return Container(
      width: 40,
      height: 40,
      child: FlatButton(
        key: key,
        child: icon != null ? Icon(icon, size: iconSize) : child,
        padding: padding,
        onPressed: onPressed,
      ),
    );
  }
}
