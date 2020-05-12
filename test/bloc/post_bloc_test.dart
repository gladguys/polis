import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  group('PostBloc tests', () {
    PostBloc postBloc;
    MockPostRepository mockPostRepository;
    MockShareService mockShareService;
    MockFile mockFile;

    setUp(() {
      mockPostRepository = MockPostRepository();
      mockShareService = MockShareService();
      mockFile = MockFile();
      postBloc = PostBloc(
        post: {},
        postRepository: mockPostRepository,
        shareService: mockShareService,
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
                shareService: mockShareService,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: null,
                shareService: mockShareService,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: mockPostRepository,
                shareService: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialPostState to be the initial state''', () {
      expect(postBloc.state, equals(InitialPostState()));
    });

    blocTest(
      'mapEventToState',
      build: () async => postBloc,
      act: (postBloc) async => postBloc.add(LikePost('1')),
      expect: [],
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added''',
      build: () async => PostBloc(
        post: {
          'favorito': true,
        },
        postRepository: mockPostRepository,
        shareService: mockShareService,
      ),
      act: (postBloc) async =>
          postBloc.add(FavoritePostForUser(post: {}, user: UserModel())),
      expect: [
        PostFavoriteStatusChanged(isFavorite: false),
        PostFavoritedSuccess()
      ],
      verify: (postBloc) async => verify(mockPostRepository.unfavoritePost(
              post: anyNamed('post'), user: anyNamed('user')))
          .called(1),
    );

    blocTest(
      '''Expects [PostFavoriteStatusChanged, PostFavoritedSuccess] when FavoritePostForUser added''',
      build: () async {
        when(mockPostRepository.unfavoritePost(
                post: anyNamed('post'), user: anyNamed('user')))
            .thenThrow(Exception());
        return PostBloc(
          post: {
            'favorito': true,
          },
          postRepository: mockPostRepository,
          shareService: mockShareService,
        );
      },
      act: (postBloc) async =>
          postBloc.add(FavoritePostForUser(post: {}, user: UserModel())),
      expect: [
        PostFavoriteStatusChanged(isFavorite: false),
        PostFavoritedFailed()
      ],
      verify: (postBloc) async => verify(mockPostRepository.unfavoritePost(
              post: anyNamed('post'), user: anyNamed('user')))
          .called(1),
    );

    blocTest(
      'Expects to share the image file',
      build: () async {
        when(mockShareService.shareFile(MockFile()))
            .thenAnswer((_) => Future.value());
        return PostBloc(
          post: {
            'favorito': true,
          },
          postRepository: mockPostRepository,
          shareService: mockShareService,
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
      'Expects to set post as viewed',
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
            'favorito': true,
          },
          postRepository: mockPostRepository,
          shareService: mockShareService,
          timelineBloc: mockTimelineBloc,
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
            'favorito': true,
          },
          postRepository: mockPostRepository,
          shareService: mockShareService,
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
  });
}
