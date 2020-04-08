import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/field_rounded.dart';

void main() {
  group('FieldRounded tests', () {
    test('assert', () {
      expect(() => const FieldRounded(onChanged: null), throwsAssertionError);
    });
  });
}
