import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  group('SearchPoliticBloc tests', () {
    SearchPoliticBloc searchPoliticBloc;
    MockUserFollowingPoliticsRepository mockUserFollowingPoliticsRepository;
    MockFollowRepository mockFollowRepository;
    MockPartidoService mockPartidoService;
    MockPoliticoService mockPoliticoService;
    MockPoliticProfileBloc mockPoliticProfileBloc;

    setUp(() {
      mockUserFollowingPoliticsRepository =
          MockUserFollowingPoliticsRepository();
      mockFollowRepository = MockFollowRepository();
      mockPartidoService = MockPartidoService();
      mockPoliticoService = MockPoliticoService();
      mockPoliticProfileBloc = MockPoliticProfileBloc();
      searchPoliticBloc = SearchPoliticBloc(
        userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
        followRepository: mockFollowRepository,
        partidoService: mockPartidoService,
        politicoService: mockPoliticoService,
        politicProfileBloc: mockPoliticProfileBloc,
      );
    });

    test('asserts', () {
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository: null,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileBloc: mockPoliticProfileBloc,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: null,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileBloc: mockPoliticProfileBloc,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: null,
                partidoService: mockPartidoService,
                politicProfileBloc: mockPoliticProfileBloc,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: null,
                politicProfileBloc: mockPoliticProfileBloc,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileBloc: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialSearchPoliticState to be the initial state''', () {
      expect(searchPoliticBloc.state, equals(InitialSearchPoliticState()));
    });

    blocTest(
      '''Expects [LoadingFetchPolitics, FetchSearchPoliticsSuccess] when FetchPolitics added''',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
        verify(mockPoliticoService.getAllPoliticos()).called(1);
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
        when(mockPoliticoService.getAllPoliticos()).thenThrow(Exception());
        return searchPoliticBloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockPoliticoService.getAllPoliticos()).called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsFailed(),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when state filter',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
          politics: [
            PoliticoModel(id: '1', siglaUf: 'CE'),
          ],
          statePicked: 'CE',
          partidoPicked: 'T',
          searchTerm: '',
        ),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when partido filter',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
          politics: [
            PoliticoModel(id: '1', siglaPartido: 'PT'),
          ],
          partidoPicked: 'PT',
          statePicked: 'T',
          searchTerm: '',
        ),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when filtered by term',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
          politics: [PoliticoModel(id: '1', nomeEleitoral: 'Joao')],
          searchTerm: 'J',
          statePicked: 'T',
          partidoPicked: 'T',
        ),
      ],
    );

    blocTest(
      '#139 - https://github.com/gladguys/polis/issues/139',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'João'),
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
        searchPoliticBloc.add(ChangeSearchPoliticFilter(term: 'Joa'));
        return;
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1', nomeEleitoral: 'João'),
        ]),
        SearchPoliticFilterChanged(
          politics: [PoliticoModel(id: '1', nomeEleitoral: 'João')],
          statePicked: 'T',
          partidoPicked: 'T',
          searchTerm: 'Joa',
        ),
      ],
    );

    blocTest(
      '#123 - https://github.com/gladguys/polis/issues/123',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
        searchPoliticBloc.add(ChangeSearchPoliticFilter(term: 'JW'));
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
          politics: [PoliticoModel(id: '1', nomeEleitoral: 'Joao')],
          searchTerm: 'J',
          partidoPicked: 'T',
          statePicked: 'T',
        ),
        SearchPoliticFilterChanged(
          politics: [],
          searchTerm: 'JW',
          partidoPicked: 'T',
          statePicked: 'T',
        ),
        SearchPoliticFilterChanged(
          politics: [PoliticoModel(id: '1', nomeEleitoral: 'Joao')],
          searchTerm: 'J',
          partidoPicked: 'T',
          statePicked: 'T',
        ),
      ],
    );

    blocTest(
      '''Expects to follow the politic when FollowUnfollowSearchPolitic added and politic not been followed''',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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
          ),
        ),
      ],
    );

    blocTest(
      '''Expects to unfollow the politic when FollowUnfollowSearchPolitic added and politic is been followed''',
      build: () async {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
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

    blocTest(
      '''Expects to yield [LoadingFetchPolitics, FetchSearchPoliticsSuccess, FollowedSearchPoliticsUpdated] when ChangeFollowPoliticStatus
      added''',
      build: () async {
        final mockPoliticProfileBloc = MockPoliticProfileBloc();
        final bloc = SearchPoliticBloc(
          userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
          followRepository: mockFollowRepository,
          partidoService: mockPartidoService,
          politicoService: mockPoliticoService,
          politicProfileBloc: mockPoliticProfileBloc,
        );
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value(
            [
              PoliticoModel(id: '1'),
              PoliticoModel(id: '2'),
            ],
          ),
        );
        return bloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(
          ChangeFollowPoliticStatus(
            politico: PoliticoModel(id: '1'),
            isUserFollowingPolitic: false,
          ),
        );
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockPoliticoService.getAllPoliticos()).called(1);
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1'),
          PoliticoModel(id: '2'),
        ]),
        FollowedSearchPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ],
          isFollowing: false,
          politicoUpdated: PoliticoModel(id: '1'),
        ),
      ],
    );

    blocTest(
      '''Expects to add ChangeFollowPoliticStatus when UserFollowingPoliticChanged changed''',
      build: () async {
        final mockPoliticProfileBloc = MockPoliticProfileBloc();
        whenListen(
          mockPoliticProfileBloc,
          Stream.fromIterable(
            [
              LoadingPoliticInfo(),
              UserFollowingPoliticChanged(
                politico: PoliticoModel(id: '1'),
                isUserFollowingPolitic: true,
              ),
            ],
          ),
        );
        final bloc = SearchPoliticBloc(
          userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
          followRepository: mockFollowRepository,
          partidoService: mockPartidoService,
          politicoService: mockPoliticoService,
          politicProfileBloc: mockPoliticProfileBloc,
        );
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value(
            [
              PoliticoModel(id: '1'),
              PoliticoModel(id: '2'),
            ],
          ),
        );
        return bloc;
      },
      act: (searchPoliticBloc) {
        searchPoliticBloc.add(FetchPolitics('1'));
        searchPoliticBloc.add(
          ChangeFollowPoliticStatus(
            politico: PoliticoModel(id: '1'),
            isUserFollowingPolitic: false,
          ),
        );
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockPoliticoService.getAllPoliticos()).called(1);
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsSuccess([
          PoliticoModel(id: '1'),
          PoliticoModel(id: '2'),
        ]),
        FollowedSearchPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ],
          isFollowing: false,
          politicoUpdated: PoliticoModel(id: '1'),
        ),
        FollowedSearchPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(id: '1'),
            PoliticoModel(id: '2'),
          ],
          isFollowing: true,
          politicoUpdated: PoliticoModel(id: '1'),
        ),
      ],
    );
  });
}
