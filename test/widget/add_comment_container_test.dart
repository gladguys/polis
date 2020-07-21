import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/post/comments/widget/add_comment_container.dart';

void main() {
  test('assert', () {
    expect(
        () => AddCommentContainer(
              commentInputController: null,
              onAddComment: () {},
            ),
        throwsAssertionError);

    expect(
        () => AddCommentContainer(
              commentInputController: TextEditingController(),
              onAddComment: null,
            ),
        throwsAssertionError);
  });
}
