import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';

import '../mock.dart';

void main() {
  group('FavoritePostsBloc tests', () {
    FavoritePostsBloc favoritePostsBloc;
    MockFavoritePostsRepository mockFavoritePostsRepository;

    setUp(() {
      mockFavoritePostsRepository = MockFavoritePostsRepository();
      favoritePostsBloc = FavoritePostsBloc(
        repository: mockFavoritePostsRepository,
      );
    });

    tearDown(() {
      favoritePostsBloc?.close();
    });

    test('asserts', () {
      expect(
          () => FavoritePostsBloc(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialFavoritePostsState to be the initial state''', () {
      expect(favoritePostsBloc.state, equals(InitialFavoritePostsState()));
    });

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsSuccess] when success''',
      build: () async {
        when(mockFavoritePostsRepository.getUserFavoritePosts('1'))
            .thenAnswer((_) => Future.value([]));
        return favoritePostsBloc;
      },
      act: (favoritePostsBloc) async =>
          favoritePostsBloc.add(FetchUserFavoritePosts(userId: '1')),
      expect: [
        LoadingFavoritesPosts(),
        FetchUserFavoritePostsSuccess([]),
      ],
      verify: (favoritePostsBloc) async =>
          verify(mockFavoritePostsRepository.getUserFavoritePosts('1'))
              .called(1),
    );

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsFailed] when fails''',
      build: () async {
        when(mockFavoritePostsRepository.getUserFavoritePosts('1'))
            .thenThrow(Exception());
        return favoritePostsBloc;
      },
      act: (favoritePostsBloc) async =>
          favoritePostsBloc.add(FetchUserFavoritePosts(userId: '1')),
      expect: [LoadingFavoritesPosts(), FetchUserFavoritePostsFailed()],
      verify: (favoritePostsBloc) async =>
          verify(mockFavoritePostsRepository.getUserFavoritePosts('1'))
              .called(1),
    );
  });
}
