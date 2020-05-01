import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AdService adService;

  group('AdService tests', () {
    setUp(() {
      adService = AdService();
    });

    test('should init ads', () async {
      const channel = MethodChannel('admob_flutter');
      channel.setMockMethodCallHandler((methodCall) async => ".");
      await adService.initAds();
    });
  });
}
