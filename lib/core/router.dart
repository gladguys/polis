import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/signup/signup_page.dart';

import 'route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SIGNIN_PAGE:
        return GetRoute(
          page: SigninPage(),
          settings: settings,
        );
      case SIGNUP_PAGE:
        return GetRoute(
          settings: settings,
          page: SignupPage(),
          transition: Transition.fade,
        );
      default:
        return GetRoute(
          settings: settings,
          transition: Transition.fade,
          page: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
