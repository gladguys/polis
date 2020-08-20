import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/comparativo_ranking_despesas/widget/politic_with_expenses_info.dart';
import 'package:polis/widget/photo.dart';

import '../../mock.dart';
import '../../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('PoliticWithExpensesInfo tests', () {
    test('asserts', () {
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: null,
                partido: 'partido',
                estado: 'estado',
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: null,
                estado: 'estado',
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: null,
                foto: 'foto',
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: 'estado',
                foto: null,
                nome: 'nome',
              ),
          throwsAssertionError);
      expect(
          () => PoliticWithExpensesInfo(
                totalDespesas: 10.0,
                partido: 'partido',
                estado: 'estado',
                foto: 'foto',
                nome: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const PoliticWithExpensesInfo(
            estado: 'CE',
            nome: 'nome',
            foto: 'foto',
            partido: 'PT',
            totalDespesas: 1000.0,
            idPolitico: '1',
            posicao: 1,
            exibePosicao: true,
          ),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const PoliticWithExpensesInfo(
            estado: 'CE',
            nome: 'nome',
            foto: 'foto',
            partido: 'PT',
            totalDespesas: 1000.0,
            idPolitico: '1',
            posicao: 1,
            exibePosicao: true,
          ),
          useDarkMode: true,
        ),
      );
    });

    testWidgets('should go to PoliticProfilePage when tap photo',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const PoliticWithExpensesInfo(
            estado: 'CE',
            nome: 'nome',
            foto: 'foto',
            partido: 'PT',
            totalDespesas: 1000.0,
            idPolitico: '1',
            posicao: 1,
            exibePosicao: true,
          ),
          useDarkMode: true,
        ),
      );
      final photo = find.byType(Photo);
      expect(photo, findsOneWidget);
      await tester.tap(photo);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
