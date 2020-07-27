import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/dto/despesa_mensal.dart';
import 'package:polis/core/domain/dto/despesa_por_tipo.dart';
import 'package:polis/core/domain/dto/total_despesas_anuais.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/repository/abstract/repositories.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/loading.dart';

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

  PoliticoModel politico;
  MockPoliticExpensesAnalysisBloc mockPoliticExpensesAnalysisBloc;

  group('PoliticExpensesAnalysisPage tests', () {
    setUp(() {
      politico = PoliticoModel(
        id: '1',
        nomeEleitoral: 'nome',
        siglaUf: 'CE',
        urlPartidoLogo: 'logo',
      );
      mockPoliticExpensesAnalysisBloc = MockPoliticExpensesAnalysisBloc();
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticExpensesAnalysisPageConnected(politico),
          extraProviders: [
            RepositoryProvider<PoliticExpensesAnalysisQuotaRepository>(
              create: (_) => MockPoliticExpensesAnalysisQuotaRepository(),
            ),
            RepositoryProvider<PoliticExpensesByTypeAnalysisRepository>(
              create: (_) => MockPoliticExpensesByTypeAnalysisRepository(),
            ),
          ],
        ),
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesAnalysisBloc>(
            bloc: mockPoliticExpensesAnalysisBloc,
            page: PoliticExpensesAnalysisPage(politico),
          ),
        ),
      );
    });

    testWidgets('should show loading', (tester) async {
      when(mockPoliticExpensesAnalysisBloc.state)
          .thenReturn(LoadingPoliticExpensesData());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesAnalysisBloc>(
            bloc: mockPoliticExpensesAnalysisBloc,
            page: PoliticExpensesAnalysisPage(politico),
          ),
        ),
      );
      expect(find.byType(Loading), findsOneWidget);
    });

    testWidgets('should load page with data and change year', (tester) async {
      when(mockPoliticExpensesAnalysisBloc.beginYear).thenReturn(2019);
      when(mockPoliticExpensesAnalysisBloc.maxQuotaForState)
          .thenReturn(40000.0);
      when(mockPoliticExpensesAnalysisBloc.state).thenReturn(
        GetPoliticExpensesDataSuccess(
          year: 2019,
          despesasPorTipo: [
            DespesaPorTipo(
              tipoCota: 'tipo cota 1',
              valor: '100',
              percentual: '1%',
            )
          ],
          totalDespesasAnuais: TotalDespesasAnuais(
            ano: '2019',
            despesasPorMes: [
              DespesaMensal(mes: '01', valor: 10000.0),
              DespesaMensal(mes: '02', valor: 20000.0),
            ],
          ),
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesAnalysisBloc>(
            bloc: mockPoliticExpensesAnalysisBloc,
            page: PoliticExpensesAnalysisPage(politico),
          ),
        ),
      );
      final yearSelect = find.text('$YEAR:');
      expect(yearSelect, findsOneWidget);
      await tester.tap(yearSelect);
      await tester.pump();
      final year = find.text('2020');
      expect(year, findsOneWidget);
      await tester.tap(year);
      await tester.pump();
    });
  });
}
