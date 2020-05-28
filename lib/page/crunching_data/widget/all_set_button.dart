import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/service/locator.dart';
import '../../../core/service/services.dart';
import '../../../i18n/i18n.dart';
import '../../pages.dart';

class AllSetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      child: const Text(
        ALL_SET_LETS_GO,
        style: TextStyle(fontSize: 16),
      ),
      onPressed: () => SimpleRouter.forwardAndReplace(
        TimelinePageConnected(
          appUpdateService: G<AppUpdateService>(),
        ),
        name: TIMELINE_PAGE,
      ),
    );
  }
}
