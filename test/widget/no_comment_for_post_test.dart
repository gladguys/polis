import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/post/comments/widget/no_comment_for_post.dart';

void main() {
  group('NoCommentForPost tests', () {
    test('const ', () {
      // ignore: prefer_const_constructors
      expect(NoCommentForPost() == const NoCommentForPost(), false);
    });
  });
}
