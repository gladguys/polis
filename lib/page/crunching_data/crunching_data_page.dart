import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../pages.dart';

class CrunchingDataPage extends StatefulWidget {
  @override
  _CrunchingDataPageState createState() => _CrunchingDataPageState();
}

class _CrunchingDataPageState extends State<CrunchingDataPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.addListener(() => setState(() {}));
    Future.delayed(const Duration(seconds: 4))
        .then((_) => controller.forward());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 28),
              const Flexible(
                flex: 6,
                child: FlareActor(
                  'assets/animations/PolisIntro.flr',
                  animation: 'start',
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, top: 42),
                  child: Opacity(
                    opacity: 1 - controller.value,
                    child: const RotateAnimatedTextKit(
                      text: [
                        SEARCHING_POLITICS,
                        SEARCHING_PARTIES,
                        SEARCHING_STATES
                      ],
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Horizon',
                      ),
                      alignment: AlignmentDirectional.topStart,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Opacity(
                  opacity: controller.value,
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
      ),
    );
  }
}
