import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/select/selects.dart';

import '../utils.dart';

void main() {
  group('PartidoSelect tests', () {
    testWidgets('should build withou exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: PartidoSelect(
              onChange: (_) {},
            ),
          ),
        ),
      );
      final partido = find.text('Partido');
      expect(partido, findsOneWidget);
      await tester.tap(partido);
      await tester.pumpAndSettle();
      final todos = find.text('Todos');
      expect(todos, findsOneWidget);
      await tester.tap(todos);
    });

    testWidgets('asserts', (tester) async {
      expect(
        () async => await tester.pumpWidget(
          connectedWidget(
            Scaffold(
              body: PartidoSelect(
                onChange: null,
              ),
            ),
          ),
        ),
        throwsAssertionError,
      );
    });
  });
}
