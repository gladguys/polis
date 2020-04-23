import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/abstract/polis_google_auth_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PolisGoogleAuthProvider polisGoogleAuthProvider;
  MethodChannel channel;

  group('PolisGoogleAuthProvider tests', () {
    setUp(() {
      channel = const MethodChannel('plugins.flutter.io/image_picker');
      polisGoogleAuthProvider = PolisGoogleAuthProvider();
      channel.setMockMethodCallHandler((methodCall) async {
        return 'image';
      });
    });

    test('assert', () {
      expect(
          () => polisGoogleAuthProvider.getCredential(
              accessToken: null, idToken: 'id'),
          throwsAssertionError);
      expect(
          () => polisGoogleAuthProvider.getCredential(
              accessToken: 'token', idToken: null),
          throwsAssertionError);
    });

    test('getCredential', () {
      polisGoogleAuthProvider.getCredential(
          accessToken: 'token', idToken: 'id');
    });
  });
}
