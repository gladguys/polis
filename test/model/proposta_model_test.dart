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
          '''PropostaModel{id: 1, siglaTipo: null, descricaoTipo: null, numero: null, ano: null, ementa: null, dataApresentacao: null, status: null}''';
      expect(modelToString == result, true);
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
