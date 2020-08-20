import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/post/comments/widget/menu_edit_delete_comment.dart';

void main() {
  group('EditCommentContainer tests', () {
    test('asserts', () {
      expect(
        () => MenuEditDeleteComment(
          onEdit: null,
          onDelete: () {},
        ),
        throwsAssertionError,
      );

      expect(
        () => MenuEditDeleteComment(
          onEdit: () {},
          onDelete: null,
        ),
        throwsAssertionError,
      );
    });
  });
}
