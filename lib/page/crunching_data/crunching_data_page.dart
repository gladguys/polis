import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../pages.dart';
import 'widget/searching_info.dart';

class CrunchingDataPage extends StatefulWidget {
  @override
  _CrunchingDataPageState createState() => _CrunchingDataPageState();
}

class _CrunchingDataPageState extends State<CrunchingDataPage>
    with TickerProviderStateMixin {
  bool showText;
  AnimationController controller, controller2, controller3, controller4;

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    showText = true;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );
    controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );
    controller4 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
        setState(() => showText = false);
        controller4.forward();
      }
    });

    controller4.addListener(() => setState(() {}));

    Future.delayed(const Duration(seconds: 1))
        .then((_) => controller.forward());
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
            Opacity(
              opacity: controller3.value,
              child: SearchingInfo(
                icon: MaterialCommunityIcons.map_search_outline,
              ),
            ),
            Opacity(
              opacity: 1 - controller2.value,
              child: SearchingInfo(
                icon: AntDesign.flag,
              ),
            ),
            Opacity(
              opacity: 1 - controller.value,
              child: SearchingInfo(
                icon: Foundation.torso_business,
              ),
            ),
            Positioned(
              bottom: showText ? screenHeight / 5 : screenHeight / 4,
              left: showText ? screenWidth / 12 : screenWidth / 4.5,
              child: showText
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          SEARCHING,
                          style: TextStyle(fontSize: 34),
                        ),
                        const SizedBox(width: 12),
                        const RotateAnimatedTextKit(
                          text: [
                            POLITICS_DOTS,
                            PARTIES_DOTS,
                            STATES_DOTS,
                          ],
                          textStyle: TextStyle(fontSize: 34),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart,
                          isRepeatingAnimation: false,
                          duration: Duration(seconds: 2),
                        ),
                      ],
                    )
                  : Opacity(
                      opacity: controller4.value,
                      child: RaisedButton(
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
