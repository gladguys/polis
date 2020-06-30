import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';

void main() {
  group('CommentRepliesEvent tests', () {
    group('AddReplyComment', () {
      test('props', () {
        final ev1 = AddReplyComment(
          text: 'a',
          commentReplied: CommentModel(),
        );
        final ev2 = AddReplyComment(
          text: 'a',
          commentReplied: CommentModel(),
        );
        final ev3 = AddReplyComment(
          text: 'b',
          commentReplied: CommentModel(),
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });
  });
}
