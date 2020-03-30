import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/partido_model.dart';
import 'package:polis/widget/select/selects.dart';

import '../utils.dart';

void main() {
  group('PartidoSelect tests', () {
    testWidgets('should build withou exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: PartidoSelect(
              partidos: [
                PartidoModel(
                  id: '1',
                  nome: 'nome',
                  sigla: 'sigla',
                )
              ],
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
                partidos: [],
                onChange: null,
              ),
            ),
          ),
        ),
        throwsAssertionError,
      );

      expect(
        () async => await tester.pumpWidget(
          connectedWidget(
            Scaffold(
              body: PartidoSelect(
                partidos: null,
                onChange: (partido) {},
              ),
            ),
          ),
        ),
        throwsAssertionError,
      );
    });
  });
}
