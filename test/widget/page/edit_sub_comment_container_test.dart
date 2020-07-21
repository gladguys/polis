import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/page/post/comments/widget/edit_sub_comment_container.dart';

void main() {
  group('EditSubCommentContainer tests', () {
    test('asserts', () {
      expect(
        () => EditSubCommentContainer(
          subComment: null,
          commentInputController: TextEditingController(),
        ),
        throwsAssertionError,
      );

      expect(
        () => EditSubCommentContainer(
          subComment: SubCommentModel(),
          commentInputController: null,
        ),
        throwsAssertionError,
      );
    });
  });
}
