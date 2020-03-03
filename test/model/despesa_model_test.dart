import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/despesa_model.dart';

void main() {
  final now = DateTime.now();

  final jsonDespesa = {
    'id': '1',
    'tipoDespesa': 'Tipo Despesa',
    'tipoDocumento': 'Tipo Documento',
    'dataDocumento': now.toIso8601String(),
    'valorDocumento': 150.0,
    'nomeFornecedor': 'Nome',
    'cnpjCpfFornecedor': '00000000000',
  };

  final despesaModel = DespesaModel(
    id: '1',
    tipoDespesa: 'Tipo Despesa',
    tipoDocumento: 'Tipo Documento',
    dataDocumento: now,
    valorDocumento: 150.0,
    nomeFornecedor: 'Nome',
    cnpjCpfFornecedor: '00000000000',
  );

  group('DespesaModel tests', () {
    test('props', () {
      final despesa1 = DespesaModel(
        id: '1',
      );
      final despesa11 = DespesaModel(
        id: '1',
      );
      final despesa2 = DespesaModel(
        id: '2',
      );

      expect(despesa1 == despesa11, true);
      expect(despesa1 == despesa2, false);
    });

    test('toString()', () {
      final modelToString = DespesaModel(id: '1').toString();
      final result =
          '''DespesaModel{id: 1, tipoDespesa: null, tipoDocumento: null, dataDocumento: null, valorDocumento: null, nomeFornecedor: null, cnpjCpfFornecedor: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(DespesaModel.fromJson(jsonDespesa) == despesaModel, true);
    });

    test('toJson()', () {
      final despesaToJson = despesaModel.toJson();
      expect(despesaToJson['id'] == jsonDespesa['id'], true);
      expect(despesaToJson['tipoDespesa'] == jsonDespesa['tipoDespesa'], true);
      expect(
          despesaToJson['tipoDocumento'] == jsonDespesa['tipoDocumento'], true);
      expect(
          despesaToJson['dataDocumento'] == jsonDespesa['dataDocumento'], true);
      expect(despesaToJson['valorDocumento'] == jsonDespesa['valorDocumento'],
          true);
      expect(despesaToJson['nomeFornecedor'] == jsonDespesa['nomeFornecedor'],
          true);
      expect(
          despesaToJson['cnpjCpfFornecedor'] ==
              jsonDespesa['cnpjCpfFornecedor'],
          true);
    });
  });
}
