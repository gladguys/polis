import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/widget/select/selects.dart';

import '../utils.dart';

void main() {
  group('EstadoSelect tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: EstadoSelect(
              onChange: (_) {},
            ),
          ),
        ),
      );
      final estado = find.text('Estado');
      expect(estado, findsOneWidget);
      await tester.tap(estado);
      await tester.pumpAndSettle();
      final todos = find.text('Todos');
      expect(todos, findsOneWidget);
      await tester.tap(todos);
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: EstadoSelect(
              onChange: (_) {},
            ),
          ),
          useDarkMode: true,
        ),
      );
      final estado = find.text('Estado');
      expect(estado, findsOneWidget);
      await tester.tap(estado);
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
              body: EstadoSelect(
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
