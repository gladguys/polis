import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/keys.dart';
import '../../../core/routing/route_names.dart';
import '../../../i18n/i18n.dart';
import '../../pages.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          key: logoutButtonKey,
          height: 30,
          child: OutlineButton.icon(
            padding: EdgeInsets.zero,
            label: Text(LOGOUT.toUpperCase()),
            icon: FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 18,
            ),
            color: Colors.red,
            textColor: Colors.red,
            highlightedBorderColor: Colors.red,
            onPressed: () {
              context.bloc<UserBloc>().add(Logout());
              SimpleRouter.forwardAndRemoveAll(
                InitialPageConnected(),
                name: INITIAL_PAGE,
              );
            },
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
