import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';

import '../mock.dart';

void main() {
  group('PoliticFollowersBloc tests', () {
    PoliticFollowersCubit politicFollowersCubit;
    MockPoliticFollowersRepository mockPoliticFollowersRepository;

    setUp(() {
      mockPoliticFollowersRepository = MockPoliticFollowersRepository();
      politicFollowersCubit = PoliticFollowersCubit(
        repository: mockPoliticFollowersRepository,
      );
    });

    tearDown(() {
      politicFollowersCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PoliticFollowersCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticFollowersState to be the initial state', () {
      expect(
          politicFollowersCubit.state, equals(InitialPoliticFollowersState()));
    });

    group('GetPoliticFollowers event', () {
      blocTest(
        '''Expects [LoadingPoliticFollowers, GetPoliticFollowersSuccess] when success''',
        build: () {
          when(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .thenAnswer((_) => Future.value([]));
          return politicFollowersCubit;
        },
        act: (politicFollowersCubit) {
          politicFollowersCubit.getPoliticFollowers('1');
          return;
        },
        verify: (politicFollowersCubit) async {
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
        build: () {
          when(mockPoliticFollowersRepository.getUsersFollowingPolitic('1'))
              .thenThrow(Exception());
          return politicFollowersCubit;
        },
        act: (politicFollowersCubit) {
          politicFollowersCubit.getPoliticFollowers('1');
          return;
        },
        verify: (politicFollowersCubit) async {
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
