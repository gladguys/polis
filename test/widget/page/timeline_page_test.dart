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
          activities: [
            DespesaModel(
              numDocumento: '1',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 1',
              nomeFornecedor: 'fornecedor 1',
              tipoAtividade: 'tipoAtividade1',
              tipoDespesa: 'tipoDespesa1',
              valorLiquido: '10.00',
              dataDocumento: '10/01/2020',
            ),
            DespesaModel(
              numDocumento: '2',
              fotoPolitico: 'foto',
              nomePolitico: 'politico 2',
              nomeFornecedor: 'fornecedor 2',
              tipoAtividade: 'tipoAtividade2',
              tipoDespesa: 'tipoDespesa2',
              valorLiquido: '20.00',
              dataDocumento: '20/01/2020',
            ),
            PropostaModel(
              id: '1',
              dataDocumento: '20/01/2020',
              nomePolitico: 'nome',
              fotoPolitico: 'foto',
            )
          ],
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
