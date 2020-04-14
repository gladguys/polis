import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/enum/acao_type.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/user_profile/widget/activities_list.dart';
import 'package:polis/page/user_profile/widget/personal_user_info.dart';
import 'package:polis/page/user_profile/widget/politics_following_quantity.dart';
import 'package:polis/page/user_profile/widget/user_activities.dart';
import 'package:polis/widget/centered_loading.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);
  MockUserProfileBloc mockUserProfileBloc;

  group('UserProfilePage tests', () {
    setUp(() {
      mockUserProfileBloc = MockUserProfileBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserProfileBloc>(
            bloc: mockUserProfileBloc,
            page: UserProfilePage(),
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
            userActivities: [],
            politicsFollowing: [
              PoliticoModel(
                id: '1',
                nomeCivil: 'nome',
                urlFoto: 'foto',
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
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
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
            userActivities: [
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
            politicsFollowing: [
              PoliticoModel(
                id: '1',
                nomeCivil: 'nome',
                urlFoto: 'foto',
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
                  name: 'name',
                  email: 'email',
                  photoUrl: 'photo',
                ),
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
              ),
              child: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.byType(CenteredLoading), findsOneWidget);
      });
    });

    testWidgets('should build info when success', (tester) async {
      provideMockedNetworkImages(() async {
        when(mockUserProfileBloc.state)
            .thenReturn(FetchUserRelatedInfoFailed());
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
              ),
              child: PageConnected<UserProfileBloc>(
                bloc: mockUserProfileBloc,
                page: UserProfilePage(),
              ),
            ),
          ),
        );
        expect(find.text(ERROR_FETCHING_USER_INFO), findsOneWidget);
      });
    });
  });
}
