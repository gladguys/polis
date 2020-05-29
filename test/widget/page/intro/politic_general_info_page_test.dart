import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/pages.dart';

import '../../utils.dart';

void main() {
  group('PoliticGeneralInfoPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(PoliticGeneralInfoPage()));
    });

    testWidgets('should goto to PickStatePage when click on fab',
        (tester) async {
      await tester.pumpWidget(connectedWidget(PoliticGeneralInfoPage()));
      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.byType(PickStatePage), findsOneWidget);
    });
  });
}
