import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';
import 'package:tuple/tuple.dart';

import '../mock.dart';

void main() {
  group('PoliticProfileBloc tests', () {
    PoliticProfileBloc politicProfileBloc;
    MockPoliticProfileRepository mockPoliticProfileRepository;
    MockFollowRepository mockFollowRepository;
    MockUrlLauncherService mockUrlLauncherService;

    setUp(() {
      mockPoliticProfileRepository = MockPoliticProfileRepository();
      mockFollowRepository = MockFollowRepository();
      mockUrlLauncherService = MockUrlLauncherService();
      politicProfileBloc = PoliticProfileBloc(
        user: UserModel(),
        politicProfileRepository: mockPoliticProfileRepository,
        followRepository: mockFollowRepository,
        urlLauncherService: mockUrlLauncherService,
      );
    });

    test('asserts', () {
      expect(
          () => PoliticProfileBloc(
                user: null,
                politicProfileRepository: mockPoliticProfileRepository,
                followRepository: mockFollowRepository,
                urlLauncherService: mockUrlLauncherService,
              ),
          throwsAssertionError);
      expect(
          () => PoliticProfileBloc(
                user: UserModel(),
                politicProfileRepository: null,
                followRepository: mockFollowRepository,
                urlLauncherService: mockUrlLauncherService,
              ),
          throwsAssertionError);
      expect(
          () => PoliticProfileBloc(
                user: UserModel(),
                politicProfileRepository: mockPoliticProfileRepository,
                followRepository: null,
                urlLauncherService: mockUrlLauncherService,
              ),
          throwsAssertionError);
      expect(
          () => PoliticProfileBloc(
                user: UserModel(),
                politicProfileRepository: mockPoliticProfileRepository,
                followRepository: mockFollowRepository,
                urlLauncherService: null,
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
            (_) => Future.value(
              Tuple2<List<dynamic>, DocumentSnapshot>([
                DespesaModel(
                  codDocumento: '123',
                )
              ], null),
            ),
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
            activitiesCount: 1,
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
            (_) => Future.value(
              Tuple2<List<dynamic>, DocumentSnapshot>([
                DespesaModel(
                  codDocumento: '123',
                )
              ], null),
            ),
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
            activitiesCount: 1,
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(
            politico: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            isUserFollowingPolitic: true,
          ),
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
            (_) => Future.value(
              Tuple2<List<dynamic>, DocumentSnapshot>([
                DespesaModel(
                  codDocumento: '123',
                )
              ], null),
            ),
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
            activitiesCount: 1,
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(
            politico: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            isUserFollowingPolitic: false,
          ),
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
            (_) => Future.value(
              Tuple2<List<dynamic>, DocumentSnapshot>([
                DespesaModel(
                  codDocumento: '123',
                )
              ], null),
            ),
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
            activitiesCount: 1,
            isBeingFollowedByUser: true,
          ),
          UserFollowingPoliticChanged(
            politico: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            isUserFollowingPolitic: false,
          ),
          FollowPoliticFailed(),
        ],
      );
    });

    group('SendEmailToPolitic event', () {
      blocTest(
        'should send email to politic when email is valid',
        build: () async {
          when(mockUrlLauncherService.canLaunchEmailUrl(any))
              .thenAnswer((_) => Future.value(true));
          when(mockUrlLauncherService.launchEmailUrl(any))
              .thenAnswer((_) => Future.value(true));
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(id: '1', email: 'aValidEmail@gmail.com'),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value(
              const Tuple2<List<dynamic>, DocumentSnapshot>(
                [],
                null,
              ),
            ),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) async {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc.add(SendEmailToPolitic());
        },
        verify: (politicProfileBloc) async {
          verify(mockUrlLauncherService.canLaunchEmailUrl(any)).called(1);
          verify(mockUrlLauncherService.launchEmailUrl(any)).called(1);
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [],
            activitiesCount: 0,
            isBeingFollowedByUser: true,
          ),
        ],
      );

      blocTest(
        'should yield OpenEmailIntentFailed when open intent failed',
        build: () async {
          when(mockUrlLauncherService.canLaunchEmailUrl(any))
              .thenAnswer((_) => Future.value(false));
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(id: '1', email: 'aValidEmail@gmail.com'),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value(
              const Tuple2<List<dynamic>, DocumentSnapshot>(
                [],
                null,
              ),
            ),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) async {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc.add(SendEmailToPolitic());
        },
        verify: (politicProfileBloc) async {
          verify(mockUrlLauncherService.canLaunchEmailUrl(any)).called(1);
          verifyNever(mockUrlLauncherService.launchEmailUrl(any));
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [],
            activitiesCount: 0,
            isBeingFollowedByUser: true,
          ),
          OpenEmailIntentFailed(),
        ],
      );

      blocTest(
        'should yield OpenEmailIntentFailed when open intent failed',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(id: '1', email: 'aNotValidEmail@gmail'),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value(
              const Tuple2<List<dynamic>, DocumentSnapshot>(
                [],
                null,
              ),
            ),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) async {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc.add(SendEmailToPolitic());
        },
        verify: (politicProfileBloc) async {
          verifyNever(mockUrlLauncherService.canLaunchEmailUrl(any));
          verifyNever(mockUrlLauncherService.launchEmailUrl(any));
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [],
            activitiesCount: 0,
            isBeingFollowedByUser: true,
          ),
          PoliticDontHaveValidEmail(),
        ],
      );
    });

    group('GetMoreActivities', () {
      blocTest(
        'should yield GetPoliticInfoSuccess when get more activities',
        build: () async {
          when(mockPoliticProfileRepository.getInfoPolitic('1')).thenAnswer(
            (_) => Future.value(
              PoliticoModel(id: '1', email: 'aNotValidEmail@gmail'),
            ),
          );
          when(mockPoliticProfileRepository.getLastActivities(
                  politicId: '1', count: 5))
              .thenAnswer(
            (_) => Future.value(
              const Tuple2<List<dynamic>, DocumentSnapshot>(
                [],
                null,
              ),
            ),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          when(mockPoliticProfileRepository.getMoreActivities(
                  politicId: '1',
                  count: 5,
                  lastDocument: MockDocumentSnapshot()))
              .thenAnswer(
            (_) => Future.value(Tuple2(
              [PoliticoModel(id: '1', email: 'email@gmail')],
              MockDocumentSnapshot(),
            )),
          );
          when(mockFollowRepository.isPoliticBeingFollowed(
                  user: anyNamed('user'), politicId: anyNamed('politicId')))
              .thenAnswer((_) async => true);
          return politicProfileBloc;
        },
        act: (politicProfileBloc) async {
          politicProfileBloc.add(GetPoliticInfo('1'));
          politicProfileBloc.add(GetMoreActivities('1'));
        },
        expect: [
          LoadingPoliticInfo(),
          GetPoliticInfoSuccess(
            politic: PoliticoModel(
              id: '1',
              quantidadeSeguidores: 5,
            ),
            lastActivities: [PoliticoModel(id: '1', email: 'email@gmail')],
            activitiesCount: 0,
            isBeingFollowedByUser: true,
          ),
        ],
      );

      blocTest(
        '''Expects [GetPoliticInfoFailed] when fails''',
        build: () async {
          when(mockPoliticProfileRepository.getMoreActivities(
                  politicId: anyNamed('politicId'),
                  count: anyNamed('count'),
                  lastDocument: anyNamed('lastDocument')))
              .thenThrow(Exception());
          return politicProfileBloc;
        },
        act: (politicProfileBloc) {
          politicProfileBloc.add(GetMoreActivities('1'));
          return;
        },
        expect: [
          GetPoliticInfoFailed(),
        ],
      );
    });
  });
}
