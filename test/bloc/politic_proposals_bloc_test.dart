import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticProposalsBloc tests', () {
    PoliticProposalsBloc politicProposalsBloc;
    MockPoliticProposalsRepository mockPoliticProposalsRepository;

    setUp(() {
      mockPoliticProposalsRepository = MockPoliticProposalsRepository();
      politicProposalsBloc = PoliticProposalsBloc(
        repository: mockPoliticProposalsRepository,
      );
    });

    tearDown(() {
      politicProposalsBloc?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticProposalsBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticProposalsState to be the initial state', () {
      expect(
          politicProposalsBloc.state, equals(InitialPoliticProposalsState()));
    });

    group('GetPoliticProposals event', () {
      blocTest(
        '''Expects [LoadingPoliticProposals, GetPoliticProposalsSuccess] when success''',
        build: () async {
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
          return politicProposalsBloc;
        },
        act: (politicProposalsBloc) {
          politicProposalsBloc.add(GetPoliticProposals('1'));
          return;
        },
        verify: (politicProposalsBloc) async {
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
        build: () async {
          when(mockPoliticProposalsRepository.getPoliticProposals('1'))
              .thenThrow(Exception());
          return politicProposalsBloc;
        },
        act: (politicProposalsBloc) {
          politicProposalsBloc.add(GetPoliticProposals('1'));
          return;
        },
        verify: (politicProposalsBloc) async {
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
