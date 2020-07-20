import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/dto/despesa_mensal.dart';

void main() {
  group('DespesaMensal tests', () {
    test('nomeMes', () {
      final janeiro = DespesaMensal(mes: '01');
      final fevereiro = DespesaMensal(mes: '02');
      final marco = DespesaMensal(mes: '03');
      final abril = DespesaMensal(mes: '04');
      final maio = DespesaMensal(mes: '05');
      final junho = DespesaMensal(mes: '06');
      final julho = DespesaMensal(mes: '07');
      final agosto = DespesaMensal(mes: '08');
      final setembro = DespesaMensal(mes: '09');
      final outubro = DespesaMensal(mes: '10');
      final novembro = DespesaMensal(mes: '11');
      final dezembro = DespesaMensal(mes: '12');

      expect(janeiro.mes, 'Janeiro');
      expect(fevereiro.mes, 'Fevereiro');
      expect(marco.mes, 'Marco');
      expect(abril.mes, 'Abril');
      expect(maio.mes, 'Maio');
      expect(junho.mes, 'Junho');
      expect(julho.mes, 'Julho');
      expect(agosto.mes, 'Agosto');
      expect(setembro.mes, 'Setembro');
      expect(outubro.mes, 'Outubro');
      expect(novembro.mes, 'Novembro');
      expect(dezembro.mes, 'Dezembro');
    });

    test('toString()', () {
      final modelToString = DespesaMensal(mes: '01', valor: 10.0).toString();
      final result = '''DespesaMensal{mes: 01, valor: 10.0}''';
      expect(modelToString == result, true);
    });

    test('props', () {
      expect(
        DespesaMensal(mes: '01', valor: 10.0),
        DespesaMensal(mes: '01', valor: 10.0),
      );
      expect(
          DespesaMensal(mes: '01', valor: 10.0) ==
              DespesaMensal(mes: '02', valor: 10.0),
          false);
    });
  });
}
