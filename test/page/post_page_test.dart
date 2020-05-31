import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/pages.dart';

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
              valorDocumento: '22.85',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              valorGlosa: '22.85',
              dataDocumento: '10-01-2020',
              urlPartidoLogo: 'logo',
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
              valorDocumento: '22.85',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              valorGlosa: '22.85',
              dataDocumento: '10-01-2020',
              urlPartidoLogo: 'url',
            ),
            postType: PostType.DESPESA,
          ),
        ),
      );
    });

    testWidgets('should call SetPostViewed from bloc when open despesa',
        (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: DespesaModel(
              nomePolitico: 'politico',
              nomeFornecedor: 'fornecedor',
              valorDocumento: '22.85',
              fotoPolitico: 'foto',
              tipoAtividade: 'tipo',
              tipoDespesa: 'tipod',
              valorLiquido: '22.85',
              valorGlosa: '22.85',
              dataDocumento: '10-01-2020',
              urlPartidoLogo: 'url',
            ),
            postType: PostType.DESPESA,
            timelineBloc: mockTimelineBloc,
          ),
        ),
      );
    });

    testWidgets('should call SetPostViewed from bloc when open proposta',
        (tester) async {
      final mockTimelineBloc = MockTimelineBloc();
      await tester.pumpWidget(
        connectedWidget(
          PostPageConnected(
            post: PropostaModel(
              nomePolitico: 'politico',
              tipoDocumento: 'PROPOSICAO',
              fotoPolitico: 'foto',
              siglaPartido: 'PT',
              dataAtualizacao: '10-01-2020',
              nomesAutores: ['a', 'b', 'c'],
            ),
            postType: PostType.PROPOSICAO,
            timelineBloc: mockTimelineBloc,
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
              dataAtualizacao: '10-01-2020',
              nomesAutores: ['a', 'b', 'c'],
            ),
            postType: PostType.PROPOSICAO,
          ),
        ),
      );
    });
  });
}
