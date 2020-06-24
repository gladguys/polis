import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/card_base.dart';

void main() {
  group('CardBase tests', () {
    test('assert', () {
      expect(
          () => CardBase(slotCenter: null, onTap: () {}), throwsAssertionError);
    });
  });
}
