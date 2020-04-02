import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/tile/despesa_tile.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

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
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '2020-01-10',
            ),
            DespesaModel(
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '2020-01-20',
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
