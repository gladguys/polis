import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';

import '../mock.dart';

void main() {
  group('PoliticExpensesBloc tests', () {
    PoliticExpensesCubit politicExpensesCubit;
    MockPoliticExpensesRepository mockPoliticExpensesRepository;

    setUp(() {
      mockPoliticExpensesRepository = MockPoliticExpensesRepository();
      politicExpensesCubit = PoliticExpensesCubit(
        repository: mockPoliticExpensesRepository,
      );
    });

    tearDown(() {
      politicExpensesCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticExpensesCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticExpensesState to be the initial state', () {
      expect(politicExpensesCubit.state, equals(InitialPoliticExpensesState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingPoliticExpenses, GetPoliticExpensesSuccess] when success''',
        build: () {
          when(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .thenAnswer((_) => Future.value([]));
          return politicExpensesCubit;
        },
        act: (politicExpensesCubit) {
          politicExpensesCubit.getPoliticExpenses('1');
          return;
        },
        verify: (politicExpensesCubit) async {
          verify(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticExpenses(),
          GetPoliticExpensesSuccess([]),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticExpenses, GetPoliticExpensesFailed] when fails''',
        build: () {
          when(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .thenThrow(Exception());
          return politicExpensesCubit;
        },
        act: (politicExpensesCubit) {
          politicExpensesCubit.getPoliticExpenses('1');
          return;
        },
        verify: (politicExpensesCubit) async {
          verify(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticExpenses(),
          GetPoliticExpensesFailed(),
        ],
      );
    });
  });
}
