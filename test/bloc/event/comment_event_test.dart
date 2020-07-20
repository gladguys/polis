import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';

void main() {
  group('CommentEvent tests', () {
    group('GetPostComments', () {
      test('props', () {
        final ev1 = GetPostComments(
          postId: '1',
        );
        final ev2 = GetPostComments(
          postId: '1',
        );
        final ev3 = GetPostComments(
          postId: '2',
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('AddComment', () {
      test('props', () {
        final ev1 = AddComment(
          text: '1',
        );
        final ev2 = AddComment(
          text: '1',
        );
        final ev3 = AddComment(
          text: '2',
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    group('UpdateCommentReplies', () {
      test('props', () {
        final ev1 = UpdateCommentReplies(
          comment: CommentModel(),
          subComments: [],
        );
        final ev2 = UpdateCommentReplies(
          comment: CommentModel(),
          subComments: [],
        );
        final ev3 = UpdateCommentReplies(
          comment: null,
          subComments: [],
        );

        expect(ev1, ev2);
        expect(ev1 == ev3, false);
      });
    });

    test('props', () {
      expect(
        DeleteComment(
          CommentModel(
            id: 1,
          ),
        ),
        DeleteComment(
          CommentModel(
            id: 1,
          ),
        ),
      );
      expect(
        EditComment(
          comment: CommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
        EditComment(
          comment: CommentModel(
            id: 1,
          ),
          newText: 'novo',
        ),
      );
      expect(
        StartEditingComment(
          CommentModel(
            id: 1,
          ),
        ),
        StartEditingComment(
          CommentModel(
            id: 1,
          ),
        ),
      );
      expect(
        StopEditingComment(),
        StopEditingComment(),
      );
    });
  });
}
