import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/card_base.dart';
import 'package:polis/widget/error_container.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  MockUserFollowingPoliticsBloc mockUserFollowingPoliticsBloc;

  group('UserFollowingPoliticsPage tests', () {
    setUp(() {
      mockUserFollowingPoliticsBloc = MockUserFollowingPoliticsBloc();
    });

    test('asserts', () {
      expect(
        () => UserFollowingPoliticsPageConnected(user: null),
        throwsAssertionError,
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserFollowingPoliticsBloc>(
            bloc: mockUserFollowingPoliticsBloc,
            page: UserFollowingPoliticsPage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      final user = UserModel(
        userId: '1',
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: user,
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: UserFollowingPoliticsPageConnected(
              user: user,
            ),
          ),
        ),
      );
    });

    testWidgets(
        '''should return list of politics when FetchPoliticsSuccess and politic being followed''',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(true);
      when(mockUserFollowingPoliticsBloc.state).thenReturn(
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            )
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserProfileBloc>(
              bloc: MockUserProfileBloc(),
              page: PageConnected<UserFollowingPoliticsBloc>(
                bloc: mockUserFollowingPoliticsBloc,
                page: UserFollowingPoliticsPage(),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('should show error container when theres an error',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(true);
      when(mockUserFollowingPoliticsBloc.state)
          .thenReturn(FetchPoliticsFailed());
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserFollowingPoliticsBloc>(
              bloc: mockUserFollowingPoliticsBloc,
              page: UserFollowingPoliticsPage(),
            ),
          ),
        ),
      );
      expect(find.byType(ErrorContainer), findsOneWidget);
    });

    testWidgets(
        '''should return list of politics when FetchPoliticsSuccess and politic not being followed''',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(false);
      when(mockUserFollowingPoliticsBloc.state).thenReturn(
        FetchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            )
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserProfileBloc>(
              bloc: MockUserProfileBloc(),
              page: PageConnected<UserFollowingPoliticsBloc>(
                bloc: mockUserFollowingPoliticsBloc,
                page: UserFollowingPoliticsPage(),
              ),
            ),
          ),
        ),
      );
    });

    testWidgets(
        '''should return list of two politics when FetchPoliticsSuccess and politic being followed''',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(true);
      when(mockUserFollowingPoliticsBloc.state).thenReturn(
        FetchPoliticsSuccess(
          [
            PoliticoModel(id: '1', nomeEleitoral: 'nome', urlFoto: 'photo'),
            PoliticoModel(id: '2', nomeEleitoral: 'nome2', urlFoto: 'photo2'),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserProfileBloc>(
              bloc: MockUserProfileBloc(),
              page: PageConnected<UserFollowingPoliticsBloc>(
                bloc: mockUserFollowingPoliticsBloc,
                page: UserFollowingPoliticsPage(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(CardBase), findsNWidgets(2));
    });

    testWidgets('''should call bloc when clicked follow button''',
        (tester) async {
      final mockUserProfileBloc = MockUserProfileBloc();
      when(mockUserProfileBloc.user).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      when(mockUserFollowingPoliticsBloc.isPoliticBeingFollowed(any))
          .thenReturn(true);
      when(mockUserFollowingPoliticsBloc.state).thenReturn(
        FetchPoliticsSuccess(
          [
            PoliticoModel(id: '1', nomeEleitoral: 'nome', urlFoto: 'photo'),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserProfileBloc>(
              bloc: mockUserProfileBloc,
              page: PageConnected<UserFollowingPoliticsBloc>(
                bloc: mockUserFollowingPoliticsBloc,
                page: UserFollowingPoliticsPage(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(CardBase), findsWidgets);
      final followUnfollowButton = find.byKey(followUnfollowButtonKey).first;
      expect(followUnfollowButton, findsOneWidget);
      await tester.tap(followUnfollowButton);
      verify(
        mockUserFollowingPoliticsBloc.add(
          FollowUnfollowPolitic(
            user: UserModel(
              userId: '1',
            ),
            politico:
                PoliticoModel(id: '1', nomeEleitoral: 'nome', urlFoto: 'photo'),
          ),
        ),
      );
    });

    testWidgets('should not return list when FetchPoliticsSuccess and is empty',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.state)
          .thenReturn(FetchPoliticsSuccess([]));
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserFollowingPoliticsBloc>(
              bloc: mockUserFollowingPoliticsBloc,
              page: UserFollowingPoliticsPage(),
            ),
          ),
        ),
      );
    });

    testWidgets('should return list of politics when PoliticsFilteredByTerm',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.state)
          .thenReturn(PoliticsFilteredByTerm(filteredPolitics: []));
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserFollowingPoliticsBloc>(
              bloc: mockUserFollowingPoliticsBloc,
              page: UserFollowingPoliticsPage(),
            ),
          ),
        ),
      );
    });

    testWidgets('should return list of politics when FollowedPoliticsUpdated',
        (tester) async {
      when(mockUserFollowingPoliticsBloc.state).thenReturn(
        FollowedPoliticsUpdated(
          followedPolitics: [],
          politicoUpdated: PoliticoModel(),
          isFollowing: true,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(
                userId: '1',
              ),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: PageConnected<UserFollowingPoliticsBloc>(
              bloc: mockUserFollowingPoliticsBloc,
              page: UserFollowingPoliticsPage(),
            ),
          ),
        ),
      );
    });
  });
}
