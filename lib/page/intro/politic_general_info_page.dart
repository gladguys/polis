import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import 'intro_base.dart';
import 'pick_state_page.dart';

class PoliticGeneralInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroBase(
      msg: POLITIC_GENERAL_INFO_MESSAGE,
      onPressed: () => SimpleRouter.forwardAndReplace(
        PickStatePage(),
        name: PICK_STATE_PAGE,
      ),
    );
  }
}
