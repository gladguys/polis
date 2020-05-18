import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../bloc/blocs.dart';
import '../core/keys.dart';
import '../core/routing/route_names.dart';
import '../i18n/i18n.dart';
import '../page/pages.dart';
import '../page/theme/main_theme.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80,
            height: 48,
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
          const Spacer(),
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
          const SizedBox(width: 4),
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
          const SizedBox(width: 4),
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
          const Spacer(),
          Container(
            width: 80,
            height: 48,
            alignment: Alignment.centerRight,
            child: _buildUserButton(context, routeName),
          ),
        ],
      ),
    );
  }

  Widget _buildUserButton(BuildContext context, String routeName) {
    final user = context.bloc<UserBloc>().user;

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          child: Container(
            key: profileImageBottombarKey,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, state) => Photo(
                url: state is CurrentUserUpdated
                    ? state.user.photoUrl
                    : user.photoUrl,
                size: 32,
                boxFit: BoxFit.cover,
                iconColor: theme.accentColor,
                iconKey: userPhotolessIconKey,
              ),
            ),
          ),
        ),
        onTap: () => routeName != USER_PROFILE_PAGE
            ? SimpleRouter.forward(
                UserProfilePageConnected(),
                name: USER_PROFILE_PAGE,
              )
            : VoidCallback,
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
      width: 40,
      height: 40,
      child: FlatButton(
        key: key,
        color: isSelected ? theme.primaryColorLight.withOpacity(.7) : null,
        child: icon != null ? FaIcon(icon, size: iconSize) : child,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      ),
    );
  }
}
