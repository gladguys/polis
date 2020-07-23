import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/cubits.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: logoutButtonKey,
      height: 30,
      child: OutlineButton.icon(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        label: Text(LOGOUT),
        icon: FaIcon(
          FontAwesomeIcons.signOutAlt,
          size: 18,
        ),
        color: Colors.red,
        textColor: Colors.red,
        highlightedBorderColor: Colors.red,
        onPressed: () {
          context.bloc<UserCubit>().logout();
          SimpleRouter.forwardAndRemoveAll(
            InitialPageConnected(),
            name: INITIAL_PAGE,
          );
        },
      ),
    );
  }
}
