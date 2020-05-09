import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/i18n/i18n.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/timeline/widget/timeline.dart';
import 'package:polis/widget/text_rich.dart';
import 'package:polis/widget/tile/despesa_tile.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  group('TimelinePage tests', () {
    test('assert', () {
      expect(
          () => Timeline(
                activities: null,
                updatesCount: 0,
              ),
          throwsAssertionError);
      expect(
          () => Timeline(
                activities: [],
                updatesCount: null,
              ),
          throwsAssertionError);
    });

    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(TimelinePageConnected()));
    });

    testWidgets('shoud build Timeline with activity', (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        TimelineUpdated(activities: [
          DespesaModel(
            numDocumento: '1',
            fotoPolitico: 'foto',
            nomePolitico: 'politico 1',
            nomeFornecedor: 'fornecedor 1',
            tipoAtividade: 'tipoAtividade1',
            tipoDespesa: 'tipoDespesa1',
            valorLiquido: '10.00',
            dataDocumento: '10-01-2020',
          ),
          DespesaModel(
            numDocumento: '2',
            fotoPolitico: 'foto',
            nomePolitico: 'politico 2',
            nomeFornecedor: 'fornecedor 2',
            tipoAtividade: 'tipoAtividade2',
            tipoDespesa: 'tipoDespesa2',
            valorLiquido: '20.00',
            dataDocumento: '20-01-2020',
          ),
          PropostaModel(
            id: '1',
            dataAtualizacao: '20-01-2020',
            nomePolitico: 'nome',
            fotoPolitico: 'foto',
          )
        ], postsCount: 3, updatesCount: 0),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: TimelinePage(),
          ),
        ),
      );
      expect(find.byType(DespesaTile), findsNWidgets(2));
      final timeline = find.byType(Timeline);
      expect(timeline, findsOneWidget);
      tester.ensureVisible(timeline);
    });

    testWidgets('shoud build Timeline with activity and loading',
        (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        ReachedEndFetchingMore(
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            PropostaModel(
              id: '1',
              dataAtualizacao: '20-01-2020',
              nomePolitico: 'nome',
              fotoPolitico: 'foto',
            )
          ],
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: TimelinePage(),
          ),
        ),
      );
      expect(find.byType(DespesaTile), findsNWidgets(2));
      final timeline = find.byType(Timeline);
      expect(timeline, findsOneWidget);
      tester.ensureVisible(timeline);
    });

    testWidgets('shoud show loading while fetching more', (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        ReachedEndFetchingMore(
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            PropostaModel(
              id: '1',
              dataAtualizacao: '20-01-2020',
              nomePolitico: 'nome',
              fotoPolitico: 'foto',
            )
          ],
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: TimelinePage(),
          ),
        ),
      );
      expect(find.byType(SpinKitThreeBounce), findsOneWidget);
    });

    testWidgets('shoud show TIMELINE_IS_EMPTY message', (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(NoPostsAvailable());
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: TimelinePage(),
          ),
        ),
      );
      expect(find.text(TIMELINE_IS_EMPTY), findsOneWidget);
      final followPoliticButton = find.text(FOLLOW_POLITICS);
      expect(followPoliticButton, findsOneWidget);
      await tester.tap(followPoliticButton);
      verify(mockObserver.didPush(any, any));
    });

    testWidgets(
        '''shoud build Timeline with update button when there are new updates''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel(userId: '1'));
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        TimelineUpdated(
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            PropostaModel(
              id: '1',
              dataAtualizacao: '20-01-2020',
              nomePolitico: 'nome',
              fotoPolitico: 'foto',
            )
          ],
          postsCount: 3,
          updatesCount: 3,
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<TimelineBloc>(
              bloc: mockTimelineBloc,
              page: TimelinePage(),
            ),
          ),
        ),
      );
      expect(find.byType(DespesaTile), findsNWidgets(2));
      final timeline = find.byType(Timeline);
      expect(timeline, findsOneWidget);
      tester.ensureVisible(timeline);
      final updateTimelineButtonn = find.byKey(updateTimelineButtonKey);
      expect(updateTimelineButtonn, findsOneWidget);
      await tester.tap(updateTimelineButtonn);
    });

    testWidgets(
        '''shoud build Timeline with string activity when only one update is pending''',
        (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel(userId: '1'));
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        TimelineUpdated(
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10-01-2020',
            ),
          ],
          postsCount: 1,
          updatesCount: 1,
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<TimelineBloc>(
              bloc: mockTimelineBloc,
              page: TimelinePage(),
            ),
          ),
        ),
      );
      expect(find.byType(DespesaTile), findsNWidgets(1));
      final timeline = find.byType(Timeline);
      expect(timeline, findsOneWidget);
      tester.ensureVisible(timeline);
      final updateTimelineButtonn = find.byKey(updateTimelineButtonKey);
      expect(updateTimelineButtonn, findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextRich) {
          final spans = widget.children;
          for (var span in spans) {
            final textSpan = span as TextSpan;
            if (textSpan.text.contains(NEW_ACTIVITY)) {
              return true;
            }
          }
        }
        return false;
      }), findsOneWidget);
    });

    testWidgets('should bring more posts on swipe down', (tester) async {
      final mockUserBloc = MockUserBloc();
      when(mockUserBloc.user).thenReturn(UserModel(userId: '1'));
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        TimelineUpdated(
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20-01-2020',
            ),
            PropostaModel(
              id: '1',
              dataAtualizacao: '20-01-2020',
              nomePolitico: 'nome',
              fotoPolitico: 'foto',
            )
          ],
          postsCount: 3,
          updatesCount: 0,
        ),
      );
      when(mockTimelineBloc.timelineCurrentPosition).thenReturn(0);
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<UserBloc>(
            bloc: mockUserBloc,
            page: PageConnected<TimelineBloc>(
              bloc: mockTimelineBloc,
              page: TimelinePage(),
            ),
          ),
        ),
      );
      await tester.pump();
      final listview = find.byType(ListView);
      expect(listview, findsOneWidget);
      await tester.drag(listview, const Offset(0, -3000));
      await tester.pump();
      verify(mockTimelineBloc.add(FetchMorePosts('1', 278.0))).called(1);
    });
  });
}
