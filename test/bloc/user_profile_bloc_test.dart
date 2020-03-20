import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('UserProfileBloc tests', () {
    UserProfileBloc userProfileBloc;
    MockUserProfileRepository mockUserProfileRepository;

    setUp(() {
      mockUserProfileRepository = MockUserProfileRepository();
      userProfileBloc = UserProfileBloc(repository: mockUserProfileRepository);
    });

    test('asserts', () {
      expect(() => UserProfileBloc(repository: null), throwsAssertionError);
    });

    test('Expects InitialUserProfileState to be the initial state', () {
      expect(userProfileBloc.state, equals(InitialUserProfileState()));
    });

    group('FetchUserRelatedInfo event', () {
      blocTest(
        '''Expects [LoadingFetchUserInfo, FetchUserRelatedInfoSuccess] when success''',
        build: () async {
          when(mockUserProfileRepository.getPoliticsFollowing('1'))
              .thenAnswer((_) => Future.value([]));
          when(mockUserProfileRepository.getUserActivities('1'))
              .thenAnswer((_) => Future.value([]));
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(FetchUserRelatedInfo('1'));
          return;
        },
        verify: (userProfileBloc) async {
          verify(mockUserProfileRepository.getPoliticsFollowing('1')).called(1);
          verify(mockUserProfileRepository.getUserActivities('1')).called(1);
        },
        expect: [
          LoadingFetchUserInfo(),
          FetchUserRelatedInfoSuccess(
            politicsFollowing: [],
            userActivities: [],
          ),
        ],
      );

      blocTest(
        '''Expects [LoadingFetchUserInfo, FetchUserRelatedInfoFailed] when fail''',
        build: () async {
          when(mockUserProfileRepository.getPoliticsFollowing('1'))
              .thenAnswer((_) => Future.value([]));
          when(mockUserProfileRepository.getUserActivities('1'))
              .thenThrow(Exception());
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(FetchUserRelatedInfo('1'));
          return;
        },
        verify: (userProfileBloc) async {
          verify(mockUserProfileRepository.getPoliticsFollowing('1')).called(1);
          verify(mockUserProfileRepository.getUserActivities('1')).called(1);
        },
        expect: [
          LoadingFetchUserInfo(),
          FetchUserRelatedInfoFailed(),
        ],
      );
    });
  });
}
