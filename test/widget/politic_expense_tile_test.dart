import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/despesa_model.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/widget/card_base.dart';
import 'package:polis/widget/tile/politic_expense_tile.dart';

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

  DespesaModel despesa;

  group('PoliticExpenseTile tests', () {
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
        visualizado: false,
        urlPartidoLogo: 'logo',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticExpenseTile(despesa),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticExpenseTile(despesa),
          useDarkMode: true,
        ),
      );
    });

    testWidgets('should go to PostPage when click', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticExpenseTile(despesa),
          useDarkMode: true,
        ),
      );
      final card = find.byType(CardBase);
      await tester.tap(card);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
