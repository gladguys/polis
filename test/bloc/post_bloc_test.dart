import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';

import '../mock.dart';

void main() {
  group('PostBloc tests', () {
    PostBloc postBloc;
    MockPostRepository mockPostRepository;
    MockActionRepository mockActionRepository;
    MockShareService mockShareService;
    MockFile mockFile;
    MockTimelineBloc mockTimelineBloc;
    MockUserBloc mockUserBloc;
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
      mockUserBloc = MockUserBloc();
      mockTimelineBloc = MockTimelineBloc();
      mockPostRepository = MockPostRepository();
      mockActionRepository = MockActionRepository();
      mockShareService = MockShareService();
      mockFile = MockFile();
      postBloc = PostBloc(
        post: {},
        postRepository: mockPostRepository,
        actionRepository: mockActionRepository,
        shareService: mockShareService,
        userBloc: mockUserBloc,
      );
    });

    tearDown(() {
      postBloc?.close();
    });

    test('asserts', () {
      expect(
          () => PostBloc(
                post: null,
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userBloc: mockUserBloc,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: null,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userBloc: mockUserBloc,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: null,
                shareService: mockShareService,
                userBloc: mockUserBloc,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: null,
                userBloc: mockUserBloc,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: mockPostRepository,
                actionRepository: mockActionRepository,
                shareService: mockShareService,
                userBloc: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialPostState to be the initial state''', () {
      expect(postBloc.state, equals(InitialPostState()));
    });

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added''',
      build: () async => PostBloc(
        post: {
          FAVORITO_FIELD: true,
        },
        postRepository: mockPostRepository,
        actionRepository: mockActionRepository,
        shareService: mockShareService,
        userBloc: mockUserBloc,
      ),
      act: (postBloc) async =>
          postBloc.add(FavoritePostForUser(post: {}, user: UserModel())),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            FAVORITO_FIELD: false,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postBloc) async => verify(mockPostRepository.unfavoritePost(
              post: anyNamed('post'), user: anyNamed('user')))
          .called(1),
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedFailed] when FavoritePostForUser added and failed''',
      build: () async {
        final mockPostRepository = MockPostRepository();
        when(
          mockPostRepository.unfavoritePost(
            post: anyNamed('post'),
            user: anyNamed('user'),
          ),
        ).thenThrow(Exception());
        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async =>
          postBloc.add(FavoritePostForUser(post: {}, user: UserModel())),
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
      build: () async {
        when(mockTimelineBloc.timelinePosts).thenReturn([
          despesa,
        ]);
        return PostBloc(
          post: {
            'id': 1,
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineBloc: mockTimelineBloc,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async => postBloc
          .add(FavoritePostForUser(post: despesa.toJson(), user: UserModel())),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            'id': 1,
            FAVORITO_FIELD: true,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postBloc) async {
        verify(mockPostRepository.unfavoritePost(
                post: anyNamed('post'), user: anyNamed('user')))
            .called(1);
        verify(mockTimelineBloc.add(RefreshTimeline())).called(1);
      },
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added for proposta and timelineBloc is not null''',
      build: () async {
        when(mockTimelineBloc.timelinePosts).thenReturn([
          PropostaModel(
            id: '1',
            idPropostaPolitico: '1',
            favorito: true,
          ),
        ]);
        return PostBloc(
          post: {
            'id': 1,
            'idPropostaPolitico': '1',
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineBloc: mockTimelineBloc,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async => postBloc
          .add(FavoritePostForUser(post: proposta.toJson(), user: UserModel())),
      expect: [
        PostFavoriteStatusChanged(
          post: {
            'id': 1,
            'idPropostaPolitico': '1',
            FAVORITO_FIELD: true,
          },
          isFavorite: false,
        ),
        PostFavoritedSuccess()
      ],
      verify: (postBloc) async {
        verify(mockPostRepository.unfavoritePost(
                post: anyNamed('post'), user: anyNamed('user')))
            .called(1);
        verify(mockTimelineBloc.add(RefreshTimeline())).called(1);
      },
    );

    blocTest(
      'Expects to share the image file',
      build: () async {
        when(mockShareService.shareFile(MockFile()))
            .thenAnswer((_) => Future.value());
        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async => postBloc.add(SharePost(postImage: mockFile)),
      expect: [],
      verify: (postBloc) async => verify(
        mockShareService.shareFile(mockFile,
            title: anyNamed('title'), name: 'post.png', mimeType: 'image/png'),
      ).called(1),
    );

    blocTest(
      'Expects to set despesa post as viewed',
      build: () async {
        final mockTimelineBloc = MockTimelineBloc();
        when(mockTimelineBloc.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value());

        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineBloc: mockTimelineBloc,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async => postBloc.add(
        SetPostViewed(
          userId: '1',
          postId: '1',
        ),
      ),
      expect: [],
      verify: (postBloc) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to set proposta post as viewed',
      build: () async {
        final mockTimelineBloc = MockTimelineBloc();
        when(mockTimelineBloc.timelinePosts).thenReturn([
          PropostaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value());

        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          timelineBloc: mockTimelineBloc,
          userBloc: mockUserBloc,
        );
      },
      act: (postBloc) async => postBloc.add(
        SetPostViewed(
          userId: '1',
          postId: '1',
        ),
      ),
      expect: [],
      verify: (postBloc) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to yield PostViewedFailed when post as viewed failed',
      build: () async {
        final mockTimelineBloc = MockTimelineBloc();
        when(mockTimelineBloc.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.setPostVisible(
            userId: '1',
            postId: '1',
          ),
        ).thenThrow(Exception());

        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userBloc: mockUserBloc,
          timelineBloc: mockTimelineBloc,
        );
      },
      act: (postBloc) async => postBloc.add(
        SetPostViewed(
          userId: '1',
          postId: '1',
        ),
      ),
      expect: [
        PostViewedFailed(),
      ],
      verify: (postBloc) async => verify(
        mockPostRepository.setPostVisible(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to set get isPostFavorite info',
      build: () async {
        final mockTimelineBloc = MockTimelineBloc();
        when(mockTimelineBloc.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.isPostFavorited(
            userId: '1',
            postId: '1',
          ),
        ).thenAnswer((_) => Future.value(true));

        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userBloc: mockUserBloc,
          timelineBloc: mockTimelineBloc,
        );
      },
      act: (postBloc) async => postBloc.add(
        SetPostFavorited(
          userId: '1',
          postId: '1',
        ),
      ),
      expect: [
        PostFavoritedSuccess(),
      ],
      verify: (postBloc) async => verify(
        mockPostRepository.isPostFavorited(userId: '1', postId: '1'),
      ).called(1),
    );

    blocTest(
      'Expects to yield PostViewedFailed when getting isfavorite info',
      build: () async {
        final mockTimelineBloc = MockTimelineBloc();
        when(mockTimelineBloc.timelinePosts).thenReturn([
          DespesaModel(id: '1'),
        ]);
        when(
          mockPostRepository.isPostFavorited(
            userId: '1',
            postId: '1',
          ),
        ).thenThrow(Exception());

        return PostBloc(
          post: {
            FAVORITO_FIELD: true,
          },
          postRepository: mockPostRepository,
          actionRepository: mockActionRepository,
          shareService: mockShareService,
          userBloc: mockUserBloc,
          timelineBloc: mockTimelineBloc,
        );
      },
      act: (postBloc) async => postBloc.add(
        SetPostFavorited(
          userId: '1',
          postId: '1',
        ),
      ),
      expect: [
        PostFavoritedFailed(),
      ],
      verify: (postBloc) async => verify(
        mockPostRepository.isPostFavorited(userId: '1', postId: '1'),
      ).called(1),
    );
  });
}
