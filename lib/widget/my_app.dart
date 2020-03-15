import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routing/polis_routing_observer.dart';
import '../core/service/locator.dart';
import '../core/service/services.dart';
import '../page/pages.dart';
import '../page/theme/main_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polis',
      debugShowCheckedModeBanner: false,
      theme: theme,
      navigatorKey: Get.key,
      home: InitialPage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: G<AnalyticsService>().analytics),
        PolisRoutingObserver(),
      ],
    );
  }
}
