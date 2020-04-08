import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/button_action_card.dart';

void main() {
  group('ButtonActionCard tests', () {
    test('assert', () {
      expect(() => ButtonActionCard(icon: null, onTap: () {}),
          throwsAssertionError);

      expect(() => ButtonActionCard(icon: Icons.map, onTap: null),
          throwsAssertionError);
    });
  });
}
