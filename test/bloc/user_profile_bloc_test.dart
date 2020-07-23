import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('UserProfileBloc tests', () {
    UserProfileCubit userProfileCubit;
    MockUserProfileRepository mockUserProfileRepository;

    setUp(() {
      mockUserProfileRepository = MockUserProfileRepository();
      userProfileCubit =
          UserProfileCubit(repository: mockUserProfileRepository);
    });

    tearDown(() {
      userProfileCubit?.close();
    });

    test('asserts', () {
      expect(() => UserProfileCubit(repository: null), throwsAssertionError);
    });

    test('Expects InitialUserProfileState to be the initial state', () {
      expect(userProfileCubit.state, equals(InitialUserProfileState()));
    });

    group('FetchUserRelatedInfo event', () {
      blocTest(
        '''Expects [LoadingFetchUserInfo, FetchUserRelatedInfoSuccess] when success''',
        build: () {
          when(mockUserProfileRepository.getPoliticsFollowing('1'))
              .thenAnswer((_) => Future.value([]));
          when(mockUserProfileRepository.getUserActions('1'))
              .thenAnswer((_) => Future.value([]));
          return userProfileCubit;
        },
        act: (userProfileCubit) {
          userProfileCubit.fetchUserRelatedInfo('1');
          return;
        },
        verify: (userProfileCubit) async {
          verify(mockUserProfileRepository.getPoliticsFollowing('1')).called(1);
          verify(mockUserProfileRepository.getUserActions('1')).called(1);
        },
        expect: [
          LoadingFetchUserInfo(),
          FetchUserRelatedInfoSuccess(
            politicsFollowing: [],
            userActions: [],
          ),
        ],
      );

      blocTest(
        '''Expects [LoadingFetchUserInfo, FetchUserRelatedInfoFailed] when fail''',
        build: () {
          when(mockUserProfileRepository.getPoliticsFollowing('1'))
              .thenAnswer((_) => Future.value([]));
          when(mockUserProfileRepository.getUserActions('1'))
              .thenThrow(Exception());
          return userProfileCubit;
        },
        act: (userProfileCubit) {
          userProfileCubit.fetchUserRelatedInfo('1');
          return;
        },
        verify: (userProfileCubit) async {
          verify(mockUserProfileRepository.getPoliticsFollowing('1')).called(1);
          verify(mockUserProfileRepository.getUserActions('1')).called(1);
        },
        expect: [
          LoadingFetchUserInfo(),
          FetchUserRelatedInfoFailed(),
        ],
      );

      blocTest(
        '''Expects [GetPostInfoSuccess] when success''',
        build: () {
          when(
            mockUserProfileRepository.getPostInfo(
              postId: '1',
              politicoId: '1',
              postType: PostType.PROPOSICAO,
            ),
          ).thenAnswer(
            (_) => Future.value(
              PropostaModel(
                id: '1',
              ),
            ),
          );
          return userProfileCubit;
        },
        act: (userProfileCubit) {
          userProfileCubit.getPostInfo(
            postId: '1',
            politicId: '1',
            postType: PostType.PROPOSICAO,
          );
          return;
        },
        expect: [
          GetPostInfoSuccess(
            post: PropostaModel(
              id: '1',
            ),
            postType: PostType.PROPOSICAO,
          ),
        ],
        verify: (userProfileBloc) async {
          verify(
            mockUserProfileRepository.getPostInfo(
              postId: '1',
              politicoId: '1',
              postType: PostType.PROPOSICAO,
            ),
          ).called(1);
        },
      );

      blocTest(
        '''Expects [GetPostInfoSuccess] when failed''',
        build: () {
          when(
            mockUserProfileRepository.getPostInfo(
              postId: '1',
              politicoId: '1',
              postType: PostType.PROPOSICAO,
            ),
          ).thenThrow(
            Exception(),
          );
          return userProfileCubit;
        },
        act: (userProfileCubit) {
          userProfileCubit.getPostInfo(
            postId: '1',
            politicId: '1',
            postType: PostType.PROPOSICAO,
          );
          return;
        },
        expect: [
          GetPostInfoFailed(),
        ],
        verify: (userProfileCubit) async {
          verify(
            mockUserProfileRepository.getPostInfo(
              postId: '1',
              politicoId: '1',
              postType: PostType.PROPOSICAO,
            ),
          ).called(1);
        },
      );
    });
  });
}
