import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_proposals/widget/politic_proposals_skeleton.dart';
import 'package:polis/widget/empty_info.dart';
import 'package:polis/widget/error_container.dart';
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

  MockPoliticProposalsCubit mockPoliticProposalsCubit;
  PoliticoModel politico;

  group('PoliticProposalsPage tests', () {
    setUp(() {
      mockPoliticProposalsCubit = MockPoliticProposalsCubit();
      politico = PoliticoModel(
        id: '1',
        nomeEleitoral: 'nome',
        urlPartidoLogo: 'logo',
        urlFoto: 'foto',
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProposalsCubit>(
            bloc: mockPoliticProposalsCubit,
            page: PoliticProposalsPage(politico),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticProposalsPageConnected(politico),
        ),
      );
    });

    testWidgets('should show followers', (tester) async {
      when(mockPoliticProposalsCubit.state).thenReturn(
        GetPoliticProposalsSuccess(proposals: [
          PropostaModel(
            id: '1',
            nomePolitico: 'nome',
            dataAtualizacao: '10-01-2020',
            fotoPolitico: 'foto',
            urlPartidoLogo: 'logo',
          ),
          PropostaModel(
            id: '2',
            nomePolitico: 'nome',
            dataAtualizacao: '11-01-2020',
            fotoPolitico: 'foto',
            urlPartidoLogo: 'logo',
          )
        ]),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProposalsCubit>(
            bloc: mockPoliticProposalsCubit,
            page: PoliticProposalsPage(politico),
          ),
        ),
      );
      expect(find.byType(PoliticPropostaTileConnected), findsNWidgets(2));
    });

    testWidgets('should EmptyInfo when there is not followers', (tester) async {
      when(mockPoliticProposalsCubit.state).thenReturn(
        GetPoliticProposalsSuccess(proposals: []),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProposalsCubit>(
            bloc: mockPoliticProposalsCubit,
            page: PoliticProposalsPage(politico),
          ),
        ),
      );
      expect(find.byType(EmptyInfo), findsOneWidget);
    });

    testWidgets('should show loading', (tester) async {
      when(mockPoliticProposalsCubit.state)
          .thenReturn(LoadingPoliticProposals());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProposalsCubit>(
            bloc: mockPoliticProposalsCubit,
            page: PoliticProposalsPage(politico),
          ),
        ),
      );
      expect(find.byType(PoliticProposalsSkeleton), findsOneWidget);
    });

    testWidgets('should show error wiget', (tester) async {
      when(mockPoliticProposalsCubit.state)
          .thenReturn(GetPoliticProposalsFailed());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProposalsCubit>(
            bloc: mockPoliticProposalsCubit,
            page: PoliticProposalsPage(politico),
          ),
        ),
      );
      expect(find.byType(ErrorContainer), findsOneWidget);
    });
  });
}
