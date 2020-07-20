import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/dto/total_despesas_anuais.dart';

void main() {
  group('DespesaMensal tests', () {
    test('props', () {
      expect(
        TotalDespesasAnuais(ano: '2020', despesasPorMes: []),
        TotalDespesasAnuais(ano: '2020', despesasPorMes: []),
      );
      expect(
        TotalDespesasAnuais(ano: '2019', despesasPorMes: []),
        TotalDespesasAnuais(ano: '2020', despesasPorMes: []),
      );
    });

    test('toString()', () {
      final modelToString =
          TotalDespesasAnuais(ano: '2020', despesasPorMes: []).toString();
      final result = '''TotalDespesasAnuais{ano: 2020, despesasPorMes: []}''';
      expect(modelToString == result, true);
    });
  });
}
