import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/politico_model.dart';
import 'package:polis/model/user_model.dart';

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

    blocTest(
      'Expects [SearchPoliticFilterChanged] when state filter',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', siglaUf: 'CE'),
            PoliticoModel(id: '2', siglaUf: 'AC'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', siglaUf: 'CE'),
            PoliticoModel(id: '2', siglaUf: 'AC'),
          ]),
        );
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(ChangeSearchPoliticFilter(estado: 'CE'));
        return;
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', siglaUf: 'CE'),
          PoliticoModel(id: '2', siglaUf: 'AC'),
        ]),
        SearchPoliticFilterChanged(
          [PoliticoModel(id: '1', siglaUf: 'CE')],
        ),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when partido filter',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', siglaPartido: 'PT'),
            PoliticoModel(id: '2', siglaPartido: 'PMDB'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', siglaPartido: 'PT'),
            PoliticoModel(id: '2', siglaPartido: 'PMDB'),
          ]),
        );
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(ChangeSearchPoliticFilter(partido: 'PT'));
        return;
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', siglaPartido: 'PT'),
          PoliticoModel(id: '2', siglaPartido: 'PMDB'),
        ]),
        SearchPoliticFilterChanged(
          [PoliticoModel(id: '1', siglaPartido: 'PT')],
        ),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when filtered by term',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
            PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
            PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
          ]),
        );
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(ChangeSearchPoliticFilter(term: 'J'));
        return;
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
          PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
        ]),
        SearchPoliticFilterChanged(
          [PoliticoModel(id: '1', nomeEleitoral: 'Joao')],
        ),
      ],
    );

    blocTest(
      '''Expects to follow the politic when FollowUnfollowSearchPolitic added and politic not been followed''',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
            PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([]),
        );
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(
          FollowUnfollowSearchPolitic(
            user: UserModel(
              userId: '1',
            ),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'Joao',
            ),
          ),
        );
        return;
      },
      verify: (userBloc) async {
        verify(
          mockFollowRepository.followPolitic(
            user: UserModel(
              userId: '1',
            ),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'Joao',
            ),
          ),
        ).called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
          PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
        ]),
        FollowedSearchPoliticsUpdated(
            followedPolitics: [
              ...[
                PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
                PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
              ]
            ],
            isFollowing: false,
            politicoUpdated: PoliticoModel(
              id: '1',
              nomeEleitoral: 'Joao',
            )),
      ],
    );

    blocTest(
      '''Expects to unfollow the politic when FollowUnfollowSearchPolitic added and politic is been followed''',
      build: () async {
        when(mockSearchPoliticRepository.getAllPolitics()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
            PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
            PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
          ]),
        );
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(
          FollowUnfollowSearchPolitic(
            user: UserModel(
              userId: '1',
            ),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'Joao',
            ),
          ),
        );
        return;
      },
      verify: (userBloc) async {
        verify(
          mockFollowRepository.unfollowPolitic(
            user: UserModel(
              userId: '1',
            ),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'Joao',
            ),
          ),
        ).called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
          PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
        ]),
        FollowedSearchPoliticsUpdated(
          followedPolitics: [
            ...[
              PoliticoModel(id: '1', nomeEleitoral: 'Joao'),
              PoliticoModel(id: '2', nomeEleitoral: 'Maria'),
            ]
          ],
          isFollowing: true,
          politicoUpdated: PoliticoModel(
            id: '1',
            nomeEleitoral: 'Joao',
          ),
        ),
      ],
    );

    blocTest(
      'Expects to yield FollowUnfollowPoliticsFailed when exception occurs',
      build: () async {
        when(mockFollowRepository.followPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        when(mockFollowRepository.unfollowPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(
          FollowUnfollowSearchPolitic(
              user: UserModel(
                userId: '1',
              ),
              politico: PoliticoModel(
                id: '1',
              )),
        );
        return;
      },
      expect: [
        FollowUnfollowPoliticsFailed(),
      ],
    );
  });
}
