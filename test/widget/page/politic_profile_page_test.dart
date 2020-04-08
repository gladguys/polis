import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_profile/widget/politic_action_buttons.dart';
import 'package:polis/page/politic_profile/widget/politic_activities.dart';
import 'package:polis/page/politic_profile/widget/politic_additional_info.dart';
import 'package:polis/page/politic_profile/widget/politic_personal_info.dart';
import 'package:polis/widget/not_found.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  MockPoliticProfileBloc mockPoliticProfileBloc;

  group('PoliticProfilePage tests', () {
    setUp(() {
      mockPoliticProfileBloc = MockPoliticProfileBloc();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PoliticProfilePageConnected('1'),
        ),
      );
    });

    testWidgets('should bring info when success', (tester) async {
      when(mockPoliticProfileBloc.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
        ),
      );
      when(mockPoliticProfileBloc.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataDocumento: '2020-02-05',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
          ),
        ],
      );
      when(mockPoliticProfileBloc.isPoliticBeingFollowedByUser)
          .thenReturn(true);
      when(mockPoliticProfileBloc.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: mockPoliticProfileBloc.politico,
          lastActivities: mockPoliticProfileBloc.lastActivities,
          isBeingFollowedByUser:
              mockPoliticProfileBloc.isPoliticBeingFollowedByUser,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticPersonalInfo), findsOneWidget);
      expect(find.byType(PoliticActionButtons), findsOneWidget);
      expect(find.byType(PoliticAdditionalInfo), findsOneWidget);
      expect(find.byType(PoliticActivities), findsOneWidget);
    });

    testWidgets(
        '''should show NotFound widget with NO_ACTIVITY_FOR_POLITIC message''',
        (tester) async {
      when(mockPoliticProfileBloc.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
        ),
      );
      when(mockPoliticProfileBloc.lastActivities).thenReturn([]);
      when(mockPoliticProfileBloc.isPoliticBeingFollowedByUser)
          .thenReturn(true);
      when(mockPoliticProfileBloc.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: mockPoliticProfileBloc.politico,
          lastActivities: mockPoliticProfileBloc.lastActivities,
          isBeingFollowedByUser:
              mockPoliticProfileBloc.isPoliticBeingFollowedByUser,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticActivities), findsOneWidget);
      expect(find.byType(NotFound), findsOneWidget);
      expect(find.text(NO_ACTIVITY_FOR_POLITIC), findsOneWidget);
    });

    testWidgets('should show error msg when fails', (tester) async {
      when(mockPoliticProfileBloc.state).thenReturn(GetPoliticInfoFailed());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(ERROR_FETCHING_POLITIC_INFO), findsOneWidget);
    });

    testWidgets('should show text FOLLOW when politic is being followed',
        (tester) async {
      when(mockPoliticProfileBloc.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
        ),
      );
      when(mockPoliticProfileBloc.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataDocumento: '2020-02-05',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
          ),
        ],
      );
      when(mockPoliticProfileBloc.state).thenReturn(
        UserFollowingPoliticChanged(
          politico: PoliticoModel(
            id: '1',
            siglaPartido: 'PT',
            urlFoto: 'foto',
            nomeEleitoral: 'nomeE',
            siglaUf: 'CE',
          ),
          isUserFollowingPolitic: false,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(FOLLOW), findsOneWidget);
    });

    testWidgets('should show text STOP_FOLLOW when politic is being followed',
        (tester) async {
      when(mockPoliticProfileBloc.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
        ),
      );
      when(mockPoliticProfileBloc.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataDocumento: '2020-02-05',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
          ),
        ],
      );
      when(mockPoliticProfileBloc.state).thenReturn(
        UserFollowingPoliticChanged(
          politico: PoliticoModel(
            id: '1',
            siglaPartido: 'PT',
            urlFoto: 'foto',
            nomeEleitoral: 'nomeE',
            siglaUf: 'CE',
          ),
          isUserFollowingPolitic: true,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileBloc>(
            bloc: mockPoliticProfileBloc,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(STOP_FOLLOW), findsOneWidget);
    });
  });
}
