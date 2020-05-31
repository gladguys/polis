import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/extension/media_query_extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../pages.dart';

class TimelineInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                POLIS,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              FaIcon(
                FontAwesomeIcons.clipboardList,
                size: 120,
              ),
              const SizedBox(height: 22),
              const Text(
                TIMELINE_INFO_MESSAGE,
                style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(Icons.navigate_next, color: Colors.black),
        backgroundColor: Colors.amber,
        onPressed: () => SimpleRouter.forwardAndReplace(
          PoliticGeneralInfoPage(),
          name: POLITIC_GENERAL_INFO_PAGE,
        ),
      ),
    );
  }
}
