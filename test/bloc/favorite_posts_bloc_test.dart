import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';

import '../mock.dart';

void main() {
  group('FavoritePostsBloc tests', () {
    FavoritePostsCubit favoritePostsCubit;
    MockFavoritePostsRepository mockFavoritePostsRepository;

    setUp(() {
      mockFavoritePostsRepository = MockFavoritePostsRepository();
      favoritePostsCubit = FavoritePostsCubit(
        repository: mockFavoritePostsRepository,
      );
    });

    tearDown(() {
      favoritePostsCubit?.close();
    });

    test('asserts', () {
      expect(
          () => FavoritePostsCubit(
                repository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialFavoritePostsState to be the initial state''', () {
      expect(favoritePostsCubit.state, equals(InitialFavoritePostsState()));
    });

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsSuccess] when success''',
      build: () {
        when(mockFavoritePostsRepository.getUserFavoritePosts('1'))
            .thenAnswer((_) => Future.value([]));
        return favoritePostsCubit;
      },
      act: (favoritePostsCubit) async =>
          favoritePostsCubit.fetchUserFavoritePosts('1'),
      expect: [
        LoadingFavoritesPosts(),
        FetchUserFavoritePostsSuccess([]),
      ],
      verify: (favoritePostsCubit) async =>
          verify(mockFavoritePostsRepository.getUserFavoritePosts('1'))
              .called(1),
    );

    blocTest(
      '''Expects [LoadingFavoritesPosts, FetchUserFavoritePostsFailed] when fails''',
      build: () {
        when(mockFavoritePostsRepository.getUserFavoritePosts('1'))
            .thenThrow(Exception());
        return favoritePostsCubit;
      },
      act: (favoritePostsCubit) async =>
          favoritePostsCubit.fetchUserFavoritePosts('1'),
      expect: [
        LoadingFavoritesPosts(),
        FetchUserFavoritePostsFailed(),
      ],
      verify: (favoritePostsCubit) async =>
          verify(mockFavoritePostsRepository.getUserFavoritePosts('1'))
              .called(1),
    );
  });
}
