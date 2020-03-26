import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/pages.dart';
import 'package:smart_select/smart_select.dart';

import '../utils.dart';

void main() {
  group('IntroPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
    });

    testWidgets('should choose an option from select', (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
      final select = find.byType(SmartSelectTile);
      expect(select, findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('should go to POLITIC_SUGGESTION_PAGE page when click on done',
        (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
      final doneButton = find.byKey(const ValueKey('done-btn'));
      expect(doneButton, doneButton);
    });
  });
}
