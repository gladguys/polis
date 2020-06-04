import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/tile/favorite_proposta_tile_connected.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  PropostaModel proposta;

  group('FavoritePropostaTile tests', () {
    setUp(() {
      proposta = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        visualizado: false,
        urlPartidoLogo: 'url',
        dataAtualizacao: '10-01-2020',
        foiAtualizada: false,
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          FavoritePropostaTileConnected(proposta),
        ),
      );
    });

    testWidgets('should build with plenarry amendment', (tester) async {
      final propostaWithAmendment = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        visualizado: false,
        urlPartidoLogo: 'url',
        dataAtualizacao: '10-01-2020',
        descricaoTipo: PLENARY_AMENDMENT,
        foiAtualizada: true,
      );
      await tester.pumpWidget(
        connectedWidget(
          FavoritePropostaTileConnected(propostaWithAmendment),
        ),
      );
      expect(find.text(PLENARY_AMENDMENT), findsOneWidget);
    });

    testWidgets('should do something when click on card', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          FavoritePropostaTileConnected(proposta),
        ),
      );
      final card = find.byKey(cardBaseContentKey);
      expect(card, findsOneWidget);
      await tester.tap(card);
    });

    testWidgets('should go to profile page when click on politic photo',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          FavoritePropostaTileConnected(proposta),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('should do something when click on bookmark btn',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          FavoritePropostaTileConnected(proposta),
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
