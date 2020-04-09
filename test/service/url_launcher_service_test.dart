import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/services.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  channel.setMockMethodCallHandler((methodCall) async => true);
  UrlLauncherService urlLauncherService;

  group('UrlLauncherService tests', () {
    setUp(() {
      urlLauncherService = UrlLauncherService();
    });

    test('canLaunch', () async {
      await urlLauncherService.canLaunchEmailUrl('rod@gmail.com');
    });

    test('launch', () async {
      await urlLauncherService.launchEmailUrl('rod@gmail.com');
    });
  });
}
