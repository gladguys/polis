import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_sugestion/widget/politics_suggested_grid.dart';
import 'package:polis/widget/loading.dart';
import 'package:polis/widget/politic_suggested.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
  });

  group('PoliticSuggestionPage tests', () {
    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(PoliticSuggestionPageConnected('T')),
      );
    });

    testWidgets('should show loading when loading state', (tester) async {
      final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
      when(mockPoliticSuggestionCubit.state).thenReturn(LoadingFetch());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticSuggestionCubit>(
            bloc: mockPoliticSuggestionCubit,
            page: PoliticSuggestionPage(),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('should call SavePoliticsToFollow when click on button',
        (tester) async {
      provideMockedNetworkImages(() async {
        final politicos = [
          PoliticoModel(
            id: '1',
            nomeEleitoral: 'nome',
            urlFoto:
                'https://smalltotall.info/wp-content/uploads/2017/04/google-favicon-vector-400x400.png',
          ),
          PoliticoModel(
            id: '2',
            nomeEleitoral: 'nome2',
            urlFoto:
                'https://smalltotall.info/wp-content/uploads/2017/04/google-favicon-vector-400x400.png',
          ),
        ];
        final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
        when(mockPoliticSuggestionCubit.politics).thenReturn(politicos);
        when(mockPoliticSuggestionCubit.state)
            .thenReturn(FetchSuggestedPoliticsSuccess(politicos));
        when(mockPoliticSuggestionCubit.isPoliticBeenFollowed(any))
            .thenReturn(true);
        final mockUserCubit = MockUserCubit();
        when(mockUserCubit.user).thenReturn(UserModel(userId: '1'));
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<UserCubit>(
              bloc: mockUserCubit,
              page: PageConnected<PoliticSuggestionCubit>(
                bloc: mockPoliticSuggestionCubit,
                page: PoliticSuggestionPage(),
              ),
            ),
          ),
        );
        final readyButton = find.text(READY.toUpperCase());
        expect(readyButton, findsOneWidget);
        await tester.tap(readyButton);
        verify(
          mockPoliticSuggestionCubit.savePoliticsToFollow(
            user: UserModel(userId: '1'),
          ),
        ).called(1);
      });
    });

    testWidgets('should show PoliticsSuggestedGrid when fetch success',
        (tester) async {
      final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
      when(mockPoliticSuggestionCubit.politics).thenReturn([]);
      when(mockPoliticSuggestionCubit.state)
          .thenReturn(FetchSuggestedPoliticsSuccess([]));
      when(mockPoliticSuggestionCubit.isPoliticBeenFollowed(any))
          .thenReturn(true);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticSuggestionCubit>(
            bloc: mockPoliticSuggestionCubit,
            page: PoliticSuggestionPage(),
          ),
        ),
      );
      expect(find.byType(PoliticsSuggestedGrid), findsOneWidget);
    });

    testWidgets('should show 2 PoliticSuggested when the list has 2 items',
        (tester) async {
      provideMockedNetworkImages(() async {
        final politicos = [
          PoliticoModel(
            id: '1',
            nomeEleitoral: 'nome',
            urlFoto: 'aa',
          ),
          PoliticoModel(
            id: '2',
            nomeEleitoral: 'nome2',
            urlFoto: 'bb',
          ),
        ];
        final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
        when(mockPoliticSuggestionCubit.politics).thenReturn(politicos);
        when(mockPoliticSuggestionCubit.state)
            .thenReturn(FetchSuggestedPoliticsSuccess(politicos));
        when(mockPoliticSuggestionCubit.isPoliticBeenFollowed(any))
            .thenReturn(true);
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<PoliticSuggestionCubit>(
              bloc: mockPoliticSuggestionCubit,
              page: PoliticSuggestionPage(),
            ),
          ),
        );
        expect(find.byType(PoliticsSuggestedGrid), findsOneWidget);
        expect(find.byType(PoliticSuggested), findsNWidgets(2));
      });
    });

    testWidgets('should call unfollow event when click on unfollow button',
        (tester) async {
      provideMockedNetworkImages(() async {
        final politicos = [
          PoliticoModel(
            id: '1',
            nomeEleitoral: 'nome',
            urlFoto: '',
          ),
        ];
        final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
        when(mockPoliticSuggestionCubit.politics).thenReturn(politicos);
        when(mockPoliticSuggestionCubit.state)
            .thenReturn(FetchSuggestedPoliticsSuccess(politicos));
        when(mockPoliticSuggestionCubit.isPoliticBeenFollowed(any))
            .thenReturn(true);
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<PoliticSuggestionCubit>(
              bloc: mockPoliticSuggestionCubit,
              page: PoliticSuggestionPage(),
            ),
          ),
        );
        final politicoCard = find.byType(PoliticSuggested);
        expect(politicoCard, findsOneWidget);
        final followButton = find.byType(OutlineButton);
        expect(followButton, findsOneWidget);
        expect(find.text(STOP_FOLLOWING), findsOneWidget);
        await tester.tap(followButton);
        verify(
          mockPoliticSuggestionCubit.followOrUnfollowPolitic(
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
              urlFoto: '',
            ),
          ),
        ).called(1);
      });
    });

    testWidgets('should go to timeline when SavedSuggestedPolitics state',
        (tester) async {
      final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
      whenListen(
        mockPoliticSuggestionCubit,
        Stream.fromIterable(
          [
            InitialPoliticSuggestionState(),
            SavedSuggestedPolitics(),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserCubit>(
            bloc: MockUserCubit(),
            page: PageConnected<PoliticSuggestionCubit>(
              bloc: mockPoliticSuggestionCubit,
              page: PoliticSuggestionPage(),
            ),
          ),
        ),
      );
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should call follow event when click on follow button',
        (tester) async {
      provideMockedNetworkImages(() async {
        final politicos = [
          PoliticoModel(
            id: '1',
            nomeEleitoral: 'nome',
            urlFoto: '',
          ),
        ];
        final mockPoliticSuggestionCubit = MockPoliticSuggestionCubit();
        when(mockPoliticSuggestionCubit.politics).thenReturn(politicos);
        when(mockPoliticSuggestionCubit.state)
            .thenReturn(FetchSuggestedPoliticsSuccess(politicos));
        when(mockPoliticSuggestionCubit.isPoliticBeenFollowed(any))
            .thenReturn(false);
        await tester.pumpWidget(
          connectedWidget(
            PageConnected<PoliticSuggestionCubit>(
              bloc: mockPoliticSuggestionCubit,
              page: PoliticSuggestionPage(),
            ),
          ),
        );
        final politicoCard = find.byType(PoliticSuggested);
        expect(politicoCard, findsOneWidget);
        final followButton = find.byType(OutlineButton);
        expect(followButton, findsOneWidget);
        expect(find.text(FOLLOW), findsOneWidget);
        await tester.tap(followButton);
        verify(
          mockPoliticSuggestionCubit.followOrUnfollowPolitic(
            PoliticoModel(
              id: '1',
              nomeEleitoral: 'nome',
              urlFoto: '',
            ),
          ),
        ).called(1);
      });
    });
  });
}
