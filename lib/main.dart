import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polis/core/route_constants.dart';

import 'bloc/flutter_bloc_delegate.dart';
import 'core/router.dart';

void main() {
  BlocSupervisor.delegate = FlutterBlocDelegate();
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
      initialRoute: SIGNIN_PAGE,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
