import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';

import '../mock.dart';

void main() {
  AdService adService;
  MockBannerAd mockBannerAd;

  group('AdService tests', () {
    setUp(() {
      mockBannerAd = MockBannerAd();
      adService = AdService(bannerAd: mockBannerAd);
    });

    test('assert', () {
      expect(() => AdService(bannerAd: null), throwsAssertionError);
    });

    test('calling dispose should dispose the banner', () {
      adService.dispose();
      expect(adService.bannerAd.isLoaded(), isNull);
    });

    test('load and shows banner with desired configs when calls showBanner',
        () {
      adService.showBanner();
      verify(mockBannerAd.load()).called(1);
      verify(
        mockBannerAd.show(
          anchorOffset: 0,
          horizontalCenterOffset: 0,
          anchorType: AnchorType.bottom,
        ),
      ).called(1);
    });
  });
}
