import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../pages.dart';

class ConfigsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => SimpleRouter.forward(
        UserConfigsPage(),
        name: USER_CONFIGS_PAGE,
      ),
      icon: Icon(Icons.settings),
    );
  }
}
