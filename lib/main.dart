import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/routing/core.dart';
import 'page/signin/signin_page_connected.dart';

void main() {
  BlocSupervisor.delegate = FlutterBlocDelegate();
  configRouting();
  runApp(MyApp());
}

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
      home: SigninPageConnected(),
    );
  }
}
