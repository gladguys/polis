import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/flutter_bloc_delegate.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/main.dart' as m;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({
    'USER': null,
  });

  test('main method', () async {
    await m.main();
    expect(Crashlytics.instance.enableInDevMode, true);
    expect(FlutterError.onError,
        equals(G<CrashlyticsService>().crashlytics.recordFlutterError));
    expect(BlocSupervisor.delegate, isA<FlutterBlocDelegate>());
  });
}
