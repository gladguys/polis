import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticFollowersBloc tests', () {
    ComparativoRankingDespesasBloc comparativoRankingDespesasBloc;
    MockComparativoRankingDespesasRepository
        mockComparativoRankingDespesasRepository;

    setUp(() {
      mockComparativoRankingDespesasRepository =
          MockComparativoRankingDespesasRepository();
      comparativoRankingDespesasBloc = ComparativoRankingDespesasBloc(
        repository: mockComparativoRankingDespesasRepository,
      );
    });

    tearDown(() {
      comparativoRankingDespesasBloc?.close();
    });

    test('asserts', () {
      expect(
          () => ComparativoRankingDespesasBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticFollowersState to be the initial state', () {
      expect(comparativoRankingDespesasBloc.state,
          equals(InitialComparativoRankingDespesasState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingResultadosRanking, GetRankingResultadosSuccess] when success''',
        build: () {
          when(mockComparativoRankingDespesasRepository.getRankingResults())
              .thenAnswer((_) => Future.value(ResultadosRankingModel()));
          return comparativoRankingDespesasBloc;
        },
        act: (comparativoRankingDespesasBloc) {
          comparativoRankingDespesasBloc.add(GetRankingResultados());
          return;
        },
        verify: (comparativoRankingDespesasBloc) async {
          verify(mockComparativoRankingDespesasRepository.getRankingResults())
              .called(1);
        },
        expect: [
          LoadingResultadosRanking(),
          GetRankingResultadosSuccess(ResultadosRankingModel()),
        ],
      );

      blocTest(
        '''Expects [LoadingResultadosRanking, GetRankingResultadosFailed] when fails''',
        build: () {
          when(mockComparativoRankingDespesasRepository.getRankingResults())
              .thenThrow(Exception());
          return comparativoRankingDespesasBloc;
        },
        act: (comparativoRankingDespesasBloc) {
          comparativoRankingDespesasBloc.add(GetRankingResultados());
          return;
        },
        verify: (comparativoRankingDespesasBloc) async {
          verify(mockComparativoRankingDespesasRepository.getRankingResults())
              .called(1);
        },
        expect: [
          LoadingResultadosRanking(),
          GetRankingResultadosFailed(),
        ],
      );
    });
  });
}
