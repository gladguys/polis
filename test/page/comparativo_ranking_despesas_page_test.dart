import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/comparativo_ranking_despesas/widget/resultados_ranking.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/error_container.dart';
import 'package:polis/widget/loading.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockComparativoRankingDespesasCubit mockComparativoRankingDespesasCubit;
  PoliticoModel politico;
  ResultadosRankingModel resultadosRanking;

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('ComparativoRankingDespesasPage tests', () {
    setUp(() {
      mockComparativoRankingDespesasCubit =
          MockComparativoRankingDespesasCubit();
      politico = PoliticoModel(
        id: '1',
        urlPartidoLogo: 'logo_partido',
        urlFoto: 'foto',
        totalProposicoes: 20,
        rankingPosDespesa: 11,
        totalDespesas: 333.55,
        nomeEleitoral: 'nome',
        siglaPartido: 'PSDB',
        siglaUf: 'MG',
      );
      resultadosRanking = ResultadosRankingModel(
        despesaMedia: 100,
        despesaPoliticoUltimo: 1352.12,
        estadoPoliticoUltimo: 'CE',
        fotoPoliticoUltimo: 'foto',
        logoPartidoPoliticoUltimo: 'logo',
        nomePoliticoUltimo: 'nome',
        partidoPoliticoUltimo: 'PT',
        idPoliticoUltimo: '1',
        idPoliticosPrimeiro: [
          '2',
          '3',
        ],
        despesasPoliticoPrimeiro: [
          0,
          0,
        ],
        estadosPoliticoPrimeiro: [
          'SP',
          'MG',
        ],
        fotosPoliticoPrimeiro: [
          'foto1',
          'foto2',
        ],
        logosPartidoPoliticoPrimeiro: [
          'logo1',
          'logo2',
        ],
        nomesPoliticoPrimeiro: [
          'nome1',
          'nome2',
        ],
        partidosPoliticoPrimeiro: [
          'partido1',
          'partido2',
        ],
      );
    });

    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          ComparativoRankingDespesasPageConnected(politico),
        ),
      );
    });

    testWidgets('shoud build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          ComparativoRankingDespesasPageConnected(politico),
          useDarkMode: true,
        ),
      );
    });

    testWidgets('should show ranking', (tester) async {
      when(mockComparativoRankingDespesasCubit.state).thenReturn(
        GetRankingResultadosSuccess(resultadosRanking),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ComparativoRankingDespesasCubit>(
            bloc: mockComparativoRankingDespesasCubit,
            page: ComparativoRankingDespesasPage(politico),
          ),
        ),
      );
      expect(find.byType(ResultadosRanking), findsOneWidget);
    });

    testWidgets('should show loading', (tester) async {
      when(mockComparativoRankingDespesasCubit.state).thenReturn(
        LoadingResultadosRanking(),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ComparativoRankingDespesasCubit>(
            bloc: mockComparativoRankingDespesasCubit,
            page: ComparativoRankingDespesasPage(politico),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('should show error', (tester) async {
      when(mockComparativoRankingDespesasCubit.state).thenReturn(
        GetRankingResultadosFailed(),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<ComparativoRankingDespesasCubit>(
            bloc: mockComparativoRankingDespesasCubit,
            page: ComparativoRankingDespesasPage(politico),
          ),
        ),
      );
      expect(find.byType(ErrorContainer), findsOneWidget);
    });
  });
}
