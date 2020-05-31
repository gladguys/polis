import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

import '../mock.dart';

void main() {
  group('UserFollowingPoliticsBloc tests', () {
    UserFollowingPoliticsBloc userFollowingPoliticsBloc;
    MockUserFollowingPoliticsRepository mockUserFollowingPoliticsRepository;
    MockFollowRepository mockFollowRepository;

    setUp(() {
      mockUserFollowingPoliticsRepository =
          MockUserFollowingPoliticsRepository();
      mockFollowRepository = MockFollowRepository();
      userFollowingPoliticsBloc = UserFollowingPoliticsBloc(
        userFollowingPoliticsRepository: mockUserFollowingPoliticsRepository,
        followRepository: mockFollowRepository,
      );
    });

    tearDown(() {
      userFollowingPoliticsBloc?.close();
    });

    test('asserts', () {
      expect(
          () => UserFollowingPoliticsBloc(
                userFollowingPoliticsRepository:
                    mockUserFollowingPoliticsRepository,
                followRepository: null,
              ),
          throwsAssertionError);
      expect(
          () => UserFollowingPoliticsBloc(
                userFollowingPoliticsRepository: null,
                followRepository: mockFollowRepository,
              ),
          throwsAssertionError);
    });

    test(
        '''Expects InitialUserFollowingPoliticsState to be the initial state''',
        () {
      expect(userFollowingPoliticsBloc.state,
          equals(InitialUserFollowingPoliticsState()));
    });

    blocTest(
      '''Expects [LoadingPolitics, FetchPoliticsSuccess] when FetchFollowingPolitics added''',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value([PoliticoModel()]));
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess([PoliticoModel()]),
      ],
    );

    blocTest(
      'Expects [LoadingPolitics, FetchPoliticsFailed] when fails',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenThrow(Exception());
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsFailed(),
      ],
    );

    blocTest(
      '''Expects filter return filtered politics''',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value(
                  [
                    PoliticoModel(
                      nomeEleitoral: 'aaa',
                    ),
                    PoliticoModel(
                      nomeEleitoral: 'bbb',
                    ),
                  ],
                ));
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        userFollowingPoliticsBloc.add(SearchPoliticsByTerm('aaa'));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              nomeEleitoral: 'bbb',
            ),
          ],
        ),
        PoliticsFilteredByTerm(filteredPolitics: [
          PoliticoModel(
            nomeEleitoral: 'aaa',
          ),
        ])
      ],
    );

    blocTest(
      'Expects filter return all when term isEmpty',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value(
                  [
                    PoliticoModel(
                      nomeEleitoral: 'aaa',
                    ),
                    PoliticoModel(
                      nomeEleitoral: 'bbb',
                    ),
                  ],
                ));
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        userFollowingPoliticsBloc.add(SearchPoliticsByTerm(''));
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              nomeEleitoral: 'bbb',
            ),
          ],
        ),
        PoliticsFilteredByTerm(
          filteredPolitics: [
            PoliticoModel(
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              nomeEleitoral: 'bbb',
            ),
          ],
        )
      ],
    );

    blocTest(
      '''Expects [LoadingPolitics, FetchPoliticsSuccess, FollowedPoliticsUpdated] when fails''',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value(
                  [
                    PoliticoModel(
                      id: '1',
                      nomeEleitoral: 'aaa',
                    ),
                    PoliticoModel(
                      id: '2',
                      nomeEleitoral: 'bbb',
                    ),
                  ],
                ));
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        userFollowingPoliticsBloc.add(
          FollowUnfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        );
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
        verify(
          mockFollowRepository.unfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        ).called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
        ),
        FollowedPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
          politicoUpdated: PoliticoModel(
            id: '1',
            nomeEleitoral: 'aaa',
          ),
          isFollowing: true,
        )
      ],
    );

    blocTest(
      '''Expects [LoadingPolitics, FetchPoliticsSuccess, FollowedPoliticsUpdated, FollowedPoliticsUpdated] when fails''',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value(
                  [
                    PoliticoModel(
                      id: '1',
                      nomeEleitoral: 'aaa',
                    ),
                    PoliticoModel(
                      id: '2',
                      nomeEleitoral: 'bbb',
                    ),
                  ],
                ));
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        userFollowingPoliticsBloc.add(
          FollowUnfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        );
        userFollowingPoliticsBloc.add(
          FollowUnfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        );
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
        verify(
          mockFollowRepository.unfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        ).called(1);
        verify(
          mockFollowRepository.followPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        ).called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
        ),
        FollowedPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
          politicoUpdated: PoliticoModel(
            id: '1',
            nomeEleitoral: 'aaa',
          ),
          isFollowing: true,
        ),
        FollowedPoliticsUpdated(
          followedPolitics: [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
          politicoUpdated: PoliticoModel(
            id: '1',
            nomeEleitoral: 'aaa',
          ),
          isFollowing: false,
        ),
      ],
    );

    blocTest(
      '''Expects [LoadingPolitics, FetchPoliticsSuccess, FollowUnfollowFailed] when fails''',
      build: () async {
        when(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .thenAnswer((_) => Future.value(
                  [
                    PoliticoModel(
                      id: '1',
                      nomeEleitoral: 'aaa',
                    ),
                    PoliticoModel(
                      id: '2',
                      nomeEleitoral: 'bbb',
                    ),
                  ],
                ));
        when(mockFollowRepository.followPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        when(mockFollowRepository.unfollowPolitic(
                user: anyNamed('user'), politico: anyNamed('politico')))
            .thenThrow(Exception());
        return userFollowingPoliticsBloc;
      },
      act: (userFollowingPoliticsBloc) {
        userFollowingPoliticsBloc.add(FetchFollowingPolitics(userId: '1'));
        userFollowingPoliticsBloc.add(
          FollowUnfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        );
        return;
      },
      verify: (userFollowingPoliticsBloc) async {
        verify(mockUserFollowingPoliticsRepository.getFollowingPolitics('1'))
            .called(1);
        verify(
          mockFollowRepository.unfollowPolitic(
            user: UserModel(),
            politico: PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
          ),
        ).called(1);
      },
      expect: [
        LoadingPolitics(),
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'aaa',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'bbb',
            ),
          ],
        ),
        FollowUnfollowFailed(),
      ],
    );
  });
}
