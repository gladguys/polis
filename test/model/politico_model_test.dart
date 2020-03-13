import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/politico_model.dart';

void main() {
  final now = DateTime.now();

  final jsonPolitico = {
    'id': '1',
    'situacao': 'Situacao',
    'nome': 'Lula',
    'email': 'lulete@gmail.com',
    'dataNascimento': now.toIso8601String(),
    'emailGabinete': 'lulete@gmail.com',
    'escolaridade': 'Nada',
    'estado': 'PE',
    'municipioNascimento': 'Alagados',
    'nomeEleitoral': 'Lula',
    'partido': 'PT',
    'ufNascimento': 'PE',
    'urlFoto': 'photo'
  };

  final politicoModel = PoliticoModel(
      id: '1',
      situacao: 'Situacao',
      nome: 'Lula',
      email: 'lulete@gmail.com',
      sexo: 'M',
      dataNascimento: now,
      emailGabinete: 'lulete@gmail.com',
      escolaridade: 'Nada',
      estado: 'PE',
      municipioNascimento: 'Alagados',
      nomeEleitoral: 'Lula',
      partido: 'PT',
      ufNascimento: 'PE',
      urlFoto: 'photo');

  group('PoliticoModel tests', () {
    test('props', () {
      final politico1 = PoliticoModel(
        id: '1',
      );
      final politico11 = PoliticoModel(
        id: '1',
      );
      final politico2 = PoliticoModel(
        id: '2',
      );

      expect(politico1 == politico11, true);
      expect(politico1 == politico2, false);
    });

    test('toString()', () {
      final modelToString = PoliticoModel(id: '1').toString();
      final result =
          '''PoliticoModel{id: 1, nome: null, nomeEleitoral: null, email: null, emailGabinete: null, partido: null, urlFoto: null, estado: null, situacao: null, sexo: null, dataNascimento: null, ufNascimento: null, municipioNascimento: null, escolaridade: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(PoliticoModel.fromJson(jsonPolitico) == politicoModel, true);
    });

    test('toJson()', () {
      final politicoToJson = politicoModel.toJson();
      expect(politicoToJson['id'] == jsonPolitico['id'], true);
      expect(politicoToJson['situacao'] == jsonPolitico['situacao'], true);
      expect(politicoToJson['nome'] == jsonPolitico['nome'], true);
      expect(politicoToJson['email'] == jsonPolitico['email'], true);
      expect(politicoToJson['dataNascimento'] == jsonPolitico['dataNascimento'],
          true);
      expect(politicoToJson['emailGabinete'] == jsonPolitico['emailGabinete'],
          true);
      expect(
          politicoToJson['escolaridade'] == jsonPolitico['escolaridade'], true);
      expect(politicoToJson['estado'] == jsonPolitico['estado'], true);
      expect(
          politicoToJson['municipioNascimento'] ==
              jsonPolitico['municipioNascimento'],
          true);
      expect(politicoToJson['nomeEleitoral'] == jsonPolitico['nomeEleitoral'],
          true);
      expect(politicoToJson['partido'] == jsonPolitico['partido'], true);
      expect(
          politicoToJson['ufNascimento'] == jsonPolitico['ufNascimento'], true);
      expect(politicoToJson['urlFoto'] == jsonPolitico['urlFoto'], true);
    });
  });
}
