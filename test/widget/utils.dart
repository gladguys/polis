import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

Widget connectedWidget(Widget widget) {
  SimpleRouter.setKey(Get.key);
  return MaterialApp(
    navigatorKey: Get.key,
    home: widget,
  );
}
