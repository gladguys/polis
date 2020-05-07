import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/models.dart';

void main() {
  final now = DateTime.now();

  final jsonPolitico = {
    'id': '1',
    'nomeCivil': 'nomeCivil',
    'siglaPartido': 'siglaPartido',
    'siglaUf': 'siglaUf',
    'urlFoto': 'urlFoto',
    'dataNascimento': now.toIso8601String(),
    'email': 'email',
    'nomeEleitoral': 'nomeEleitoral',
    'status': 'status',
    'condicaoEleitoral': 'condicaoEleitoral',
    'cpf': 'cpf',
    'sexo': 'sexo',
    'quantidadeSeguidores': 5,
    'escolaridade': 'escolaridade',
    'totalDespesas': 600.0,
    'totalProposicoes': 7,
  };

  final politicoModel = PoliticoModel(
    id: '1',
    nomeCivil: 'nomeCivil',
    siglaPartido: 'siglaPartido',
    siglaUf: 'siglaUf',
    urlFoto: 'urlFoto',
    dataNascimento: now,
    email: 'email',
    nomeEleitoral: 'nomeEleitoral',
    status: 'status',
    quantidadeSeguidores: 5,
    condicaoEleitoral: 'condicaoEleitoral',
    cpf: 'cpf',
    sexo: 'sexo',
    escolaridade: 'escolaridade',
    totalDespesas: 600.0,
    totalProposicoes: 7,
  );

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
          '''PoliticoModel{id: 1, nomeCivil: null, siglaPartido: null, siglaUf: null, urlFoto: null, email: null, nomeEleitoral: null, status: null, condicaoEleitoral: null, cpf: null, sexo: null, quantidadeSeguidores: null, dataNascimento: null, escolaridade: null, totalDespesas: null, totalProposicoes: null}''';
      expect(modelToString == result, true);
    });

    test('hashCode', () {
      final politico1 = PoliticoModel(
        id: '1',
      );
      final politico11 = PoliticoModel(
        id: '1',
      );
      final politico2 = PoliticoModel(
        id: '2',
      );

      expect(politico1.hashCode, politico11.hashCode);
      expect(politico1.hashCode == politico2.hashCode, false);
    });

    test('fromJson()', () {
      expect(PoliticoModel.fromJson(jsonPolitico) == politicoModel, true);
    });

    test('copyWith()', () {
      final politico = PoliticoModel(quantidadeSeguidores: 5);
      final politicoCopy = politico.copyWith(quantidadeSeguidores: 6);
      final politicoCopyOriginalQtd = politico.copyWith(id: '1');
      expect(politico, politicoCopy);
      expect(politicoCopy.quantidadeSeguidores, 6);
      expect(politicoCopyOriginalQtd.quantidadeSeguidores, 5);
    });

    test('toJson()', () {
      final politicoToJson = politicoModel.toJson();
      expect(politicoToJson['id'] == jsonPolitico['id'], true);
      expect(politicoToJson['nomeCivil'] == jsonPolitico['nomeCivil'], true);
      expect(
          politicoToJson['siglaPartido'] == jsonPolitico['siglaPartido'], true);
      expect(politicoToJson['siglaUf'] == jsonPolitico['siglaUf'], true);
      expect(politicoToJson['dataNascimento'] == jsonPolitico['dataNascimento'],
          true);
      expect(politicoToJson['urlFoto'] == jsonPolitico['urlFoto'], true);
      expect(politicoToJson['email'] == jsonPolitico['email'], true);
      expect(politicoToJson['nomeEleitoral'] == jsonPolitico['nomeEleitoral'],
          true);
      expect(politicoToJson['status'] == jsonPolitico['status'], true);
      expect(
          politicoToJson['quantidadeSeguidores'] ==
              jsonPolitico['quantidadeSeguidores'],
          true);
      expect(
          politicoToJson['condicaoEleitoral'] ==
              jsonPolitico['condicaoEleitoral'],
          true);
      expect(politicoToJson['cpf'] == jsonPolitico['cpf'], true);
      expect(politicoToJson['sexo'] == jsonPolitico['sexo'], true);
      expect(
          politicoToJson['escolaridade'] == jsonPolitico['escolaridade'], true);
      expect(politicoToJson['totalDespesas'] == jsonPolitico['totalDespesas'],
          true);
      expect(
          politicoToJson['totalProposicoes'] ==
              jsonPolitico['totalProposicoes'],
          true);
    });
  });
}
