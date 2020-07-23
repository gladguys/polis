import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticProposalsBloc tests', () {
    PoliticProposalsCubit politicProposalsCubit;
    MockPoliticProposalsRepository mockPoliticProposalsRepository;

    setUp(() {
      mockPoliticProposalsRepository = MockPoliticProposalsRepository();
      politicProposalsCubit = PoliticProposalsCubit(
        repository: mockPoliticProposalsRepository,
      );
    });

    tearDown(() {
      politicProposalsCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticProposalsCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticProposalsState to be the initial state', () {
      expect(
          politicProposalsCubit.state, equals(InitialPoliticProposalsState()));
    });

    group('GetPoliticProposals event', () {
      blocTest(
        '''Expects [LoadingPoliticProposals, GetPoliticProposalsSuccess] when success''',
        build: () {
          when(mockPoliticProposalsRepository.getPoliticProposals('1'))
              .thenAnswer(
            (_) => Future.value([
              PropostaModel(
                id: '1',
              ),
              PropostaModel(
                id: '2',
              ),
            ]),
          );
          return politicProposalsCubit;
        },
        act: (politicProposalsCubit) {
          politicProposalsCubit.getPoliticProposals('1');
          return;
        },
        verify: (politicProposalsCubit) async {
          verify(mockPoliticProposalsRepository.getPoliticProposals('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticProposals(),
          GetPoliticProposalsSuccess(proposals: [
            PropostaModel(
              id: '1',
            ),
            PropostaModel(
              id: '2',
            ),
          ]),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticProposals, GetPoliticProposalsFailed] when fails''',
        build: () {
          when(mockPoliticProposalsRepository.getPoliticProposals('1'))
              .thenThrow(Exception());
          return politicProposalsCubit;
        },
        act: (politicProposalsCubit) {
          politicProposalsCubit.getPoliticProposals('1');
          return;
        },
        verify: (politicProposalsCubit) async {
          verify(mockPoliticProposalsRepository.getPoliticProposals('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticProposals(),
          GetPoliticProposalsFailed(),
        ],
      );
    });
  });
}
