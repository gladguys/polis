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

    setUp(() {
      mockPostRepository = MockPostRepository();
      postBloc = PostBloc(
        post: {},
        postRepository: mockPostRepository,
      );
    });

    test('asserts', () {
      expect(
          () => PostBloc(
                post: null,
                postRepository: mockPostRepository,
              ),
          throwsAssertionError);

      expect(
          () => PostBloc(
                post: {},
                postRepository: null,
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
  });
}
