import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/i18n/i18n.dart';
import '../../widget/general/logo.dart';

class IntroBase extends StatelessWidget {
  const IntroBase({
    this.msg,
    this.centerWidget,
    this.keyButton,
    @required this.onPressed,
  })  : assert(msg != null || centerWidget != null),
        assert(onPressed != null);

  final String msg;
  final Widget centerWidget;
  final Key keyButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Logo(),
            const SizedBox(height: 24),
            if (msg != null)
              Text(
                msg,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              )
            else
              centerWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 36,
        child: FloatingActionButton.extended(
          key: keyButton,
          elevation: 2,
          highlightElevation: 2,
          icon: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: 18,
            ),
          ),
          label: Text(
            NEXT.toUpperCase(),
            style: const TextStyle(
              letterSpacing: .3,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
