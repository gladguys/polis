import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/dto/despesa_por_tipo.dart';

void main() {
  final jsonDespesaPorTipo = {
    'tipoCota': 'tipoCota',
    'valor': '1',
    'percentual': '1%',
  };

  final despesaPorTipoModel = DespesaPorTipo(
    tipoCota: 'tipoCota',
    valor: '1',
    percentual: '1%',
  );

  group('DespesaPorTipo tests', () {
    test('props', () {
      final despesaPorTipo1 = DespesaPorTipo(
        tipoCota: 'tipoCota',
        valor: '1',
        percentual: '1%',
      );
      final despesaPorTipo11 = DespesaPorTipo(
        tipoCota: 'tipoCota',
        valor: '1',
        percentual: '1%',
      );
      final despesaPorTipo2 = DespesaPorTipo(
        tipoCota: 'tipoCota',
        valor: '2',
        percentual: '2%',
      );

      expect(despesaPorTipo1 == despesaPorTipo11, true);
      expect(despesaPorTipo11 == despesaPorTipo2, false);
    });

    test('toString()', () {
      final modelToString = DespesaPorTipo(
        tipoCota: 'tipoCota',
        valor: '2',
        percentual: '2%',
      ).toString();
      final result =
          '''DespesaPorTipo{tipoCota: tipoCota, valor: 2, percentual: 2%}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(DespesaPorTipo.fromJson(jsonDespesaPorTipo) == despesaPorTipoModel,
          true);
    });

    group('toJson', () {
      test('commom usage', () {
        final despesaToJson = despesaPorTipoModel.toJson();
        expect(despesaToJson['idPolitico'] == jsonDespesaPorTipo['idPolitico'],
            true);
        expect(
            despesaToJson['nomePolitico'] == jsonDespesaPorTipo['nomePolitico'],
            true);
        expect(despesaToJson['data'] == jsonDespesaPorTipo['data'], true);
        expect(
            despesaToJson['mensagem'] == jsonDespesaPorTipo['mensagem'], true);
        expect(despesaToJson['tipo'] == jsonDespesaPorTipo['tipo'], true);
        expect(
            despesaToJson['urlFotoPolitico'] ==
                jsonDespesaPorTipo['urlFotoPolitico'],
            true);
      });
    });
  });
}
