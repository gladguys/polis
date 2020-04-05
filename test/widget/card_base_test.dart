import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/card_base.dart';

void main() {
  group('CardBase tests', () {
    test('assert', () {
      expect(
          () => CardBase(slotCenter: null, onTap: () {}), throwsAssertionError);

      expect(() => CardBase(slotCenter: Container(), onTap: null),
          throwsAssertionError);
    });
  });
}
