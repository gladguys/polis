import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('PoliticFollowersBloc tests', () {
    PoliticFollowersBloc politicFollowersBloc;
    MockPoliticFollowersRepository mockPoliticFollowersRepository;

    setUp(() {
      mockPoliticFollowersRepository = MockPoliticFollowersRepository();
      politicFollowersBloc = PoliticFollowersBloc(
        repository: mockPoliticFollowersRepository,
      );
    });

    test('asserts', () {
      expect(
          () => PoliticFollowersBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticFollowersState to be the initial state', () {
      expect(
          politicFollowersBloc.state, equals(InitialPoliticFollowersState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingPoliticFollowers, GetPoliticFollowersSuccess] when success''',
        build: () async {
          when(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .thenAnswer((_) => Future.value([]));
          return politicFollowersBloc;
        },
        act: (politicSuggestionBloc) {
          politicSuggestionBloc.add(GetPoliticFollowers('1'));
          return;
        },
        verify: (politicSuggestionBloc) async {
          verify(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticFollowers(),
          GetPoliticFollowersSuccess(followers: []),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticFollowers, GetPoliticFollowersFailed] when fails''',
        build: () async {
          when(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .thenThrow(Exception());
          return politicFollowersBloc;
        },
        act: (politicFollowersBloc) {
          politicFollowersBloc.add(GetPoliticFollowers('1'));
          return;
        },
        verify: (politicFollowersBloc) async {
          verify(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .called(1);
        },
        expect: [
          LoadingPoliticFollowers(),
          GetPoliticFollowersFailed(),
        ],
      );
    });
  });
}
