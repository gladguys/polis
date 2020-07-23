import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/politic_profile/widget/politic_action_buttons.dart';
import 'package:polis/page/politic_profile/widget/politic_activities.dart';
import 'package:polis/page/politic_profile/widget/politic_additional_info.dart';
import 'package:polis/page/politic_profile/widget/politic_personal_info.dart';
import 'package:polis/widget/error_container.dart';
import 'package:polis/widget/not_found.dart';

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

  MockPoliticProfileCubit mockPoliticProfileCubit;

  group('PoliticProfilePage tests', () {
    setUp(() {
      mockPoliticProfileCubit = MockPoliticProfileCubit();
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
          useDarkMode: true,
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
      when(mockPoliticProfileCubit.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
          urlPartidoLogo: 'logo',
        ),
      );
      when(mockPoliticProfileCubit.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: true,
            urlPartidoLogo: 'logo',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
        ],
      );
      when(mockPoliticProfileCubit.isPoliticBeingFollowedByUser)
          .thenReturn(true);
      when(mockPoliticProfileCubit.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: mockPoliticProfileCubit.politico,
          lastActivities: mockPoliticProfileCubit.lastActivities,
          activitiesCount: mockPoliticProfileCubit.lastActivities.length,
          isBeingFollowedByUser:
              mockPoliticProfileCubit.isPoliticBeingFollowedByUser,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticPersonalInfo), findsOneWidget);
      expect(find.byType(PoliticActionButtons), findsOneWidget);
      expect(find.byType(PoliticAdditionalInfo), findsOneWidget);
      expect(find.byType(PoliticActivities), findsOneWidget);
    });

    testWidgets('should get more activities when paginate', (tester) async {
      when(mockPoliticProfileCubit.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
          urlPartidoLogo: 'logo',
        ),
      );
      when(mockPoliticProfileCubit.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: false,
            urlPartidoLogo: 'logo',
          ),
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: true,
            urlPartidoLogo: 'logo',
          ),
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: true,
            urlPartidoLogo: 'logo',
          ),
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: false,
            urlPartidoLogo: 'logo',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'url',
          ),
        ],
      );
      when(mockPoliticProfileCubit.isPoliticBeingFollowedByUser)
          .thenReturn(true);
      when(mockPoliticProfileCubit.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: mockPoliticProfileCubit.politico,
          lastActivities: mockPoliticProfileCubit.lastActivities,
          activitiesCount: mockPoliticProfileCubit.lastActivities.length,
          isBeingFollowedByUser:
              mockPoliticProfileCubit.isPoliticBeingFollowedByUser,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticPersonalInfo), findsOneWidget);
      expect(find.byType(PoliticActionButtons), findsOneWidget);
      expect(find.byType(PoliticAdditionalInfo), findsOneWidget);
      final politicActivities = find.byType(PoliticActivities);
      expect(politicActivities, findsOneWidget);
      final listview = find.byType(ListView);
      expect(listview, findsOneWidget);
      await tester.drag(listview, const Offset(0, -3000));
      await tester.pump();
      verify(mockPoliticProfileCubit.getMoreActivities('1')).called(1);
    });

    testWidgets(
        '''should show NotFound widget with NO_ACTIVITY_FOR_POLITIC message''',
        (tester) async {
      when(mockPoliticProfileCubit.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
          urlPartidoLogo: 'logo',
        ),
      );
      when(mockPoliticProfileCubit.lastActivities).thenReturn([]);
      when(mockPoliticProfileCubit.isPoliticBeingFollowedByUser)
          .thenReturn(true);
      when(mockPoliticProfileCubit.state).thenReturn(
        GetPoliticInfoSuccess(
          politic: mockPoliticProfileCubit.politico,
          lastActivities: mockPoliticProfileCubit.lastActivities,
          activitiesCount: mockPoliticProfileCubit.lastActivities.length,
          isBeingFollowedByUser:
              mockPoliticProfileCubit.isPoliticBeingFollowedByUser,
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(PoliticActivities), findsOneWidget);
      expect(find.byType(NotFound), findsOneWidget);
      expect(find.text(NO_ACTIVITY_FOR_POLITIC), findsOneWidget);
    });

    testWidgets('should show error widget when fails', (tester) async {
      when(mockPoliticProfileCubit.state).thenReturn(GetPoliticInfoFailed());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.byType(ErrorContainer), findsOneWidget);
    });

    testWidgets('should show text FOLLOW when politic is being followed',
        (tester) async {
      when(mockPoliticProfileCubit.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
          urlPartidoLogo: 'logo',
        ),
      );
      when(mockPoliticProfileCubit.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: true,
            urlPartidoLogo: 'logo',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
          ),
        ],
      );
      when(mockPoliticProfileCubit.state).thenReturn(
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
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(FOLLOW), findsOneWidget);
    });

    testWidgets('should show text STOP_FOLLOW when politic is being followed',
        (tester) async {
      when(mockPoliticProfileCubit.politico).thenReturn(
        PoliticoModel(
          id: '1',
          siglaPartido: 'PT',
          urlFoto: 'foto',
          nomeEleitoral: 'nomeE',
          siglaUf: 'CE',
          urlPartidoLogo: 'logo',
        ),
      );
      when(mockPoliticProfileCubit.lastActivities).thenReturn(
        [
          PropostaModel(
            ementa: 'ementa',
            nomePolitico: 'nome',
            descricaoTramitacao: 'descTra',
            descricaoSituacao: 'descSit',
            dataAtualizacao: '2020-02-05',
            visualizado: false,
            foiAtualizada: false,
            urlPartidoLogo: 'logo',
          ),
          DespesaModel(
            fotoPolitico: 'foto',
            nomePolitico: 'nome',
            nomeFornecedor: 'fornecedor',
            tipoAtividade: 'ativi',
            tipoDespesa: 'despesa',
            valorLiquido: '3.51',
            dataDocumento: '10-01-2020',
            visualizado: false,
            urlPartidoLogo: 'logo',
          ),
        ],
      );
      when(mockPoliticProfileCubit.state).thenReturn(
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
          PageConnected<PoliticProfileCubit>(
            bloc: mockPoliticProfileCubit,
            page: PoliticProfilePage(),
          ),
        ),
      );
      expect(find.text(STOP_FOLLOW), findsOneWidget);
    });
  });
}
