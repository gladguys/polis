import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/post/comments/widget/no_sub_comment_for_comment.dart';

import '../utils.dart';

void main() {
  group('NoSubCommentForComment tests', () {
    test('const ', () {
      // ignore: prefer_const_constructors
      expect(NoSubCommentForComment() == const NoSubCommentForComment(), false);
    });

    testWidgets('should build without exploding', (tester) async {
      await tester.pumpWidget(
        connectedWidget(
          const NoSubCommentForComment(),
        ),
      );
    });

    testWidgets('should build without exploding with dark mode',
        (tester) async {
      await tester.pumpWidget(
        connectedWidget(const NoSubCommentForComment(), useDarkMode: true),
      );
    });
  });
}
