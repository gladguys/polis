import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/politic_expenses_analysis/widget/see_expenses_button.dart';

import '../utils.dart';

void main() {
  group('SeeExpensesButton tests', () {
    testWidgets('should build without explogin', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          SeeExpensesButton(
            PoliticoModel(
              id: '1',
            ),
          ),
        ),
      );
    });

    testWidgets('should go to PoliticExpensesPage when click', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          SeeExpensesButton(
            PoliticoModel(
              id: '1',
            ),
          ),
        ),
      );
      final btn = find.byType(OutlineButton);
      await tester.tap(btn);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
