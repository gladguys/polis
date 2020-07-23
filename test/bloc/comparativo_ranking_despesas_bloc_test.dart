import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticFollowersBloc tests', () {
    ComparativoRankingDespesasCubit comparativoRankingDespesasCubit;
    MockComparativoRankingDespesasRepository
        mockComparativoRankingDespesasRepository;

    setUp(() {
      mockComparativoRankingDespesasRepository =
          MockComparativoRankingDespesasRepository();
      comparativoRankingDespesasCubit = ComparativoRankingDespesasCubit(
        repository: mockComparativoRankingDespesasRepository,
      );
    });

    tearDown(() {
      comparativoRankingDespesasCubit?.close();
    });

    test('asserts', () {
      expect(
          () => ComparativoRankingDespesasCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticFollowersState to be the initial state', () {
      expect(comparativoRankingDespesasCubit.state,
          equals(InitialComparativoRankingDespesasState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingResultadosRanking, GetRankingResultadosSuccess] when success''',
        build: () {
          when(mockComparativoRankingDespesasRepository.getRankingResults())
              .thenAnswer((_) => Future.value(ResultadosRankingModel()));
          return comparativoRankingDespesasCubit;
        },
        act: (comparativoRankingDespesasBloc) {
          comparativoRankingDespesasBloc.getRankingResultados();
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
          return comparativoRankingDespesasCubit;
        },
        act: (comparativoRankingDespesasBloc) {
          comparativoRankingDespesasBloc.getRankingResultados();
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
