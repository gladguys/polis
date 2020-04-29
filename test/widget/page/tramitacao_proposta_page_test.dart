import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/timeline_tile.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  setUpAll(() {
    initializeDateFormatting('pt_BR', null);
  });

  group('TramitacaoPropostaPage tests', () {
    testWidgets('shoud build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          TramitacaoPropostaPageConnected(
            PropostaModel(),
          ),
        ),
      );
    });

    testWidgets('shoud display tramitacoes', (tester) async {
      final mockTramitacaoPropostaBloc = MockTramitacaoPropostaBloc();
      when(mockTramitacaoPropostaBloc.proposta).thenReturn(
        PropostaModel(
          sequencia: 1,
          dataApresentacao: '10-01-2020',
        ),
      );
      when(mockTramitacaoPropostaBloc.state).thenReturn(
        GetTramitacaoPropostaSuccess(
          [
            TramitacaoPropostaModel(
              descricaoTramitacao: 'descricao1',
              sequencia: '1',
              dataHora: '10-01-2020',
            ),
            TramitacaoPropostaModel(
              descricaoTramitacao: 'descricao2',
              sequencia: '2',
              dataHora: '10-01-2020',
            ),
          ],
        ),
      );
      await tester.pumpWidget(
        connectedWidget(
          PageConnected<TramitacaoPropostaBloc>(
            bloc: mockTramitacaoPropostaBloc,
            page: TramitacaoPropostaPage(),
          ),
        ),
      );
      expect(find.byType(TimelineTile), findsNWidgets(2));
    });
  });
}
