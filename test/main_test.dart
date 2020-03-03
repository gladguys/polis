import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polis/bloc/flutter_bloc_delegate.dart';
import 'package:polis/main.dart' as m;
import 'package:simple_router/simple_router.dart';
import 'package:test/test.dart';

void main() {
  test('main method', () {
    m.main();
    expect(Crashlytics.instance.enableInDevMode, true);
    expect(
        FlutterError.onError, equals(Crashlytics.instance.recordFlutterError));
    expect(BlocSupervisor.delegate, isA<FlutterBlocDelegate>());
    expect(SimpleRouter.getKey(), equals(Get.key));
  });
}
