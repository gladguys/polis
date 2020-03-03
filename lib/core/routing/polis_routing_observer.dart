import 'package:flutter/material.dart';

class PolisRoutingObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      print('[PolisRoutingObserver] Navigation: pushed ${route.settings.name}');
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      print('[PolisRoutingObserver] Navigation: pushed '
          '${newRoute.settings.name} and removed ${oldRoute.settings.name}');
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      print('[PolisRoutingObserver] Navigation: popped ${route.settings.name}');
    }
  }
}
