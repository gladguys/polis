import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/field_search.dart';

void main() {
  group('FieldSearch tests', () {
    test('assert', () {
      expect(() => FieldSearch(onChanged: null), throwsAssertionError);
    });
  });
}
