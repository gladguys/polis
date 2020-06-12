import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/intro/intro_base.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/select/selects.dart';

import '../utils.dart';

void main() {
  group('PickStatePage tests', () {
    test('assert', () {
      expect(
          () => IntroBase(
                onPressed: null,
                msg: 'msg',
                centerWidget: Container(),
              ),
          throwsAssertionError);
      expect(
          () => IntroBase(
                onPressed: () {},
                msg: null,
                centerWidget: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(PickStatePage()));
    });

    testWidgets('should choose an option from state select', (tester) async {
      await tester.pumpWidget(connectedWidget(PickStatePage()));
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
      await tester.pumpWidget(connectedWidget(PickStatePage()));
      final doneButton = find.byKey(pickStateButtonKey);
      expect(doneButton, doneButton);
      await tester.tap(doneButton);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
