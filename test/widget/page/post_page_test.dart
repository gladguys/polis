import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/enum/post_type.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/pages.dart';

import '../../mock.dart';
import '../utils.dart';

void main() {
  initLocator(MockSharedPreferences());
  TestWidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', null);

  group('PostPage tests', () {
    test('assert', () {
      expect(
          () => PostPage(
                post: null,
                postType: PostType.DESPESA,
              ),
          throwsAssertionError);
      expect(
          () => PostPage(
                post: DespesaModel(),
                postType: null,
              ),
          throwsAssertionError);

      expect(
          () => PostPageConnected(
                post: null,
                postType: PostType.DESPESA,
              ),
          throwsAssertionError);
      expect(
          () => PostPageConnected(
                post: DespesaModel(),
                postType: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should build connected without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: DespesaModel(
              nomePolitico: 'politico',
              nomeFornecedor: 'fornecedor',
              valorDocumento: 'valor',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              dataDocumento: '10-01-2020',
            ),
            postType: PostType.DESPESA,
          ),
        ),
      );
    });

    testWidgets('should build without exploding with despesa', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: DespesaModel(
              nomePolitico: 'politico',
              nomeFornecedor: 'fornecedor',
              valorDocumento: 'valor',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              dataDocumento: '10-01-2020',
            ),
            postType: PostType.DESPESA,
          ),
        ),
      );
    });

    testWidgets('should build without exploding with proposta', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: PropostaModel(
              nomePolitico: 'politico',
              tipoDocumento: 'PROPOSICAO',
              fotoPolitico: 'foto',
              siglaPartido: 'PT',
              dataDocumento: '10-01-2020',
            ),
            postType: PostType.PROPOSICAO,
          ),
        ),
      );
    });

    testWidgets('should do something when click comment button',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: PropostaModel(
              nomePolitico: 'politico',
              tipoDocumento: 'PROPOSICAO',
              fotoPolitico: 'foto',
              siglaPartido: 'PT',
              dataDocumento: '10-01-2020',
            ),
            postType: PostType.PROPOSICAO,
          ),
        ),
      );
      final commentButton = find.byKey(const ValueKey('comment-button'));
      expect(commentButton, findsOneWidget);
      await tester.tap(commentButton);
    });
  });
}
