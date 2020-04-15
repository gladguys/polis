import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/services.dart';

import '../mock.dart';

void main() {
  group('PerformanceService tests', () {
    PerformanceService performanceService;
    MockFirebasePerformance mockFirebasePerformance;

    setUp(() {
      mockFirebasePerformance = MockFirebasePerformance();
      performanceService =
          PerformanceService(performance: mockFirebasePerformance);
    });

    test('assert', () async {
      expect(
          () => performanceService.getTrace(trace: null), throwsAssertionError);
    });

    test('should call newTrace and get a new trace', () async {
      when(mockFirebasePerformance.newTrace(any)).thenReturn(MockTrace());
      final trace = await performanceService.getTrace(trace: 'trace');
      expect(trace, isNotNull);
    });
  });
}
