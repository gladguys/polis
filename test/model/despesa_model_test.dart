import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/models.dart';

void main() {
  final jsonDespesa = {
    'ano': '2020',
    'mes': '3',
    'cnpjCpfFornecedor': '11111',
    'codDocumento': '1',
    'codLote': '1',
    'codTipoDocumento': '1',
    'dataDocumento': '2020-06-18',
    'idPolitico': '2214',
    'nomeFornecedor': 'fornecedor',
    'nomePolitico': 'politico',
    'fotoPolitico': 'foto',
    'numDocumento': '1',
    'numRessarcimento': '0',
    'parcela': '1',
    'siglaPartido': 'PT',
    'tipoAtividade': 'DESPESA',
    'tipoDespesa': 'tipo',
    'tipoDocumento': 'doc',
    'urlDocumento': 'url',
    'valorDocumento': '129.85',
    'valorGlosa': '0',
    'valorLiquido': '129.85',
  };

  final despesaModel = DespesaModel(
    ano: '2020',
    mes: '3',
    cnpjCpfFornecedor: '11111',
    codDocumento: '1',
    codLote: '1',
    codTipoDocumento: '1',
    dataDocumento: '2020-06-18',
    idPolitico: '2214',
    fotoPolitico: 'foto',
    nomeFornecedor: 'fornecedor',
    nomePolitico: 'politico',
    numDocumento: '1',
    numRessarcimento: '0',
    parcela: '1',
    siglaPartido: 'PT',
    tipoAtividade: 'DESPESA',
    tipoDespesa: 'tipo',
    tipoDocumento: 'doc',
    urlDocumento: 'url',
    valorDocumento: '129.85',
    valorGlosa: '0',
    valorLiquido: '129.85',
  );

  group('DespesaModel tests', () {
    test('props', () {
      final despesa1 = DespesaModel(
        codDocumento: '1',
      );
      final despesa11 = DespesaModel(
        codDocumento: '1',
      );
      final despesa2 = DespesaModel(
        codDocumento: '2',
      );

      expect(despesa1 == despesa11, true);
      expect(despesa1 == despesa2, false);
    });

    test('toString()', () {
      final modelToString = DespesaModel(codDocumento: '1').toString();
      final result =
          '''DespesaModel{ano: null, mes: null, cnpjCpfFornecedor: null, codDocumento: 1, codLote: null, codTipoDocumento: null, fotoPolitico: null, dataDocumento: null, idPolitico: null, nomeFornecedor: null, nomePolitico: null, numDocumento: null, numRessarcimento: null, parcela: null, siglaPartido: null, tipoAtividade: null, tipoDespesa: null, tipoDocumento: null, urlDocumento: null, valorDocumento: null, valorGlosa: null, valorLiquido: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(DespesaModel.fromJson(jsonDespesa) == despesaModel, true);
    });

    test('toJson()', () {
      final despesaToJson = despesaModel.toJson();
      expect(despesaToJson['ano'] == jsonDespesa['ano'], true);
      expect(despesaToJson['mes'] == jsonDespesa['mes'], true);
      expect(despesaToJson['foto'] == jsonDespesa['foto'], true);
      expect(
          despesaToJson['cnpjCpfFornecedor'] ==
              jsonDespesa['cnpjCpfFornecedor'],
          true);
      expect(
          despesaToJson['codDocumento'] == jsonDespesa['codDocumento'], true);
      expect(despesaToJson['codLote'] == jsonDespesa['codLote'], true);
      expect(
          despesaToJson['codTipoDocumento'] == jsonDespesa['codTipoDocumento'],
          true);
      expect(
          despesaToJson['dataDocumento'] == jsonDespesa['dataDocumento'], true);
      expect(despesaToJson['idPolitico'] == jsonDespesa['idPolitico'], true);
      expect(despesaToJson['nomeFornecedor'] == jsonDespesa['nomeFornecedor'],
          true);
      expect(
          despesaToJson['nomePolitico'] == jsonDespesa['nomePolitico'], true);
      expect(
          despesaToJson['numDocumento'] == jsonDespesa['numDocumento'], true);
      expect(
          despesaToJson['numRessarcimento'] == jsonDespesa['numRessarcimento'],
          true);
      expect(despesaToJson['parcela'] == jsonDespesa['parcela'], true);
      expect(
          despesaToJson['siglaPartido'] == jsonDespesa['siglaPartido'], true);
      expect(
          despesaToJson['tipoAtividade'] == jsonDespesa['tipoAtividade'], true);
      expect(despesaToJson['tipoDespesa'] == jsonDespesa['tipoDespesa'], true);
      expect(
          despesaToJson['tipoDocumento'] == jsonDespesa['tipoDocumento'], true);
      expect(
          despesaToJson['urlDocumento'] == jsonDespesa['urlDocumento'], true);
      expect(despesaToJson['valorDocumento'] == jsonDespesa['valorDocumento'],
          true);
      expect(despesaToJson['valorGlosa'] == jsonDespesa['valorGlosa'], true);
      expect(
          despesaToJson['valorLiquido'] == jsonDespesa['valorLiquido'], true);
    });
  });
}
