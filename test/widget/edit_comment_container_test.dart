import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/comment_model.dart';
import 'package:polis/page/post/comments/widget/edit_comment_container.dart';

void main() {
  group('EditCommentContainer tests', () {
    test('asserts', () {
      expect(
        () => EditCommentContainer(
          comment: null,
          commentInputController: TextEditingController(),
        ),
        throwsAssertionError,
      );

      expect(
        () => EditCommentContainer(
          comment: CommentModel(),
          commentInputController: null,
        ),
        throwsAssertionError,
      );
    });
  });
}
