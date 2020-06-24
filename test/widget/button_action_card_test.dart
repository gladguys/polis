import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/general/button_action_card.dart';

import '../utils.dart';

void main() {
  group('ButtonActionCard tests', () {
    test('assert', () {
      expect(() => ButtonActionCard(icon: null, onTap: () {}),
          throwsAssertionError);

      expect(() => ButtonActionCard(icon: Icons.map, onTap: null),
          throwsAssertionError);
    });

    testWidgets('should not have text when isIconOnly is true', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: ButtonActionCard(
              icon: Icons.event,
              onTap: () {},
              isIconOnly: true,
            ),
          ),
        ),
      );
      expect(find.byType(Text), findsNothing);
    });
  });
}
