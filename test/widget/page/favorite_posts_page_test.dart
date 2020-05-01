import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/timeline/widget/timeline.dart';
import 'package:polis/widget/empty_info.dart';
import 'package:polis/widget/loading.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockFavoritePostsBloc mockFavoritePostsBloc;

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('FavoritePostsPage tests', () {
    setUp(() {
      mockFavoritePostsBloc = MockFavoritePostsBloc();
    });

    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(FavoritePostsPageConnected()));
    });

    testWidgets('shoud show EmptyInfo  when fetch success but theres no post',
        (tester) async {
      when(mockFavoritePostsBloc.state)
          .thenReturn(FetchUserFavoritePostsSuccess([]));
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<FavoritePostsBloc>(
            bloc: mockFavoritePostsBloc,
            page: FavoritePostsPage(),
          ),
        ),
      );
      expect(find.byType(EmptyInfo), findsOneWidget);
    });

    testWidgets('shoud show timeline of favorite posts when fetch success',
        (tester) async {
      when(mockFavoritePostsBloc.state).thenReturn(
        FetchUserFavoritePostsSuccess(
          [
            PropostaModel(
              nomePolitico: 'nome',
              dataDocumento: '10-01-2020',
              dataApresentacao: '10-01-2020',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<FavoritePostsBloc>(
            bloc: mockFavoritePostsBloc,
            page: FavoritePostsPage(),
          ),
        ),
      );
      expect(find.byType(Timeline), findsOneWidget);
    });

    testWidgets('shoud show loading widget', (tester) async {
      when(mockFavoritePostsBloc.state).thenReturn(LoadingFavoritesPosts());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<FavoritePostsBloc>(
            bloc: mockFavoritePostsBloc,
            page: FavoritePostsPage(),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });
  });
}
