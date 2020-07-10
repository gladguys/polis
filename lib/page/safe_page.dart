import 'package:abouttoclose/abouttoclose.dart';
import 'package:flutter/material.dart';

import '../core/i18n/i18n.dart';

class SafePage extends StatelessWidget {
  SafePage({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AboutToClose(
      dialogType: DialogType.cupertino,
      dialogTitle: LEAVE_APP_WARN,
      yesOption: YES,
      noOption: NO,
      child: child,
    );
  }
}
