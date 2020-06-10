import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final jsonResultadoRanking = {
    'nomePoliticoUltimo': 'nomePoliticoUltimo',
    'fotoPoliticoUltimo': 'fotoPoliticoUltimo',
    'partidoPoliticoUltimo': 'partidoPoliticoUltimo',
    'estadoPoliticoUltimo': 'estadoPoliticoUltimo',
    'logoPartidoPoliticoUltimo': 'logoPartidoPoliticoUltimo',
    'despesaPoliticoUltimo': 1334556.54,
    'despesaMedia': 678245.52,
    'nomesPoliticoPrimeiro': [
      'nome1',
      'nome2',
    ],
    'fotosPoliticoPrimeiro': [
      'foto1',
      'foto2',
    ],
    'partidosPoliticoPrimeiro': [
      'partido1',
      'partido2',
    ],
    'estadosPoliticoPrimeiro': [
      'estado1',
      'estado2',
    ],
    'logosPartidoPoliticoPrimeiro': [
      'logo1',
      'logo2',
    ],
    'despesasPoliticoPrimeiro': [
      0.0,
      0.0,
    ],
  };

  final resultadoRankingModel = ResultadosRankingModel(
    nomePoliticoUltimo: 'nomePoliticoUltimo',
    partidoPoliticoUltimo: 'partidoPoliticoUltimo',
    logoPartidoPoliticoUltimo: 'logoPartidoPoliticoUltimo',
    fotoPoliticoUltimo: 'fotoPoliticoUltimo',
    estadoPoliticoUltimo: 'estadoPoliticoUltimo',
    despesaPoliticoUltimo: 1334556.54,
    despesaMedia: 678245.52,
    nomesPoliticoPrimeiro: [
      'nome1',
      'nome2',
    ],
    logosPartidoPoliticoPrimeiro: [
      'logo1',
      'logo2',
    ],
    fotosPoliticoPrimeiro: [
      'foto1',
      'foto2',
    ],
    estadosPoliticoPrimeiro: [
      'estado1',
      'estado2',
    ],
    despesasPoliticoPrimeiro: [
      0.0,
      0.0,
    ],
    partidosPoliticoPrimeiro: [
      'partido1',
      'partido2',
    ],
  );

  group('ResultadosRankingModel tests', () {
    test('ResultadosRankingModel props', () {
      final resultado1 = ResultadosRankingModel();
      final resultado2 = ResultadosRankingModel();

      expect(resultado1 == resultado2, true);
    });

    test('toString()', () {
      final modelToString = ResultadosRankingModel().toString();
      final result =
          '''ResultadosRankingModel{nomePoliticoUltimo: null, fotoPoliticoUltimo: null, partidoPoliticoUltimo: null, estadoPoliticoUltimo: null, logoPartidoPoliticoUltimo: null, despesaPoliticoUltimo: null, despesaMedia: null, nomesPoliticoPrimeiro: null, fotosPoliticoPrimeiro: null, partidosPoliticoPrimeiro: null, estadosPoliticoPrimeiro: null, logosPartidoPoliticoPrimeiro: null, despesasPoliticoPrimeiro: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(
          ResultadosRankingModel.fromJson(jsonResultadoRanking) ==
              resultadoRankingModel,
          true);
    });

    test('toJson()', () {
      final resultadoToJson = resultadoRankingModel.toJson();
      expect(
          resultadoToJson['nomePoliticoUltimo'] ==
              jsonResultadoRanking['nomePoliticoUltimo'],
          true);
      expect(
          resultadoToJson['fotoPoliticoUltimo'] ==
              jsonResultadoRanking['fotoPoliticoUltimo'],
          true);
      expect(
          resultadoToJson['partidoPoliticoUltimo'] ==
              jsonResultadoRanking['partidoPoliticoUltimo'],
          true);
      expect(
          resultadoToJson['estadoPoliticoUltimo'] ==
              jsonResultadoRanking['estadoPoliticoUltimo'],
          true);
      expect(
          resultadoToJson['logoPartidoPoliticoUltimo'] ==
              jsonResultadoRanking['logoPartidoPoliticoUltimo'],
          true);
      expect(
          resultadoToJson['despesaPoliticoUltimo'] ==
              jsonResultadoRanking['despesaPoliticoUltimo'],
          true);
      expect(
          resultadoToJson['despesaMedia'] ==
              jsonResultadoRanking['despesaMedia'],
          true);
    });
  });
}
