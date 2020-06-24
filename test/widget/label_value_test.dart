import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/label_value.dart';

void main() {
  group('FieldRounded tests', () {
    test('assert', () {
      expect(() => LabelValue(label: null), throwsAssertionError);
    });
  });
}
