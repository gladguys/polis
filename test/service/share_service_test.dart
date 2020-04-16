import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((methodCall) async => ".");

  ShareService shareService;

  group('ShareService tests', () {
    setUp(() {
      shareService = ShareService();
    });

    test('shareFile', () async {
      final file = File('../assets/images/google.png');
      await shareService.shareFile(file);
    });
  });
}
