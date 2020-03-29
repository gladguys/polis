import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/page/timeline/widget/despesa_tile.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  group('TimelinePage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(connectedWidget(TimelinePageConnected()));
    });

    testWidgets('shoud build Timeline with activity', (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      when(mockTimelineBloc.state).thenReturn(
        TimelineUpdated(
          despesas: [
            DespesaModel(
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
            ),
            DespesaModel(
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
            ),
          ],
          propostas: [],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TimelineBloc>(
            bloc: mockTimelineBloc,
            page: TimelinePage(),
          ),
        ),
      );
      expect(find.byType(DespesaTile), findsNWidgets(2));
    });
  });
}
