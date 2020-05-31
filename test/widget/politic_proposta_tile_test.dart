import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/widget/tile/politic_proposta_tile_connected.dart';

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

  group('PoliticPropostaTile tests', () {
    setUp(() {
      proposta = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        ementa: 'ementa',
        siglaPartido: 'sigla',
        tipoDocumento: 'tipo',
        status: 'status',
        dataAtualizacao: '10-01-2020',
        visualizado: false,
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticPropostaTileConnected(proposta),
        ),
      );
    });

    testWidgets('should do something when click on card', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticPropostaTileConnected(proposta),
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
          PoliticPropostaTileConnected(proposta),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });
  });

  testWidgets(
      'should style diferent when descricaoTipo equals PLENARY_AMENDMENT',
      (tester) async {
    final propostaDesc = PropostaModel(
      fotoPolitico: 'foto',
      nomePolitico: 'nome',
      descricaoTipo: PLENARY_AMENDMENT,
      ementa: 'ementa',
      siglaPartido: 'sigla',
      tipoDocumento: 'tipo',
      status: 'status',
      dataAtualizacao: '10-01-2020',
      visualizado: false,
    );
    await tester.pumpWidget(
      connectedWidget(
        PoliticPropostaTileConnected(propostaDesc),
      ),
    );
    final text = find.text(PLENARY_AMENDMENT);
    expect(text, findsOneWidget);
  });
}
