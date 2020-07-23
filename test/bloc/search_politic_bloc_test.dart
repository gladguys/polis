import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('SearchPoliticBloc tests', () {
    SearchPoliticCubit searchPoliticCubit;
    MockUserFollowingPoliticsRepository mockUserFollowingPoliticsRepository;
    MockFollowRepository mockFollowRepository;
    MockPartidoService mockPartidoService;
    MockPoliticoService mockPoliticoService;
    MockPoliticProfileCubit mockPoliticProfileCubit;

    setUp(() {
      mockUserFollowingPoliticsRepository =
          MockUserFollowingPoliticsRepository();
      mockFollowRepository = MockFollowRepository();
      mockPartidoService = MockPartidoService();
      mockPoliticoService = MockPoliticoService();
      mockPoliticProfileCubit = MockPoliticProfileCubit();
      searchPoliticCubit = SearchPoliticCubit(
        userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
        followRepository: mockFollowRepository,
        partidoService: mockPartidoService,
        politicoService: mockPoliticoService,
        politicProfileCubit: mockPoliticProfileCubit,
      );
    });

    tearDown(() {
      searchPoliticCubit?.close();
    });

    test('asserts', () {
      expect(
          () => SearchPoliticCubit(
                userFollowingPoliticsRepository: null,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileCubit: mockPoliticProfileCubit,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticCubit(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: null,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileCubit: mockPoliticProfileCubit,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticCubit(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: null,
                partidoService: mockPartidoService,
                politicProfileCubit: mockPoliticProfileCubit,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticCubit(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: null,
                politicProfileCubit: mockPoliticProfileCubit,
              ),
          throwsAssertionError);
      expect(
          () => SearchPoliticCubit(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: mockFollowRepository,
                politicoService: mockPoliticoService,
                partidoService: mockPartidoService,
                politicProfileCubit: null,
              ),
          throwsAssertionError);
    });

    test('''Expects InitialSearchPoliticState to be the initial state''', () {
      expect(searchPoliticCubit.state, equals(InitialSearchPoliticState()));
    });

    blocTest(
      '''Expects [LoadingFetchPolitics, FetchSearchPoliticsSuccess] when FetchPolitics added''',
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        return;
      },
      verify: (searchPoliticCubit) async {
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
      build: () {
        when(mockPoliticoService.getAllPoliticos()).thenThrow(Exception());
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        return;
      },
      verify: (searchPoliticCubit) async {
        verify(mockPoliticoService.getAllPoliticos()).called(1);
      },
      expect: [
        LoadingFetchPolitics(),
        FetchSearchPoliticsFailed(),
      ],
    );

    blocTest(
      'Expects [SearchPoliticFilterChanged] when state filter',
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeSearchPoliticFilter(estado: 'CE');
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
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeSearchPoliticFilter(partido: 'PT');
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
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeSearchPoliticFilter(term: 'J');
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
      build: () {
        when(mockPoliticoService.getAllPoliticos()).thenAnswer(
          (_) => Future.value([
            PoliticoModel(id: '1', nomeEleitoral: 'João'),
          ]),
        );
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer(
          (_) => Future.value([]),
        );
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeSearchPoliticFilter(term: 'Joa');
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
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeSearchPoliticFilter(term: 'J');
        searchPoliticCubit.changeSearchPoliticFilter(term: 'JW');
        searchPoliticCubit.changeSearchPoliticFilter(term: 'J');
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
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.followUnfollowSearchPolitic(
          user: UserModel(
            userId: '1',
          ),
          politico: PoliticoModel(
            id: '1',
            nomeEleitoral: 'Joao',
          ),
        );
        return;
      },
      verify: (searchPoliticCubit) async {
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
      build: () {
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
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.followUnfollowSearchPolitic(
          user: UserModel(
            userId: '1',
          ),
          politico: PoliticoModel(
            id: '1',
            nomeEleitoral: 'Joao',
          ),
        );
        return;
      },
      verify: (searchPoliticCubit) async {
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
      build: () {
        when(mockFollowRepository.followPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        when(mockFollowRepository.unfollowPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        return searchPoliticCubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.followUnfollowSearchPolitic(
          user: UserModel(
            userId: '1',
          ),
          politico: PoliticoModel(
            id: '1',
          ),
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
      build: () {
        final mockPoliticProfileCubit = MockPoliticProfileCubit();
        final cubit = SearchPoliticCubit(
          userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
          followRepository: mockFollowRepository,
          partidoService: mockPartidoService,
          politicoService: mockPoliticoService,
          politicProfileCubit: mockPoliticProfileCubit,
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
        return cubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeFollowPoliticStatus(
          politico: PoliticoModel(id: '1'),
          isUserFollowingPolitic: false,
        );
        return;
      },
      verify: (searchPoliticCubit) async {
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
      build: () {
        final mockPoliticProfileCubit = MockPoliticProfileCubit();
        whenListen(
          mockPoliticProfileCubit,
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
        final cubit = SearchPoliticCubit(
          userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
          followRepository: mockFollowRepository,
          partidoService: mockPartidoService,
          politicoService: mockPoliticoService,
          politicProfileCubit: mockPoliticProfileCubit,
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
        return cubit;
      },
      act: (searchPoliticCubit) {
        searchPoliticCubit.fetchPolitics('1');
        searchPoliticCubit.changeFollowPoliticStatus(
          politico: PoliticoModel(id: '1'),
          isUserFollowingPolitic: false,
        );
        return;
      },
      verify: (searchPoliticCubit) async {
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
