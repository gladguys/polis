import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/enum/post_type.dart';
import 'package:polis/model/despesa_model.dart';
import 'package:polis/page/timeline/widget/goto_post_gesture_detector.dart';

import 'utils.dart';

void main() {
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
              tile: Container(
                key: const ValueKey('child'),
              ),
              postType: PostType.DESPESA,
              post: DespesaModel(),
            ),
          ),
        ),
      );
      final child = find.byKey(const ValueKey('child'));
      expect(child, findsOneWidget);
      await tester.tap(child);
      await tester.pumpAndSettle();
      verify(mockObserver.didPush(any, any));
    });
  });
}
