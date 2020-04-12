import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/services.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  UrlLauncherService urlLauncherService;

  group('UrlLauncherService', () {
    setUp(() {
      urlLauncherService = UrlLauncherService();
    });

    group('works', () {
      setUp(() {
        const channel = MethodChannel('plugins.flutter.io/url_launcher');
        channel.setMockMethodCallHandler((methodCall) async => true);
      });

      test('canLaunchEmailUrl', () async {
        await urlLauncherService.canLaunchEmailUrl('rod@gmail.com');
      });

      test('launchEmailUrl', () async {
        await urlLauncherService.launchEmailUrl('rod@gmail.com');
      });

      test('launchUrl', () async {
        await urlLauncherService.launchUrl('url');
      });
    });

    group('throws exception', () {
      setUp(() {
        const channel = MethodChannel('plugins.flutter.io/url_launcher');
        channel.setMockMethodCallHandler((methodCall) async => throwsException);
      });

      test('canLaunchEmailUrl', () async {
        urlLauncherService
            .canLaunchEmailUrl('rod@gmail.com')
            .catchError((e) => expect(e, isA<PlatformException>()));
      });

      test('launchEmailUrl', () async {
        urlLauncherService
            .launchEmailUrl('rod@gmail.com')
            .catchError((e) => expect(e, isA<PlatformException>()));
      });

      test('launchUrl', () async {
        urlLauncherService
            .launchUrl('url')
            .catchError((e) => expect(e, isA<PlatformException>()));
      });
    });
  });
}
