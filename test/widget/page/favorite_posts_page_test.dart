import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/favorite_posts/widget/favorites_post_list.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
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

  test('assert', () {
    expect(() => FavoritesPostList(
      null
    ), throwsAssertionError);
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

    testWidgets('should show timeline of favorite posts when fetch success',
        (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockFavoritePostsBloc.state).thenReturn(
        FetchUserFavoritePostsSuccess(
          [
            PropostaModel(
              nomePolitico: 'nome',
              dataAtualizacao: '10-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
          ],
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: PageConnected<FavoritePostsBloc>(
              bloc: mockFavoritePostsBloc,
              page: FavoritePostsPage(),
            ),
          ),
        ),
      );
      expect(find.byType(ListView), findsOneWidget);
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
