import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../bloc/blocs.dart';
import '../core/keys.dart';
import '../core/routing/route_names.dart';
import '../i18n/i18n.dart';
import '../page/pages.dart';
import 'photo.dart';

class DefaultBottombar extends StatelessWidget {
  DefaultBottombar(
    this.routeName, {
    this.onPopCallback = SimpleRouter.back,
    this.withBack = false,
  });

  final String routeName;
  final VoidCallback onPopCallback;
  final bool withBack;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 56,
            alignment: Alignment.centerLeft,
            child: !withBack
                ? const Padding(
                    padding: EdgeInsets.only(left: 8),
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
                    key: arrowBackButtonKey,
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
                  isSelected: routeName == TIMELINE_PAGE,
                  onPressed: () => routeName != TIMELINE_PAGE
                      ? SimpleRouter.forwardAndReplace(
                          TimelinePageConnected(),
                          name: TIMELINE_PAGE,
                        )
                      : VoidCallback,
                ),
                _buildButtonBottomAppBar(
                  icon: FontAwesomeIcons.search,
                  isSelected: routeName == SEARCH_POLITIC_PAGE,
                  onPressed: () => routeName != SEARCH_POLITIC_PAGE
                      ? SimpleRouter.forwardAndReplace(
                          SearchPoliticPageConnected(),
                          name: SEARCH_POLITIC_PAGE,
                        )
                      : VoidCallback,
                ),
                _buildButtonBottomAppBar(
                  icon: FontAwesomeIcons.solidBookmark,
                  isSelected: routeName == FAVORITE_POSTS_PAGE,
                  onPressed: () => routeName != FAVORITE_POSTS_PAGE
                      ? SimpleRouter.forwardAndReplace(
                          FavoritePostsPageConnected(),
                          name: FAVORITE_POSTS_PAGE,
                        )
                      : VoidCallback,
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 48,
            alignment: Alignment.centerRight,
            child: _buildUserButton(context),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _buildUserButton(BuildContext context) {
    final user = context.bloc<UserBloc>().user;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 48,
        height: 60,
        child: Container(
          key: profileImageBottombarKey,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, state) => Photo(
              url: state is CurrentUserUpdated
                  ? state.user.photoUrl
                  : user.photoUrl,
              size: 40,
              boxFit: BoxFit.cover,
              iconColor: Colors.black,
              iconKey: userPhotolessIconKey,
            ),
          ),
        ),
      ),
      onTap: () => SimpleRouter.forward(
        UserProfilePageConnected(),
        name: USER_PROFILE_PAGE,
      ),
    );
  }

  Widget _buildButtonBottomAppBar({
    Widget child,
    IconData icon,
    double iconSize = 24,
    bool isSelected = false,
    Function onPressed,
    Key key,
  }) {
    return Container(
      width: 48,
      height: 48,
      child: FlatButton(
        key: key,
        color: isSelected ? Colors.grey[300] : null,
        child: icon != null ? FaIcon(icon, size: iconSize) : child,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      ),
    );
  }
}
