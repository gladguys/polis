import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../theme/main_theme.dart';
import 'widget/all_set_button.dart';
import 'widget/searching_info.dart';

class CrunchingDataPage extends StatefulWidget {
  @override
  _CrunchingDataPageState createState() => _CrunchingDataPageState();
}

class _CrunchingDataPageState extends State<CrunchingDataPage>
    with TickerProviderStateMixin {
  AnimationController controller, controller2, controller3, controller4;

  Duration kAnimationDuration = 3.seconds;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    controller2 = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    controller3 = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    controller4 = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );

    controller.addListener(() => setState(() {}));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller2.forward();
      }
    });

    controller2.addListener(() => setState(() {}));
    controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller3.forward();
      }
    });

    controller3.addListener(() => setState(() {}));
    controller3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller4.forward();
      }
    });

    controller4.addListener(() => setState(() {}));

    Future.delayed(1.second).then((_) => controller.forward());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 1, width: double.maxFinite),
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: controller4.value,
                  child: Column(
                    children: <Widget>[
                      FaIcon(
                        FontAwesomeIcons.check,
                        size: 120,
                        color: theme.accentColor,
                      ),
                      const SizedBox(height: 16),
                      AllSetButton(),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Opacity(
                    opacity: 1 - controller3.value,
                    child: SearchingInfo(
                      icon: FontAwesomeIcons.mapMarkedAlt,
                      text: '$SEARCHING $STATES_DOTS',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Opacity(
                    opacity: 1 - controller2.value,
                    child: SearchingInfo(
                      icon: FontAwesomeIcons.flag,
                      text: '$SEARCHING $PARTIES_DOTS',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Opacity(
                    opacity: 1 - controller.value,
                    child: SearchingInfo(
                      icon: FontAwesomeIcons.userTie,
                      text: '$SEARCHING $POLITICS_DOTS',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
