import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/enum/acao_type.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final now = DateTime.now();

  final jsonAcao = {
    'idPolitico': '1',
    'nomePolitico': 'Joao',
    'data': Timestamp.fromDate(now),
    'mensagem': 'mensagem',
    'tipo': 'SEGUIR',
    'urlFotoPolitico': 'foto',
  };

  final acaoUsuarioModel = AcaoUsuarioModel(
    idPolitico: '1',
    nomePolitico: 'Joao',
    data: now,
    mensagem: 'mensagem',
    tipo: AcaoType.follow,
    urlFotoPolitico: 'foto',
  );

  group('AcaoUsuarioModel tests', () {
    test('props', () {
      final acao1 = AcaoUsuarioModel(
        idPolitico: '1',
        mensagem: 'mensagem',
      );
      final acao11 = AcaoUsuarioModel(
        idPolitico: '1',
        mensagem: 'mensagem',
      );
      final acao2 = AcaoUsuarioModel(
        idPolitico: '1',
        mensagem: 'mensagem2',
      );

      expect(acao1 == acao11, true);
      expect(acao1 == acao2, false);
    });

    test('toString()', () {
      final modelToString = AcaoUsuarioModel(idPolitico: '1').toString();
      final result =
          '''AcaoUsuarioModel{idPolitico: 1, nomePolitico: null, mensagem: null, sexoPolitico: null, idPost: null, tipo: null, tipoPost: null, urlFotoPolitico: null, data: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(AcaoUsuarioModel.fromJson(jsonAcao) == acaoUsuarioModel, true);
    });

    test('toJson()', () {
      final acaoToJson = acaoUsuarioModel.toJson();
      expect(acaoToJson['idPolitico'] == jsonAcao['idPolitico'], true);
      expect(acaoToJson['nomePolitico'] == jsonAcao['nomePolitico'], true);
      expect(acaoToJson['data'] == jsonAcao['data'], true);
      expect(acaoToJson['mensagem'] == jsonAcao['mensagem'], true);
      expect(acaoToJson['tipo'] == jsonAcao['tipo'], true);
      expect(
          acaoToJson['urlFotoPolitico'] == jsonAcao['urlFotoPolitico'], true);
    });
  });
}
