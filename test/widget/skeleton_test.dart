import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/skeleton.dart';

void main() {
  group('Skeleton tests', () {
    test('assert', () {
      expect(() => Skeleton(height: null, width: 10.0), throwsAssertionError);
      expect(() => Skeleton(height: 10.0, width: null), throwsAssertionError);
    });
  });
}
