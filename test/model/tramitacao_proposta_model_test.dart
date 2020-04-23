import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/models.dart';

void main() {
  final jsonTramitacaoProposta = {
    'ambito': 'ambito',
    'dataHora': 'dataHora',
    'descricaoSituacao': 'descricaoSituacao',
    'descricaoTramitacao': 'descricaoTramitacao',
    'despacho': 'despacho',
    'regime': 'regime',
    'sequencia': 'sequencia',
    'siglaOrgao': 'siglaOrgao',
  };

  final tramitacaoPropostaModel = TramitacaoPropostaModel(
    ambito: 'ambito',
    sequencia: 'sequencia',
    descricaoTramitacao: 'descricaoTramitacao',
    dataHora: 'dataHora',
    descricaoSituacao: 'descricaoSituacao',
    despacho: 'despacho',
    regime: 'regime',
    siglaOrgao: 'siglaOrgao',
  );

  group('TramitacaoPropostaModel tests', () {
    test('props', () {
      final proposta1 = TramitacaoPropostaModel(
        sequencia: '1',
      );
      final proposta11 = TramitacaoPropostaModel(
        sequencia: '1',
      );
      final proposta2 = TramitacaoPropostaModel(
        sequencia: '2',
      );

      expect(proposta1 == proposta11, true);
      expect(proposta1 == proposta2, false);
    });

    test('toString()', () {
      final modelToString = TramitacaoPropostaModel(sequencia: '1').toString();
      final result =
          '''TramitacaoPropostaModel{ambito: null, dataHora: null, descricaoSituacao: null, descricaoTramitacao: null, despacho: null, regime: null, sequencia: 1, siglaOrgao: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(
          TramitacaoPropostaModel.fromJson(jsonTramitacaoProposta) ==
              tramitacaoPropostaModel,
          true);
    });

    test('toJson()', () {
      final tramitacaoPropostaToJson = tramitacaoPropostaModel.toJson();
      expect(
          tramitacaoPropostaToJson['ambito'] ==
              jsonTramitacaoProposta['ambito'],
          true);
      expect(
          tramitacaoPropostaToJson['sequencia'] ==
              jsonTramitacaoProposta['sequencia'],
          true);
      expect(
          tramitacaoPropostaToJson['descricaoTramitacao'] ==
              jsonTramitacaoProposta['descricaoTramitacao'],
          true);
      expect(
          tramitacaoPropostaToJson['dataHora'] ==
              jsonTramitacaoProposta['dataHora'],
          true);
      expect(
          tramitacaoPropostaToJson['descricaoSituacao'] ==
              jsonTramitacaoProposta['descricaoSituacao'],
          true);
      expect(
          tramitacaoPropostaToJson['despacho'] ==
              jsonTramitacaoProposta['despacho'],
          true);
      expect(
          tramitacaoPropostaToJson['regime'] ==
              jsonTramitacaoProposta['regime'],
          true);
      expect(
          tramitacaoPropostaToJson['siglaOrgao'] ==
              jsonTramitacaoProposta['siglaOrgao'],
          true);
    });
  });
}
