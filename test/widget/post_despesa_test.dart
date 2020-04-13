import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/post/post_despesa.dart';

import '../mock.dart';
import 'utils.dart';

void main() {
  initLocator(MockSharedPreferences());
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  DespesaModel despesa;

  group('PostDespesa tests', () {
    setUp(() {
      despesa = DespesaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        nomeFornecedor: 'fornecedor',
        tipoAtividade: 'ativi',
        tipoDespesa: 'despesa',
        valorLiquido: '3.51',
        valorDocumento: '3.51',
        valorGlosa: '3.51',
        dataDocumento: '10-01-2020',
        urlDocumento: 'urlDoc',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(despesa),
          ),
        ),
      );
    });

    testWidgets('should do something when click on card', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(despesa),
          ),
        ),
      );
      final card = find.byKey(const ValueKey('card-base-content'));
      expect(card, findsOneWidget);
      await tester.tap(card);
    });

    testWidgets('should do something when click on share btn', (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(despesa),
          ),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.shareAlt) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should do something when click on bookmark btn',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(despesa),
          ),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.bookmark) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should go to profile page when click on politic photo',
        (tester) async {
      final mockPostBloc = MockPostBloc();
      when(mockPostBloc.isPostFavorite).thenReturn(false);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PostBloc>(
            bloc: mockPostBloc,
            page: PostDespesa(despesa),
          ),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });
  });
}
