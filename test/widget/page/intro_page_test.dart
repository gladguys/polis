import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/select/selects.dart';

import '../utils.dart';

void main() {
  group('IntroPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
    });

    testWidgets('should choose an option from state select', (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
      final estadoSelect = find.byType(EstadoSelect);
      expect(estadoSelect, findsOneWidget);
      await tester.tap(estadoSelect);
      await tester.pumpAndSettle();
      final opcaoTodos = find.text('Ceará');
      expect(opcaoTodos, findsOneWidget);
      await tester.tap(opcaoTodos);
      await tester.pumpAndSettle();
    });

    testWidgets('should go to POLITIC_SUGGESTION_PAGE page when click on done',
        (tester) async {
      await tester.pumpWidget(connectedWidget(IntroPage()));
      final doneButton = find.byKey(const ValueKey('done-btn'));
      expect(doneButton, doneButton);
      await tester.tap(doneButton);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
