import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/flutter_bloc_observer.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/main_commom.dart' as m;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((methodCall) async => ".");
  const channel2 = MethodChannel('plugins.flutter.io/firebase_performance');
  channel2.setMockMethodCallHandler((methodCall) async => true);

  SharedPreferences.setMockInitialValues({
    'USER': null,
  });

  test('main method', () async {
    await m.main();
    expect(Crashlytics.instance.enableInDevMode, true);
    expect(FlutterError.onError,
        equals(G<CrashlyticsService>().crashlytics.recordFlutterError));
    expect(Bloc.observer, isA<FlutterBlocObserver>());
  });
}
