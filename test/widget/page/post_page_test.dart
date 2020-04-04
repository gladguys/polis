import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:polis/enum/post_type.dart';
import 'package:polis/model/models.dart';
import 'package:polis/page/pages.dart';

import '../utils.dart';

void main() {
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
              dataDocumento: '10/01/2020',
            ),
            postType: PostType.DESPESA,
          ),
        ),
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          PostPage(
            post: DespesaModel(
              nomePolitico: 'politico',
              nomeFornecedor: 'fornecedor',
              valorDocumento: 'valor',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              dataDocumento: '10/01/2020',
            ),
            postType: PostType.DESPESA,
          ),
        ),
      );
    });
  });
}
