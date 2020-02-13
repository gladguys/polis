import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'page/pages.dart';

void main() {
  BlocSupervisor.delegate = FlutterBlocDelegate();
  runApp(MyApp());
}

/// Bootstrap of the App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Get.key,
      home: SigninPage(),
    );
  }
}
