import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/routing/polis_routing_observer.dart';
import 'package:polis/page/pages.dart';

void main() {
  group('PolisRoutingObserver tests', () {
    PolisRoutingObserver polisRoutingObserver;

    setUp(() {
      polisRoutingObserver = PolisRoutingObserver();
    });

    test('didPush', () {
      polisRoutingObserver.didPush(
        MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: RouteSettings(name: 'HomePage'),
        ),
        MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: RouteSettings(name: 'SigninPage'),
        ),
      );
    });

    test('didReplace', () {
      polisRoutingObserver.didReplace(
        newRoute: MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: RouteSettings(name: 'HomePage'),
        ),
        oldRoute: MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: RouteSettings(name: 'SigninPage'),
        ),
      );
    });

    test('didPop', () {
      polisRoutingObserver.didPop(
        MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: RouteSettings(name: 'HomePage'),
        ),
        MaterialPageRoute(
          builder: (_) => SigninPageConnected(),
          settings: RouteSettings(name: 'SigninPage'),
        ),
      );
    });
  });
}
