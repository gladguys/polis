import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../pages.dart';
import 'intro_base.dart';

class PolisInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroBase(
      msg: POLIS_INFO_MESSAGE,
      onPressed: () => SimpleRouter.forwardAndReplace(
        TimelineInfoPage(),
        name: TIMELINE_INFO_PAGE,
      ),
    );
  }
}
