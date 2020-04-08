import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/search_politic/widgets/search_politic_skeleton.dart';
import 'package:polis/page/search_politic/widgets/search_politics.dart';
import 'package:polis/widget/field_rounded.dart';
import 'package:polis/widget/select/selects.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  setUpAll(() {
    initLocator(MockSharedPreferences());
  });

  group('SearchPoliticPage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(SearchPoliticPageConnected()));
    });

    testWidgets('shoud show SearchPolitics when fetch success', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.state)
          .thenReturn(FetchSearchPoliticsSuccess([]));
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
    });

    testWidgets(
        '''shoud show SearchPoliticsList when fetch success and politic being followed''',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
    });

    testWidgets('shoud go to PoliticProfilePage when click on a politic',
        (tester) async {
      final mockPoliticProfileBloc = MockPoliticProfileBloc();
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.politicProfileBloc)
          .thenAnswer((_) => mockPoliticProfileBloc);
      when(mockPoliticProfileBloc.listen((any))).thenAnswer((_) => null);
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      final politicoTile = find.byKey(const ValueKey('1')).first;
      expect(politicoTile, findsOneWidget);
      await tester.tap(politicoTile);
      await tester.pump();
      await tester.pump();
      expect(find.byType(PoliticProfilePage), findsOneWidget);
    });

    testWidgets('picking a state should thrigger bloc event', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      final fieldRounded = find.byType(FieldRounded);
      expect(fieldRounded, findsOneWidget);
      final sliders = find.byKey(const ValueKey('sliders-icon'));
      expect(sliders, findsOneWidget);
      await tester.tap(sliders);
      await tester.pumpAndSettle();
      expect(find.byType(SearchPolitics), findsOneWidget);
      final estadoSelect = find.byType(EstadoSelect);
      await tester.tap(estadoSelect);
      await tester.pumpAndSettle();
      final opcaoTodos = find.text('Todos');
      expect(opcaoTodos, findsOneWidget);
      await tester.tap(opcaoTodos);
      await tester.pumpAndSettle();
      verify(mockSearchPoliticBloc.add(ChangeSearchPoliticFilter(estado: 'T')))
          .called(1);
    });

    testWidgets('picking a partido should thrigger bloc event', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      final fieldRounded = find.byType(FieldRounded);
      expect(fieldRounded, findsOneWidget);
      final sliders = find.byKey(const ValueKey('sliders-icon'));
      expect(sliders, findsOneWidget);
      await tester.tap(sliders);
      await tester.pumpAndSettle();
      expect(find.byType(SearchPolitics), findsOneWidget);
      final partidoSelect = find.byType(PartidoSelect);
      await tester.tap(partidoSelect);
      await tester.pumpAndSettle();
      final opcaoTodos = find.text('Todos');
      expect(opcaoTodos, findsOneWidget);
      await tester.tap(opcaoTodos);
      await tester.pumpAndSettle();
      verify(mockSearchPoliticBloc.add(ChangeSearchPoliticFilter(partido: 'T')))
          .called(1);
    });

    testWidgets('typing on textfield thriggers bloc event', (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
      final textfield = find.byType(TextField);
      await tester.enterText(textfield, 'a');
      await tester.pumpAndSettle();
      verify(mockSearchPoliticBloc.add(ChangeSearchPoliticFilter(term: 'a')))
          .called(1);
    });

    testWidgets(
        '''shoud add FollowUnfollowSearchPolitic event to bloc when click button''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockUserBloc.user).thenReturn(UserModel(userId: '1'));
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(true);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
              urlFoto: 'foto',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          BlocProvider(
            create: (_) => UserBloc(
              user: UserModel(
                userId: '1',
              ),
              repository: MockUserRepository(),
            ),
            child: PageConnected<UserBloc>(
              bloc: mockUserBloc,
              page: PageConnected<SearchPoliticBloc>(
                bloc: mockSearchPoliticBloc,
                page: SearchPoliticPage(),
              ),
            ),
          ),
        ),
      );
      final followUnfollowButton = find.byType(OutlineButton);
      expect(followUnfollowButton, findsOneWidget);
      await tester.tap(followUnfollowButton);
      verify(mockSearchPoliticBloc.add(any)).called(1);
    });

    testWidgets(
        '''shoud show SearchPoliticsList when fetch success and politic not being followed''',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.isPoliticBeingFollowed(any)).thenReturn(false);
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
        FetchSearchPoliticsSuccess(
          [
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
            ),
            PoliticoModel(
              id: '2',
              nomeEleitoral: 'nome2',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
    });

    testWidgets('shoud show SearchPolitics when filter changes',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.state)
          .thenReturn(SearchPoliticFilterChanged([]));
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
    });

    testWidgets(
        'shoud show SearchPolitics when filter politic followed or unfollowed',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.allPartidos).thenReturn([]);
      when(mockSearchPoliticBloc.state).thenReturn(
          FollowedSearchPoliticsUpdated(
              followedPolitics: [],
              isFollowing: true,
              politicoUpdated: PoliticoModel()));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPolitics), findsOneWidget);
    });

    testWidgets('shoud show skeleton loading when loading state',
        (tester) async {
      final mockSearchPoliticBloc = MockSearchPoliticBloc();
      when(mockSearchPoliticBloc.state).thenReturn(LoadingFetchPolitics());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<SearchPoliticBloc>(
            bloc: mockSearchPoliticBloc,
            page: SearchPoliticPage(),
          ),
        ),
      );
      expect(find.byType(SearchPoliticSkeleton), findsOneWidget);
    });
  });
}
