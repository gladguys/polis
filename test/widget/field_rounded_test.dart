import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polis/widget/general/field_rounded.dart';

import '../utils.dart';

void main() {
  group('FieldRounded tests', () {
    testWidgets('should have textSuffix when passed', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const Scaffold(
            body: FieldRounded(
              textSuffix: 'suffix',
            ),
          ),
        ),
      );
      final text = find.byType(Text);
      expect(text, findsOneWidget);
      await tester.tap(text);
    });

    testWidgets('should have iconSuffix when passed', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const Scaffold(
            body: FieldRounded(
              iconSuffix: Icons.event,
            ),
          ),
        ),
      );
      final icon = find.byType(FaIcon);
      expect(icon, findsOneWidget);
      await tester.tap(icon);
    });
  });
}
