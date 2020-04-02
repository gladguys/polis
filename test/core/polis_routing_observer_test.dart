import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/routing/polis_routing_observer.dart';
import 'package:polis/core/routing/route_names.dart';
import 'package:polis/page/pages.dart';

import '../mock.dart';

void main() {
  group('PolisRoutingObserver tests', () {
    PolisRoutingObserver polisRoutingObserver;

    setUp(() {
      polisRoutingObserver = PolisRoutingObserver();
    });

    test('didPush', () {
      polisRoutingObserver.didPush(
        MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: const RouteSettings(name: SIGNIN_PAGE),
        ),
        MaterialPageRoute(
          builder: (_) => SignupPageConnected(
            panelController: MockPanelController(),
          ),
          settings: const RouteSettings(name: SIGNUP_PAGE),
        ),
      );
    });

    test('didReplace', () {
      polisRoutingObserver.didReplace(
        newRoute: MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: const RouteSettings(name: SIGNIN_PAGE),
        ),
        oldRoute: MaterialPageRoute(
          builder: (_) => SignupPageConnected(
            panelController: MockPanelController(),
          ),
          settings: const RouteSettings(name: SIGNUP_PAGE),
        ),
      );
    });

    test('didPop', () {
      polisRoutingObserver.didPop(
        MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: const RouteSettings(name: SIGNIN_PAGE),
        ),
        MaterialPageRoute(
          builder: (_) => SignupPageConnected(
            panelController: MockPanelController(),
          ),
          settings: const RouteSettings(name: SIGNUP_PAGE),
        ),
      );
    });
  });
}
