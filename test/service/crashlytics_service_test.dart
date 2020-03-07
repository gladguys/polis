import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/service/crashlytics_service.dart';

void main() {
  group('CrashlyticsService tests', () {
    test('assert', () {
      expect(() => CrashlyticsService(crashlytics: null), throwsAssertionError);
    });
  });
}
