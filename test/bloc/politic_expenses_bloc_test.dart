import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('PoliticExpensesBloc tests', () {
    PoliticExpensesBloc politicExpensesBloc;
    MockPoliticExpensesRepository mockPoliticExpensesRepository;

    setUp(() {
      mockPoliticExpensesRepository = MockPoliticExpensesRepository();
      politicExpensesBloc = PoliticExpensesBloc(
        repository: mockPoliticExpensesRepository,
      );
    });

    tearDown(() {
      politicExpensesBloc?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticExpensesBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticExpensesState to be the initial state', () {
      expect(politicExpensesBloc.state, equals(InitialPoliticExpensesState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingPoliticExpenses, GetPoliticExpensesSuccess] when success''',
        build: () async {
          when(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .thenAnswer((_) => Future.value([]));
          return politicExpensesBloc;
        },
        act: (politicExpensesBloc) {
          politicExpensesBloc.add(GetPoliticExpenses('1'));
          return;
        },
        verify: (politicExpensesBloc) async {
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
        build: () async {
          when(mockPoliticExpensesRepository.getPoliticExpenses('1'))
              .thenThrow(Exception());
          return politicExpensesBloc;
        },
        act: (politicExpensesBloc) {
          politicExpensesBloc.add(GetPoliticExpenses('1'));
          return;
        },
        verify: (politicExpensesBloc) async {
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
