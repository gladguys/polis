import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_expenses/widget/politic_expenses_skeleton.dart';
import 'package:polis/widget/card_base.dart';
import 'package:polis/widget/empty_info.dart';
import 'package:polis/widget/error_container.dart';

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

  MockPoliticExpensesCubit mockPoliticExpensesBloc;
  PoliticoModel politico;

  group('PoliticExpensesPage tests', () {
    setUp(() {
      mockPoliticExpensesBloc = MockPoliticExpensesCubit();
      politico = PoliticoModel(
        id: '1',
        urlFoto: 'foto',
        urlPartidoLogo: 'logo',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesCubit>(
            bloc: mockPoliticExpensesBloc,
            page: PoliticExpensesPage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticExpensesPageConnected(politico),
        ),
      );
    });

    testWidgets('should show followers', (tester) async {
      when(mockPoliticExpensesBloc.state).thenReturn(
        GetPoliticExpensesSuccess([
          DespesaModel(
            id: '1',
            urlPartidoLogo: 'logo',
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            tipoAtividade: 'tipo',
            tipoDespesa: 'despesa',
            valorLiquido: '129.85',
            dataDocumento: '2020-06-18',
          ),
          DespesaModel(
            id: '2',
            urlPartidoLogo: 'logo',
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            tipoAtividade: 'tipo',
            tipoDespesa: 'despesa',
            valorLiquido: '329.85',
            dataDocumento: '2020-06-21',
          ),
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesCubit>(
            bloc: mockPoliticExpensesBloc,
            page: PoliticExpensesPage(),
          ),
        ),
      );
      expect(find.byType(CardBase), findsNWidgets(2));
    });

    testWidgets('should EmptyInfo when there is not followers', (tester) async {
      when(mockPoliticExpensesBloc.state).thenReturn(
        GetPoliticExpensesSuccess([]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesCubit>(
            bloc: mockPoliticExpensesBloc,
            page: PoliticExpensesPage(),
          ),
        ),
      );
      expect(find.byType(EmptyInfo), findsOneWidget);
    });

    testWidgets('should show skeleton when loading', (tester) async {
      when(mockPoliticExpensesBloc.state).thenReturn(LoadingPoliticExpenses());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesCubit>(
            bloc: mockPoliticExpensesBloc,
            page: PoliticExpensesPage(),
          ),
        ),
      );
      expect(find.byType(PoliticExpensesSkeleton), findsOneWidget);
    });

    testWidgets('should show error container', (tester) async {
      when(mockPoliticExpensesBloc.state)
          .thenReturn(GetPoliticExpensesFailed());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticExpensesCubit>(
            bloc: mockPoliticExpensesBloc,
            page: PoliticExpensesPage(),
          ),
        ),
      );
      expect(find.byType(ErrorContainer), findsOneWidget);
    });
  });
}
