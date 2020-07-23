import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:tuple/tuple.dart';

import '../mock.dart';

void main() {
  group('PostBloc tests', () {
    PostCubit postCubit;
    MockPostRepository mockPostRepository;
    MockActionRepository mockActionRepository;
    MockShareService mockShareService;
    MockFile mockFile;
    MockTimelineCubit mockTimelineCubit;
    MockUserCubit mockUserCubit;
    DespesaModel despesa;
    PropostaModel proposta;

    setUp(() {
      despesa = DespesaModel(
        id: '1',
        favorito: true,
      );
      proposta = PropostaModel(
        id: '1',
        idPropostaPolitico: '1',
        favorito: true,
      );
      mockUserCubit = MockUserCubit();
      mockTimelineCubit = MockTimelineCubit();
      mockPostRepository = MockPostRepository();
      mockActionRepository = MockActionRepository();
      mockShareService = MockShareService();
      mockFile = MockFile();
      postCubit = PostCubit(
        post: {},
        postRepository: mockPostRepository,
        actionRepository: mockActionRepository,
        shareService: mockShareService,
        userCubit: mockUserCubit,
      );
    });

    tearDown(() {
      postCubit?.close();
    });

    test('asserts', () {
      expect(
          () => PostCubit(
                post: null,
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userCubit: mockUserCubit,
              ),
          throwsAssertionError);

      expect(
          () => PostCubit(
                post: {},
                postRepository: null,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userCubit: mockUserCubit,
              ),
          throwsAssertionError);

      expect(
          () => PostCubit(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: null,
                shareService: mockShareService,
                userCubit: mockUserCubit,
              ),
          throwsAssertionError);

      expect(
          () => PostCubit(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: null,
                userCubit: mockUserCubit,
              ),
          throwsAssertionError);

      expect(
          () => PostCubit(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userCubit: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialPostState to be the initial state''', () {
      expect(postCubit.state, equals(InitialPostState()));
    });

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added''',
      build: () => PostCubit(
        post: {
          FAVORITO_FIELD: true,
        },
        postRepository: mockPostRepository,
        actionRepository: mockActionRepository,
        shareService: mockShareService,
        userCubit: mockUserCubit,
      ),
      act: (postCubit) async => postCubit.favoritePostForUser(
        post: <String, dynamic>{},
        user: UserModel(),
      ),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            FAVORITO_FIELD: false,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postCubit) async => verify(mockPostRepository.unfavoritePost(
              post: anyNamed('post'), user: anyNamed('user')))
          .called(1),
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedFailed] when FavoritePostForUser added and failed''',
      build: () {
        final mockPostRepository = MockPostRepository();
        when(
          mockPostRepository.unfavoritePost(
            post: anyNamed('post'),
            user: anyNamed('user'),
          ),
        ).thenThrow(Exception());
        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.favoritePostForUser(
        post: <String, dynamic>{},
        user: UserModel(),
      ),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            FAVORITO_FIELD: false,
          },
          isFavorite: false,
        ),
        PostFavoritedFailed(),
      ],
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added for despesa and timelineBloc is not null''',
      build: () {
        when(mockTimelineCubit.timelinePosts).thenReturn([
          despesa,
        ]);
        return PostCubit(
          post: {
            ID_FIELD: 1,
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineCubit: mockTimelineCubit,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.favoritePostForUser(
        post: despesa.toJson(),
        user: UserModel(),
      ),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            ID_FIELD: 1,
            FAVORITO_FIELD: true,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postCubit) async {
        verify(mockPostRepository.unfavoritePost(
                post: anyNamed('post'), user: anyNamed('user')))
            .called(1);
        verify(mockTimelineCubit.refreshTimeline()).called(1);
      },
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added for proposta and timelineBloc is not null''',
      build: () {
        when(mockTimelineCubit.timelinePosts).thenReturn([
          PropostaModel(
            id: '1',
            idPropostaPolitico: '1',
            favorito: true,
          ),
        ]);
        return PostCubit(
          post: {
            ID_FIELD: 1,
            ID_PROPOSTA_POLITICO_FIELD: '1',
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineCubit: mockTimelineCubit,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.favoritePostForUser(
        post: proposta.toJson(),
        user: UserModel(),
      ),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            ID_FIELD: 1,
            ID_PROPOSTA_POLITICO_FIELD: '1',
            FAVORITO_FIELD: true,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postCubit) async {
        verify(mockPostRepository.unfavoritePost(
                post: anyNamed('post'), user: anyNamed('user')))
            .called(1);
        verify(mockTimelineCubit.refreshTimeline()).called(1);
      },
    );

    blocTest(
      'Expects to share the image file',
      build: () {
        when(mockShareService.shareFile(MockFile()))
            .thenAnswer((_) => Future.value());
        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.sharePost(mockFile),
      expect: [],
      verify: (postCubit) async => verify(
        mockShareService.shareFile(mockFile,
            title: anyNamed('title'), name: 'post.png', mimeType: 'image/png'),
      ).called(1),
    );

    blocTest(
      'Expects to set despesa post as viewed',
      build: () {
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value());

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineCubit: mockTimelineCubit,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.setPostViewed(
        userId: '1',
        postId: '1',
      ),
      expect: [],
      verify: (postCubit) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to set proposta post as viewed',
      build: () {
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          PropostaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value());

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineCubit: mockTimelineCubit,
          userCubit: mockUserCubit,
        );
      },
      act: (postCubit) async => postCubit.setPostViewed(
        userId: '1',
        postId: '1',
      ),
      expect: [],
      verify: (postCubit) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to yield PostViewedFailed when post as viewed failed',
      build: () {
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenThrow(Exception());

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.setPostViewed(
        userId: '1',
        postId: '1',
      ),
      expect: [
        PostViewedFailed(),
      ],
      verify: (postCubit) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to set get isPostFavorite info',
      build: () {
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.isPostFavorited(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value(true));

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.setPostFavorited(
        userId: '1',
        postId: '1',
      ),
      expect: [
        PostFavoritedSuccess(),
      ],
      verify: (postCubit) async => verify(
        mockPostRepository.isPostFavorited(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to yield PostViewedFailed when getting isfavorite info',
      build: () {
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.isPostFavorited(
            userId: '1',
            postId: '1',
          ),
        ).thenThrow(Exception());

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.setPostFavorited(
        userId: '1',
        postId: '1',
      ),
      expect: [
        PostFavoritedFailed(),
      ],
      verify: (postCubit) async => verify(
        mockPostRepository.isPostFavorited(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to yield PostLikedSuccess when like is success',
      build: () {
        when(mockUserCubit.user).thenReturn(UserModel());
        when(mockPostRepository.likePost(
                userId: '1', postId: '1', politicoId: '1', isUnliked: false))
            .thenAnswer(
          (_) => Future.value(
            const Tuple2(
              {'1': true},
              {'2': false},
            ),
          ),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(
          mockActionRepository.saveUserAction(
            user: anyNamed('user'),
            acao: anyNamed(
              'acao',
            ),
          ),
        ).thenAnswer((_) => Future.value());
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.likePost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
        isUnliked: false,
      ),
      expect: [
        PostLikedSuccess(
          postId: '1',
        ),
      ],
      verify: (postCubit) async {
        verify(
          mockPostRepository.likePost(
            userId: '1',
            postId: '1',
            politicoId: '1',
            isUnliked: false,
          ),
        ).called(1);
        verify(
          mockUserCubit.updateCurrentUser(
            UserModel(),
          ),
        ).called(1);
        verify(
          mockActionRepository.saveUserAction(
            user: UserModel(userId: '1'),
            acao: anyNamed('acao'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'Expects to yield PostLikedFailed when like is failed',
      build: () {
        when(mockUserCubit.user).thenReturn(UserModel());
        when(mockPostRepository.likePost(
                userId: '1', postId: '1', politicoId: '1', isUnliked: false))
            .thenThrow(Exception());
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.likePost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
        isUnliked: false,
      ),
      expect: [
        PostLikedSuccess(
          postId: '1',
        ),
        PostLikedFailed(),
      ],
    );

    blocTest(
      'Expects to yield PostUnlikedSuccess when like is success',
      build: () {
        when(mockUserCubit.user).thenReturn(UserModel());
        when(mockPostRepository.unlikePost(
                userId: '1', postId: '1', politicoId: '1', isLiked: true))
            .thenAnswer(
          (_) => Future.value(
            const Tuple2(
              {'1': true},
              {'2': false},
            ),
          ),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(
          mockActionRepository.saveUserAction(
            user: anyNamed('user'),
            acao: anyNamed(
              'acao',
            ),
          ),
        ).thenAnswer((_) => Future.value());
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.unlikePost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
        isLiked: true,
      ),
      expect: [
        PostUnlikedSuccess(
          postId: '1',
        ),
      ],
      verify: (postCubit) async {
        verify(
          mockPostRepository.unlikePost(
            userId: '1',
            postId: '1',
            politicoId: '1',
            isLiked: true,
          ),
        ).called(1);
        verify(
          mockUserCubit.updateCurrentUser(
            UserModel(),
          ),
        ).called(1);
        verify(
          mockActionRepository.saveUserAction(
            user: UserModel(userId: '1'),
            acao: anyNamed('acao'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'Expects to yield PostUnlikedFailed when unlike is failed',
      build: () {
        when(mockUserCubit.user).thenReturn(UserModel());
        when(mockPostRepository.unlikePost(
                userId: '1', postId: '1', politicoId: '1', isLiked: true))
            .thenThrow(Exception());
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.unlikePost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
        isLiked: true,
      ),
      expect: [
        PostUnlikedSuccess(
          postId: '1',
        ),
        PostUnlikedFailed(),
      ],
    );

    blocTest(
      'Expects to yield PostUnlikedFailed when unlike save action is failed',
      build: () {
        when(mockUserCubit.user).thenReturn(UserModel());
        when(mockPostRepository.unlikePost(
                userId: '1', postId: '1', politicoId: '1', isLiked: true))
            .thenAnswer(
          (_) => Future.value(
            const Tuple2(
              {'1': true},
              {'2': false},
            ),
          ),
        );
        when(
          mockActionRepository.saveUserAction(
            user: anyNamed('user'),
            acao: anyNamed('acao'),
          ),
        ).thenThrow(Exception());
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.unlikePost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
        isLiked: true,
      ),
      expect: [
        PostUnlikedSuccess(
          postId: '1',
        ),
        PostUnlikedFailed(),
      ],
    );

    blocTest(
      'Expects to yield StoppedLikingPostSuccess when success',
      build: () {
        when(mockUserCubit.user).thenReturn(
          UserModel(),
        );
        when(
          mockPostRepository.stopLikingPost(
            userId: '1',
            postId: '1',
            politicoId: '1',
          ),
        ).thenAnswer(
          (_) => Future.value({
            '1': true,
          }),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.stopLikingPost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
      ),
      expect: [
        StoppedLikingPostSuccess(
          postId: '1',
        ),
      ],
    );

    blocTest(
      'Expects to yield StoppedLikingPostFailed when failed',
      build: () {
        when(mockUserCubit.user).thenReturn(
          UserModel(),
        );
        when(
          mockPostRepository.stopLikingPost(
            userId: '1',
            postId: '1',
            politicoId: '1',
          ),
        ).thenThrow(
          Exception(),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.stopLikingPost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
      ),
      expect: [
        StoppedLikingPostSuccess(
          postId: '1',
        ),
        StoppedLikingPostFailed(),
      ],
    );

    blocTest(
      'Expects to yield StoppedUnlikingPostSuccess when success',
      build: () {
        when(mockUserCubit.user).thenReturn(
          UserModel(),
        );
        when(
          mockPostRepository.stopUnlikingPost(
            userId: '1',
            postId: '1',
            politicoId: '1',
          ),
        ).thenAnswer(
          (_) => Future.value({
            '1': true,
          }),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.stopUnlikingPost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
      ),
      expect: [
        StoppedUnlikingPostSuccess(
          postId: '1',
        ),
      ],
    );

    blocTest(
      'Expects to yield StoppedUnlikingPostFailed when failed',
      build: () {
        when(mockUserCubit.user).thenReturn(
          UserModel(),
        );
        when(
          mockPostRepository.stopUnlikingPost(
            userId: '1',
            postId: '1',
            politicoId: '1',
          ),
        ).thenThrow(
          Exception(),
        );
        final mockTimelineCubit = MockTimelineCubit();
        when(mockTimelineCubit.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);

        return PostCubit(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userCubit: mockUserCubit,
          timelineCubit: mockTimelineCubit,
        );
      },
      act: (postCubit) async => postCubit.stopUnlikingPost(
        user: UserModel(
          userId: '1',
        ),
        postId: '1',
        politicoId: '1',
      ),
      expect: [
        StoppedUnlikingPostSuccess(
          postId: '1',
        ),
        StoppedUnlikingPostFailed(),
      ],
    );
  });
}
