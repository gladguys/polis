import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/models.dart';

void main() {
  final jsonProposta = {
    'id': '1',
    'status': 'Pendente',
    'ano': '1912',
    'dataApresentacao': 'data',
    'descricaoTipo': 'Tipo',
    'siglaTipo': 'T',
    'ementa': 'lalalala',
    'numero': '12',
  };

  final propostaModel = PropostaModel(
    id: '1',
    status: 'Pendente',
    ano: '1912',
    dataApresentacao: 'data',
    descricaoTipo: 'Tipo',
    siglaTipo: 'T',
    ementa: 'lalalala',
    numero: '12',
  );

  group('PropostaModel tests', () {
    test('PropostaModel props', () {
      final proposta1 = PropostaModel(
        id: '1',
      );
      final proposta11 = PropostaModel(
        id: '1',
      );
      final proposta2 = PropostaModel(
        id: '2',
      );

      expect(proposta1 == proposta11, true);
      expect(proposta1 == proposta2, false);
    });

    test('toString()', () {
      final modelToString = PropostaModel(id: '1').toString();
      final result =
          '''PropostaModel{id: 1, siglaTipo: null, descricaoTipo: null, numero: null, ano: null, ementa: null, nomePolitico: null, fotoPolitico: null, estadoPolitico: null, siglaPartido: null, dataDocumento: null, tipoDocumento: null, descricaoSituacao: null, descricaoTramitacao: null, dataApresentacao: null, status: null, favorito: null}''';
      expect(modelToString == result, true);
    });

    test('copyWith()', () {
      final proposta = PropostaModel(id: '1');
      final propostaOriginal = proposta.copyWith(nomePolitico: 'nome');
      final propostaCopy = proposta.copyWith(id: '2');
      expect(proposta, propostaOriginal);
      expect(proposta == propostaCopy, false);
    });

    test('fromJson()', () {
      expect(PropostaModel.fromJson(jsonProposta) == propostaModel, true);
    });

    test('toJson()', () {
      final propostaToJson = propostaModel.toJson();
      expect(propostaToJson['id'] == jsonProposta['id'], true);
      expect(propostaToJson['siglaTipo'] == jsonProposta['siglaTipo'], true);
      expect(propostaToJson['descricaoTipo'] == jsonProposta['descricaoTipo'],
          true);
      expect(propostaToJson['numero'] == jsonProposta['numero'], true);
      expect(propostaToJson['ano'] == jsonProposta['ano'], true);
      expect(propostaToJson['ementa'] == jsonProposta['ementa'], true);
      expect(
          propostaToJson['dataApresentacao'] ==
              jsonProposta['dataApresentacao'],
          true);
      expect(propostaToJson['status'] == jsonProposta['status'], true);
    });
  });
}
