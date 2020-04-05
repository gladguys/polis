import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';

import '../mock.dart';

void main() {
  group('PoliticProfileBloc tests', () {
    PoliticProfileBloc politicProfileBloc;
    MockPoliticProfileRepository mockPoliticProfileRepository;
    MockFollowRepository mockFollowRepository;

    setUp(() {
      mockPoliticProfileRepository = MockPoliticProfileRepository();
      mockFollowRepository = MockFollowRepository();
      politicProfileBloc = PoliticProfileBloc(
        user: UserModel(),
        politicProfileRepository: mockPoliticProfileRepository,
        followRepository: mockFollowRepository,
      );
    });

    test('asserts', () {
      expect(
          () => PoliticProfileBloc(
                user: null,
                politicProfileRepository: mockPoliticProfileRepository,
                followRepository: mockFollowRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticProfileBloc(
                user: UserModel(),
                politicProfileRepository: null,
                followRepository: mockFollowRepository,
              ),
          throwsAssertionError);
      expect(
          () => PoliticProfileBloc(
                user: UserModel(),
                politicProfileRepository: mockPoliticProfileRepository,
                followRepository: null,
              ),
          throwsAssertionError);
    });

    test('Expects InitialPoliticProfileState to be the initial state', () {
      expect(politicProfileBloc.state, equals(InitialPoliticProfileState()));
    });

    group('GetPoliticInfo event', () {
      blocTest(
        '''Expects [LoadingPoliticInfo, GetPoliticInfoSuccess] when success''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(
                id: '1',
              ),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value([
              DespesaModel(
                codDocumento: '123',
              )
            ]),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
          verify(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
            ),
            lastActivities: [
              DespesaModel(
                codDocumento: '123',
              )
            ],
            isBeingFollowedByUser: true,
          ),
        ],
      );

      blocTest(
        '''Expects [LoadingPoliticInfo, GetPoliticInfoFailed] when fails''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1'))
              .thenThrow(Exception());
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoFailed(),
        ],
      );
    });

    group('FollowUnfollowProfilePolitic event', () {
      blocTest(
        '''Expects [UserFollowingPoliticChanged, GetPoliticInfoSuccess, UserFollowingPoliticChanged] when politic followed and increments quantidadeSeguidores''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(
                id: '1',
                quantidadeSeguidores: 5,
              ),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value([
              DespesaModel(
                codDocumento: '123',
              )
            ]),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc
              .add(FollowUnfollowProfilePolitic(isFollowing: false));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
          verify(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .called(1);
          verify(mockFollowRepository.followPolitic(
                  user: anyNamed('user'), politico: anyNamed('politico')))
              .called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [
              DespesaModel(
                codDocumento: '123',
              )
            ],
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(isUserFollowingPolitic: true),
        ],
      );

      blocTest(
        '''Expects [UserFollowingPoliticChanged, GetPoliticInfoSuccess, UserFollowingPoliticChanged] when politic followed and decrements quantidadeSeguidores''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(
                id: '1',
                quantidadeSeguidores: 5,
              ),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value([
              DespesaModel(
                codDocumento: '123',
              )
            ]),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc
              .add(FollowUnfollowProfilePolitic(isFollowing: true));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
          verify(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .called(1);
          verify(mockFollowRepository.unfollowPolitic(
                  user: anyNamed('user'), politico: anyNamed('politico')))
              .called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [
              DespesaModel(
                codDocumento: '123',
              )
            ],
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(isUserFollowingPolitic: false),
        ],
      );

      blocTest(
        '''Expects [UserFollowingPoliticChanged, GetPoliticInfoSuccess, UserFollowingPoliticChanged, FollowPoliticFailed] when politic followed and decrements quantidadeSeguidores''',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(
                id: '1',
                quantidadeSeguidores: 5,
              ),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value([
              DespesaModel(
                codDocumento: '123',
              )
            ]),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          when(mockFollowRepository.unfollowPolitic(
                  user: anyNamed('user'), politico: anyNamed('politico')))
              .thenThrow(Exception());
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc
              .add(FollowUnfollowProfilePolitic(isFollowing: true));
          return;
        },
        verify: (politicProfileBloc) async {
          verify(mockPoliticProfileRepository.getInfoPolitic('1')).called(1);
          verify(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .called(1);
          verify(mockFollowRepository.unfollowPolitic(
                  user: anyNamed('user'), politico: anyNamed('politico')))
              .called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [
              DespesaModel(
                codDocumento: '123',
              )
            ],
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(isUserFollowingPolitic: false),
          FollowPoliticFailed(),
        ],
      );
    });
  });
}
