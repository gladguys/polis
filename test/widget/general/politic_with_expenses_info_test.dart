import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/comparativo_ranking_despesas/widget/politic_with_expenses_info.dart';

void main() {
  group('PoliticWithExpensesInfo tests', () {
    test('asserts', () {
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: null,
                partido: 'partido',
                estado: 'estado',
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: null,
                estado: 'estado',
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: null,
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: 'estado',
                foto: null,
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: 'estado',
                foto: 'foto',
                nome: null,
              ),
          throwsAssertionError);
    });
  });
}
