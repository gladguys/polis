import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/enum/post_type.dart';
import 'package:polis/core/domain/model/despesa_model.dart';
import 'package:polis/core/service/locator.dart';
import 'package:polis/page/timeline/widget/goto_post_gesture_detector.dart';

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

  group('GoToPostGestureDetector', () {
    test('assert', () {
      expect(
          () => GoToPostGestureDetector(
                post: null,
                postType: PostType.DESPESA,
                tile: Container(),
              ),
          throwsAssertionError);
      expect(
          () => GoToPostGestureDetector(
                post: DespesaModel(),
                postType: null,
                tile: Container(),
              ),
          throwsAssertionError);
      expect(
          () => GoToPostGestureDetector(
                post: DespesaModel(),
                postType: PostType.PROPOSICAO,
                tile: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should go to PostPage when click', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          Scaffold(
            body: GoToPostGestureDetector(
              tile: const Text('Tap me'),
              postType: PostType.DESPESA,
              post: DespesaModel(
                tipoAtividade: 'T',
                tipoDespesa: 'D',
                nomePolitico: 'pol',
                nomeFornecedor: 'forn',
                dataDocumento: '20-10-2020',
                valorLiquido: '2.33',
                valorDocumento: '2.33',
                valorGlosa: '2.33',
                numDocumento: '1',
                fotoPolitico: 'foto',
              ),
            ),
          ),
        ),
      );
      final child = find.text('Tap me');
      expect(child, findsOneWidget);
      await tester.tap(child);
      await tester.pump();
      verify(mockObserver.didPush(any, any));
    });
  });
}
