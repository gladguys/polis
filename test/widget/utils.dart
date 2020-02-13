import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget connectedWidget(Widget widget) => MaterialApp(
      navigatorKey: Get.key,
      home: widget,
    );
