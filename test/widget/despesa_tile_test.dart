import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/tile/despesa_tile_connected.dart';

import 'utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  DespesaModel despesa;

  group('DespesaTile tests', () {
    setUp(() {
      despesa = DespesaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        nomeFornecedor: 'fornecedor',
        tipoAtividade: 'ativi',
        tipoDespesa: 'despesa',
        valorLiquido: '3.51',
        dataDocumento: '10-01-2020',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(DespesaTileConnected(despesa)),
      );
    });

    testWidgets('should do something when click on card', (tester) async {
      await tester.pumpWidget(
        connectedWidget(DespesaTileConnected(despesa)),
      );
      final card = find.byKey(const ValueKey('card-base-content'));
      expect(card, findsOneWidget);
      await tester.tap(card);
    });

    testWidgets('should do something when click on like btn', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          connectedWidget(DespesaTileConnected(despesa)),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.thumbsUp) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should do something when click on unlike btn', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          connectedWidget(DespesaTileConnected(despesa)),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.thumbsDown) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should do something when click on comment btn',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          connectedWidget(DespesaTileConnected(despesa)),
        ),
      );
      final likeButton = find.byWidgetPredicate((widget) {
        if (widget is ButtonActionCard &&
            widget.icon == FontAwesomeIcons.comment) {
          return true;
        }
        return false;
      });
      expect(likeButton, findsOneWidget);
      await tester.tap(likeButton);
    });

    testWidgets('should do something when click on share btn', (tester) async {
      await tester.pumpWidget(
        connectedWidget(DespesaTileConnected(despesa)),
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
      await tester.pumpWidget(
        connectedWidget(
          connectedWidget(DespesaTileConnected(despesa)),
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
  });
}
