import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('UserProfileBloc tests', () {
    UserProfileBloc userProfileBloc;
    MockUserProfileRepository mockUserProfileRepository;

    setUp(() {
      mockUserProfileRepository = MockUserProfileRepository();
      userProfileBloc = UserProfileBloc(repository: mockUserProfileRepository);
    });

    tearDown(() {
      userProfileBloc?.close();
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
          when(mockUserProfileRepository.getUserActions('1'))
              .thenAnswer((_) => Future.value([]));
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(FetchUserRelatedInfo('1'));
          return;
        },
        verify: (userProfileBloc) async {
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
        build: () async {
          when(mockUserProfileRepository.getPoliticsFollowing('1'))
              .thenAnswer((_) => Future.value([]));
          when(mockUserProfileRepository.getUserActions('1'))
              .thenThrow(Exception());
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(FetchUserRelatedInfo('1'));
          return;
        },
        verify: (userProfileBloc) async {
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
        build: () async {
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
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(
            GetPostInfo(
              postId: '1',
              politicId: '1',
              postType: PostType.PROPOSICAO,
            ),
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
        build: () async {
          when(
            mockUserProfileRepository.getPostInfo(
              postId: '1',
              politicoId: '1',
              postType: PostType.PROPOSICAO,
            ),
          ).thenThrow(
            Exception(),
          );
          return userProfileBloc;
        },
        act: (userProfileBloc) {
          userProfileBloc.add(
            GetPostInfo(
              postId: '1',
              politicId: '1',
              postType: PostType.PROPOSICAO,
            ),
          );
          return;
        },
        expect: [
          GetPostInfoFailed(),
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
    });
  });
}
