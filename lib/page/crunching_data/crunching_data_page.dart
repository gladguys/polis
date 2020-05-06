import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/routing/route_names.dart';
import '../../extension/extensions.dart';
import '../../i18n/i18n.dart';
import '../pages.dart';
import 'widget/searching_info.dart';

class CrunchingDataPage extends StatefulWidget {
  @override
  _CrunchingDataPageState createState() => _CrunchingDataPageState();
}

class _CrunchingDataPageState extends State<CrunchingDataPage>
    with TickerProviderStateMixin {
  AnimationController controller, controller2, controller3, controller4;

  double get screenWidth => context.screenWidth;
  double get kDistanceToLeft => 40;
  double get kDistanceToTop => (context.screenHeight - kEndIconSize) / 2;
  double get kDistanceEndToLeft =>
      (screenWidth - kEndIconSize - kDistanceToLeft) / 2;

  Duration kAnimationDuration = 3500.milliseconds;
  double kEndIconSize = 180.0;

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
        child: Stack(
          children: <Widget>[
            Positioned(
              left: kDistanceEndToLeft,
              top: kDistanceToTop,
              child: Opacity(
                opacity: controller4.value,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          AntDesign.checkcircleo,
                          size: kEndIconSize,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 32),
                        RaisedButton(
                          color: Colors.amber,
                          child: const Text(
                            ALL_SET_LETS_GO,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () => SimpleRouter.forwardAndReplace(
                            TimelinePageConnected(),
                            name: TIMELINE_PAGE,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: kDistanceToLeft,
              top: kDistanceToTop,
              child: Opacity(
                opacity: 1 - controller3.value,
                child: SearchingInfo(
                  icon: MaterialCommunityIcons.map_search_outline,
                  text: '$SEARCHING $STATES_DOTS',
                ),
              ),
            ),
            Positioned(
              left: kDistanceToLeft,
              top: kDistanceToTop,
              child: Opacity(
                opacity: 1 - controller2.value,
                child: SearchingInfo(
                  icon: AntDesign.flag,
                  text: '$SEARCHING $PARTIES_DOTS',
                ),
              ),
            ),
            Positioned(
              left: kDistanceToLeft,
              top: kDistanceToTop,
              child: Opacity(
                opacity: 1 - controller.value,
                child: SearchingInfo(
                  icon: Foundation.torso_business,
                  text: '$SEARCHING $POLITICS_DOTS',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
