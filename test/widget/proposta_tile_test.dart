import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/cubits.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/i18n/i18n.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/widget/button_action_card.dart';
import 'package:polis/widget/tile/proposta_tile_connected.dart';

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

  group('DespesaTile tests', () {
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
        urlPartidoLogo: 'logo',
        foiAtualizada: true,
      );
    });

    testWidgets('should build without exploding', (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(proposta),
          ),
        ),
      );
    });

    testWidgets('should build dark mode without exploding', (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(proposta),
          ),
          useDarkMode: true,
        ),
      );
    });

    testWidgets(
        'should style diferent when descricaoTipo equals PLENARY_AMENDMENT',
        (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
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
        urlPartidoLogo: 'logo',
        foiAtualizada: false,
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(propostaDesc),
          ),
        ),
      );
      final text = find.text(PLENARY_AMENDMENT);
      expect(text, findsOneWidget);
    });

    testWidgets('should go to post page when click', (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(proposta),
          ),
        ),
      );
      final card = find.byKey(cardBaseKey).first;
      expect(card, findsOneWidget);
      await tester.tap(card);
      verify(mockTimelineCubit.refreshTimeline());
    });

    testWidgets('should do something when click on card', (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(proposta),
          ),
        ),
      );
      final card = find.byKey(cardBaseContentKey);
      expect(card, findsOneWidget);
      await tester.tap(card);
    });

    testWidgets('should do something when click on bookmark btn',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: null,
            page: PropostaTileConnected(proposta),
          ),
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

    testWidgets('should go to profile page when click on politic photo',
        (tester) async {
      final mockTimelineCubit = MockTimelineCubit();
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineCubit>(
            bloc: mockTimelineCubit,
            page: PropostaTileConnected(proposta),
          ),
        ),
      );
      final politicPhoto = find.byType(ClipRRect);
      expect(politicPhoto, findsOneWidget);
      await tester.tap(politicPhoto);
      verify(mockObserver.didPush(any, any));
    });
  });
}
