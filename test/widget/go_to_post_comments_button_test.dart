import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/keys.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/widget/post/go_to_post_comments_button.dart';

import '../mock.dart';
import '../utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    const channel = MethodChannel('plugins.flutter.io/firebase_performance');
    channel.setMockMethodCallHandler((methodCall) async => true);
    initLocator(MockSharedPreferences());
    initializeDateFormatting('pt_BR', null);
  });

  PropostaModel proposta;

  group('GoToPostCommentsButton', () {
    setUp(() {
      proposta = PropostaModel(
        fotoPolitico: 'foto',
        nomePolitico: 'nome',
        visualizado: false,
        urlPartidoLogo: 'url',
        dataAtualizacao: '10-01-2020',
        foiAtualizada: false,
      );
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(GoToPostCommentsButton(proposta)),
      );
    });

    testWidgets('should go to post comments page', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          GoToPostCommentsButton(proposta),
        ),
      );
      final goToPostCommentsButton = find.byKey(goToPostCommentsButtonKey);
      await tester.tap(goToPostCommentsButton);
      verify(mockObserver.didPush(any, any));
    });
  });
}
