import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polis/page/post/comments/widget/editing_top_part.dart';

void main() {
  group('EditingTopPart tests', () {
    test('asserts', () {
      expect(
        () => EditingTopPart(
          text: null,
          commentInputController: TextEditingController(),
          onCancelEditing: () {},
        ),
        throwsAssertionError,
      );
    });

    test('asserts', () {
      expect(
        () => EditingTopPart(
          text: '',
          commentInputController: null,
          onCancelEditing: () {},
        ),
        throwsAssertionError,
      );
    });

    test('asserts', () {
      expect(
        () => EditingTopPart(
          text: '',
          commentInputController: TextEditingController(),
          onCancelEditing: null,
        ),
        throwsAssertionError,
      );
    });
  });
}
