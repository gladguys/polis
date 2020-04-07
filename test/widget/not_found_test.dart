import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/not_found.dart';

void main() {
  group('NotFound tests', () {
    test('assert', () {
      expect(() => NotFound(msg: null), throwsAssertionError);
    });
  });
}
