import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final jsonOrgao = {
    'id': '1',
    'nome': 'Teste',
    'sigla': 'T',
    'apelido': 'Teste',
    'tipoOrgao': 'Tipo'
  };

  final orgaoModel = OrgaoModel(
      id: '1', nome: 'Teste', sigla: 'T', apelido: 'Teste', tipoOrgao: 'Tipo');

  group('OrgaoModel tests', () {
    test('props', () {
      final orgao1 = OrgaoModel(
        id: '1',
      );
      final orgao11 = OrgaoModel(
        id: '1',
      );
      final orgao2 = OrgaoModel(
        id: '2',
      );

      expect(orgao1 == orgao11, true);
      expect(orgao1 == orgao2, false);
    });

    test('hashCode', () {
      final orgao1 = OrgaoModel(
        id: '1',
      );
      final orgao11 = OrgaoModel(
        id: '1',
      );
      final orgao2 = OrgaoModel(
        id: '2',
      );

      expect(orgao1.hashCode, orgao11.hashCode);
      expect(orgao1.hashCode == orgao2.hashCode, false);
    });

    test('toString()', () {
      final modelToString = OrgaoModel(id: '1').toString();
      final result =
          '''OrgaoModel{id: 1, apelido: null, nome: null, sigla: null, tipoOrgao: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(OrgaoModel.fromJson(jsonOrgao) == orgaoModel, true);
    });

    test('toJson()', () {
      final orgaoToJson = orgaoModel.toJson();
      expect(orgaoToJson['id'] == jsonOrgao['id'], true);
      expect(orgaoToJson['nome'] == jsonOrgao['nome'], true);
      expect(orgaoToJson['sigla'] == jsonOrgao['sigla'], true);
      expect(orgaoToJson['apelido'] == jsonOrgao['apelido'], true);
      expect(orgaoToJson['tipoOrgao'] == jsonOrgao['tipoOrgao'], true);
    });
  });
}
