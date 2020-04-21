import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/page_connected.dart';
import 'package:polis/page/pages.dart';
import 'package:polis/widget/card_base.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
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
          sequencia: '1',
        ),
      );
      when(mockTramitacaoPropostaBloc.state).thenReturn(
        GetTramitacaoPropostaSuccess(
          [
            TramitacaoPropostaModel(
              descricaoTramitacao: 'descricao1',
              sequencia: '1',
            ),
            TramitacaoPropostaModel(
              descricaoTramitacao: 'descricao2',
              sequencia: '2',
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
      expect(find.byType(CardBase), findsNWidgets(2));
    });
  });
}
