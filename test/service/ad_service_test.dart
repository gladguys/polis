import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/services.dart';

void main() {
  AdService adService;

  group('AdService tests', () {
    setUp(() {
      adService = AdService();
    });

    test('should init ads', () {
      adService.initAds();
    });
  });
}
