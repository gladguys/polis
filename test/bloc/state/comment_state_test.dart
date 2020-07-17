import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';

void main() {
  group('CommentState tests', () {
    test('states', () {
      expect(InitialCommentState(), InitialCommentState());
      expect(
        GetPostCommentsSuccess(comments: []),
        GetPostCommentsSuccess(
          comments: [],
        ),
      );
      expect(LoadingPostComments(), LoadingPostComments());
      expect(GetPostCommentsFailed(), GetPostCommentsFailed());
      expect(
        NewCommentAdded(comment: CommentModel(), numberOfComments: 0),
        NewCommentAdded(comment: CommentModel(), numberOfComments: 0),
      );
      expect(
        NewSubCommentAdded(comment: CommentModel(), numberOfReplies: 0),
        NewSubCommentAdded(comment: CommentModel(), numberOfReplies: 0),
      );
    });
  });
}
