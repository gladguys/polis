import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/enum/acao_type.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/user_profile/widget/activities_list.dart';
import 'package:polis/page/user_profile/widget/logout_button.dart';
import 'package:polis/page/user_profile/widget/personal_user_info.dart';
import 'package:polis/page/user_profile/widget/politics_following_quantity.dart';
import 'package:polis/page/user_profile/widget/user_activities.dart';
import 'package:polis/page/user_profile/widget/user_profile_skeleton.dart';
import 'package:polis/widget/error_container.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockUserProfileBloc mockUserProfileBloc;
  List<PoliticoModel> politicsFollowing;

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('UserProfilePage tests', () {
    setUp(() {
      politicsFollowing = [
        PoliticoModel(
          id: '1',
          nomeCivil: 'nome',
          urlFoto: 'foto',
        )
      ];
      mockUserProfileBloc = MockUserProfileBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: UserBloc(
              repository: MockUserRepository(),
              user: UserModel(),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            page: PageConnected<UserProfileBloc>(
              bloc: mockUserProfileBloc,
              page: UserProfilePage(),
            ),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              repository: MockUserRepository(),
              user: UserModel(),
              analyticsService: MockAnalyticsService(),
              sharedPreferencesService: MockSharedPreferencesService(),
            ),
            child: UserProfilePageConnected(),
          ),
        ),
      );
    });

    testWidgets('should build info when success with no activity',
        (tester) async {
      provideMockedNetworkImages(() async {
        when(mockUserProfileBloc.state).thenReturn(
          FetchUserRelatedInfoSuccess(
            userActions: [],
            politicsFollowing: politicsFollowing,
          ),
        );
        when(mockUserProfileBloc.userActions).thenReturn([]);
        when(mockUserProfileBloc.politicsFollowing)
            .thenReturn(politicsFollowing);
        await tester.pumpWidget(
          connectedWidget(
            BlocProvider(
              create: (_) => UserBloc(
                repository: MockUserRepository(),
                user: UserModel(
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
                analyticsService: MockAnalyticsService(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
              child: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.byType(PersonalUserInfo), findsOneWidget);
        expect(find.byType(PoliticsFollowingQuantity), findsOneWidget);
        expect(find.byType(UserActions), findsOneWidget);
      });
    });

    testWidgets('should build info when success with activity', (tester) async {
      provideMockedNetworkImages(() async {
        when(mockUserProfileBloc.state).thenReturn(
          FetchUserRelatedInfoSuccess(
            userActions: [
              AcaoUsuarioModel(
                idPolitico: '1',
                mensagem: 'mensagem',
                tipo: AcaoType.follow,
                data: DateTime.now(),
                nomePolitico: 'Nome',
                urlFotoPolitico: 'foto',
              ),
              AcaoUsuarioModel(
                idPolitico: '1',
                mensagem: 'mensagem',
                tipo: AcaoType.unfollow,
                data: DateTime.now(),
                nomePolitico: 'Nome',
                urlFotoPolitico: 'foto',
              ),
            ],
            politicsFollowing: politicsFollowing,
          ),
        );
        when(mockUserProfileBloc.userActions).thenReturn(
          [
            AcaoUsuarioModel(
              idPolitico: '1',
              mensagem: 'mensagem',
              tipo: AcaoType.follow,
              data: DateTime.now(),
              nomePolitico: 'Nome',
              urlFotoPolitico: 'foto',
            ),
            AcaoUsuarioModel(
              idPolitico: '1',
              mensagem: 'mensagem',
              tipo: AcaoType.unfollow,
              data: DateTime.now(),
              nomePolitico: 'Nome',
              urlFotoPolitico: 'foto',
            ),
          ],
        );
        when(mockUserProfileBloc.politicsFollowing)
            .thenReturn(politicsFollowing);
        await tester.pumpWidget(
          connectedWidget(
            BlocProvider(
              create: (_) => UserBloc(
                repository: MockUserRepository(),
                user: UserModel(
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
                analyticsService: MockAnalyticsService(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
              child: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.byType(PersonalUserInfo), findsOneWidget);
        expect(find.byType(PoliticsFollowingQuantity), findsOneWidget);
        expect(find.byType(UserActions), findsOneWidget);
        expect(find.byType(UserActionsList), findsOneWidget);
      });
    });

    testWidgets('should build loading', (tester) async {
      provideMockedNetworkImages(() async {
        when(mockUserProfileBloc.state).thenReturn(LoadingFetchUserInfo());
        await tester.pumpWidget(
          connectedWidget(
            BlocProvider(
              create: (_) => UserBloc(
                repository: MockUserRepository(),
                user: UserModel(
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
                analyticsService: MockAnalyticsService(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
              child: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.byType(UserProfileSkeleton), findsOneWidget);
      });
    });

    testWidgets('should build info when failed', (tester) async {
      provideMockedNetworkImages(() async {
        when(mockUserProfileBloc.state)
            .thenReturn(FetchUserRelatedInfoFailed());
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<UserBloc>(
              bloc: UserBloc(
                repository: MockUserRepository(),
                user: UserModel(
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
                analyticsService: MockAnalyticsService(),
                sharedPreferencesService: MockSharedPreferencesService(),
              ),
              page: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.byType(ErrorContainer), findsOneWidget);
      });
    });

    testWidgets('should build with logout button', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(
        UserModel(
          name: 'name',
          email: 'email',
          photoUrl: 'photo',
        ),
      );
      final mockUserProfileBloc = MockUserProfileBloc();
      when(mockUserProfileBloc.state).thenReturn(
        FetchUserRelatedInfoSuccess(
          userActions: [
            AcaoUsuarioModel(
              idPolitico: '1',
              mensagem: 'mensagem',
              tipo: AcaoType.follow,
              data: DateTime.now(),
              nomePolitico: 'Nome',
              urlFotoPolitico: 'foto',
            ),
            AcaoUsuarioModel(
              idPolitico: '1',
              mensagem: 'mensagem',
              tipo: AcaoType.unfollow,
              data: DateTime.now(),
              nomePolitico: 'Nome',
              urlFotoPolitico: 'foto',
            ),
          ],
          politicsFollowing: politicsFollowing,
        ),
      );
      when(mockUserProfileBloc.userActions).thenReturn(
        [
          AcaoUsuarioModel(
            idPolitico: '1',
            mensagem: 'mensagem',
            tipo: AcaoType.follow,
            data: DateTime.now(),
            nomePolitico: 'Nome',
            urlFotoPolitico: 'foto',
          ),
          AcaoUsuarioModel(
            idPolitico: '1',
            mensagem: 'mensagem',
            tipo: AcaoType.unfollow,
            data: DateTime.now(),
            nomePolitico: 'Nome',
            urlFotoPolitico: 'foto',
          ),
        ],
      );
      when(mockUserProfileBloc.politicsFollowing).thenReturn(politicsFollowing);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<UserProfileBloc>(
              bloc: mockUserProfileBloc,
              page: UserProfilePage(),
            ),
          ),
        ),
      );
      final logoutButton = find.byType(LogoutButton);
      expect(logoutButton, findsOneWidget);
      await tester.ensureVisible(logoutButton);
      await tester.tap(logoutButton);
    });
  });
}
