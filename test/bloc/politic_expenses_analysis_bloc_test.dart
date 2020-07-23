import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/dto/despesa_mensal.dart';
import 'package:polis/core/domain/dto/despesa_por_tipo.dart';
import 'package:polis/core/domain/dto/total_despesas_anuais.dart';

import '../mock.dart';

void main() {
  group('PoliticExpensesAnalysisBloc tests', () {
    PoliticExpensesAnalysisCubit politicExpensesAnalysisCubit;
    MockPoliticExpensesAnalysisRepository mockPoliticExpensesAnalysisRepository;
    MockPoliticExpensesByTypeAnalysisRepository
        mockPoliticExpensesByTypeAnalysisRepository;
    MockPoliticExpensesAnalysisQuotaRepository
        mockPoliticExpensesAnalysisQuotaRepository;
    MockPoliticExpensesAnalysisConfigRepository
        mockPoliticExpensesAnalysisConfigRepository;

    setUp(() {
      mockPoliticExpensesAnalysisQuotaRepository =
          MockPoliticExpensesAnalysisQuotaRepository();
      mockPoliticExpensesByTypeAnalysisRepository =
          MockPoliticExpensesByTypeAnalysisRepository();
      mockPoliticExpensesAnalysisRepository =
          MockPoliticExpensesAnalysisRepository();
      mockPoliticExpensesAnalysisConfigRepository =
          MockPoliticExpensesAnalysisConfigRepository();
      politicExpensesAnalysisCubit = PoliticExpensesAnalysisCubit(
        politicoId: '1',
        politicoUf: 'CE',
        politicExpensesAnalysisRepository:
            mockPoliticExpensesAnalysisRepository,
        politicExpensesByTypeAnalysisRepository:
            mockPoliticExpensesByTypeAnalysisRepository,
        politicExpensesAnalysisQuotaRepository:
            mockPoliticExpensesAnalysisQuotaRepository,
        politicExpensesAnalysisConfigRepository:
            mockPoliticExpensesAnalysisConfigRepository,
      );
    });

    tearDown(() {
      politicExpensesAnalysisCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: null,
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: '1',
                politicoUf: null,
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: '1',
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository: null,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: '1',
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository: null,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: '1',
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository: null,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: '1',
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository: null,
              ),
          throwsAssertionError);
      expect(
          () => PoliticExpensesAnalysisCubit(
                politicoId: null,
                politicoUf: 'CE',
                politicExpensesAnalysisConfigRepository:
                    mockPoliticExpensesAnalysisConfigRepository,
                politicExpensesAnalysisQuotaRepository:
                    mockPoliticExpensesAnalysisQuotaRepository,
                politicExpensesByTypeAnalysisRepository:
                    mockPoliticExpensesByTypeAnalysisRepository,
                politicExpensesAnalysisRepository:
                    mockPoliticExpensesAnalysisRepository,
              ),
          throwsAssertionError);
    });

    test('Expects PoliticExpensesAnalysisInitial to be the initial state', () {
      expect(politicExpensesAnalysisCubit.state,
          equals(PoliticExpensesAnalysisInitial()));
    });

    group('GetInitialInfo event', () {
      blocTest(
        '''Expects [LoadingPoliticExpensesData, LoadingPoliticExpensesData, GetPoliticExpensesDataSuccess] when success''',
        build: () {
          when(mockPoliticExpensesAnalysisQuotaRepository
                  .getMaxQuotaForStateUf('CE'))
              .thenAnswer((_) => Future.value(1000));
          when(mockPoliticExpensesAnalysisConfigRepository
                  .getExpensesBeginYear())
              .thenAnswer((_) => Future.value(2020));
          when(mockPoliticExpensesByTypeAnalysisRepository
                  .getYearExpensesByType(politicoId: '1', ano: '2020'))
              .thenAnswer(
            (_) => Future.value(
              [
                DespesaPorTipo(valor: '100', percentual: '10', tipoCota: 'A'),
                DespesaPorTipo(valor: '200', percentual: '20', tipoCota: 'B'),
              ],
            ),
          );
          when(mockPoliticExpensesAnalysisRepository.getYearExpensesData(
                  politicoId: '1', ano: '2020'))
              .thenAnswer(
            (_) => Future.value(
              TotalDespesasAnuais(
                ano: '2020',
                despesasPorMes: [
                  DespesaMensal(mes: '1', valor: 10),
                  DespesaMensal(mes: '2', valor: 20),
                  DespesaMensal(mes: '3', valor: 30),
                ],
              ),
            ),
          );
          return politicExpensesAnalysisCubit;
        },
        act: (politicExpensesAnalysisCubit) {
          politicExpensesAnalysisCubit.getInitialInfo(year: 2020);
          politicExpensesAnalysisCubit.getPoliticExpensesDataForYear(
              year: 2020);
          return;
        },
        expect: [
          LoadingPoliticExpensesData(),
          GetPoliticExpensesDataSuccess(
            year: 2020,
            despesasPorTipo: [
              DespesaPorTipo(valor: '100', percentual: '10', tipoCota: 'A'),
              DespesaPorTipo(valor: '200', percentual: '20', tipoCota: 'B'),
            ],
            totalDespesasAnuais: TotalDespesasAnuais(
              ano: '2020',
              despesasPorMes: [
                DespesaMensal(mes: '1', valor: 10),
                DespesaMensal(mes: '2', valor: 20),
                DespesaMensal(mes: '3', valor: 30),
              ],
            ),
          ),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticExpensesData, GetPoliticExpensesDataFailed''',
        build: () {
          when(mockPoliticExpensesAnalysisQuotaRepository
                  .getMaxQuotaForStateUf('CE'))
              .thenThrow(Exception());
          return politicExpensesAnalysisCubit;
        },
        act: (politicExpensesAnalysisCubit) {
          politicExpensesAnalysisCubit.getInitialInfo(year: 2020);
          return;
        },
        expect: [
          LoadingPoliticExpensesData(),
          GetPoliticExpensesDataFailed(),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticExpensesData, GetPoliticExpensesDataFailed] when failed getYearExpensesByType''',
        build: () {
          when(mockPoliticExpensesAnalysisQuotaRepository
                  .getMaxQuotaForStateUf('CE'))
              .thenAnswer((_) => Future.value(1000));
          when(mockPoliticExpensesAnalysisConfigRepository
                  .getExpensesBeginYear())
              .thenAnswer((_) => Future.value(2020));
          when(mockPoliticExpensesByTypeAnalysisRepository
                  .getYearExpensesByType(politicoId: '1', ano: '2020'))
              .thenThrow(Exception());
          return politicExpensesAnalysisCubit;
        },
        act: (politicExpensesAnalysisCubit) {
          politicExpensesAnalysisCubit.getInitialInfo(year: 2020);
          politicExpensesAnalysisCubit.getPoliticExpensesDataForYear(
              year: 2020);
          return;
        },
        expect: [
          LoadingPoliticExpensesData(),
          GetPoliticExpensesDataFailed(),
        ],
      );
    });
  });
}
