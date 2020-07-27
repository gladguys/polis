import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/i18n/i18n.dart';
import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class ConfigsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: OutlineButton.icon(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        highlightedBorderColor: Colors.grey,
        label: const Text(PREFERENCES),
        icon: FaIcon(
          FontAwesomeIcons.cog,
          size: 18,
        ),
        onPressed: () => SimpleRouter.forward(
          UserConfigsPage(),
          name: USER_CONFIGS_PAGE,
        ),
      ),
    );
  }
}
