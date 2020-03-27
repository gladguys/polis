import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';

import '../mock.dart';

void main() {
  group('SearchPoliticBloc tests', () {
    SearchPoliticBloc searchPoliticBloc;
    MockSearchPoliticRepository mockSearchPoliticRepository;
    MockUserFollowingPoliticsRepository mockUserFollowingPoliticsRepository;
    MockFollowRepository mockFollowRepository;

    setUp(() {
      mockSearchPoliticRepository = MockSearchPoliticRepository();
      mockUserFollowingPoliticsRepository =
          MockUserFollowingPoliticsRepository();
      mockFollowRepository = MockFollowRepository();
      searchPoliticBloc = SearchPoliticBloc(
        searchPoliticRepository: mockSearchPoliticRepository,
        userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
        followRepository: mockFollowRepository,
      );
    });

    test('asserts', () {
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: null,
                searchPoliticRepository: mockSearchPoliticRepository,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository: null,
                followRepository: mockFollowRepository,
                searchPoliticRepository: mockSearchPoliticRepository,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                searchPoliticRepository: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialSearchPoliticState to be the initial state''', () {
      expect(searchPoliticBloc.state, equals(InitialSearchPoliticState()));
    });

    blocTest(
      '''Expects [LoadingFetchPolitics, FetchSearchPoliticsSuccess] when FetchPolitics added''',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value([
                  PoliticoModel(id: '1'),
                  PoliticoModel(id: '2'),
                ]));
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockSearchPoliticRepository.getAllPolitics()).called(1);
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1'),
          PoliticoModel(id: '2'),
        ]),
      ],
    );

    blocTest(
      '''Expects [LoadingFetchPolitics, FetchSearchPoliticsFailed] when FetchPolitics failed''',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics())
            .thenThrow(Exception());
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockSearchPoliticRepository.getAllPolitics()).called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsFailed(),
      ],
    );
  });
}
