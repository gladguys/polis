import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/comment_model.dart';

void main() {
  group('CommentState tests', () {
    test('states', () {
      expect(InitialCommentRepliesState(), InitialCommentRepliesState());
      expect(
        AddedReplyCommentSuccess(
          replyCommentAdded: CommentModel(),
          numberOfReplies: 1,
        ),
        AddedReplyCommentSuccess(
          replyCommentAdded: CommentModel(),
          numberOfReplies: 1,
        ),
      );
      expect(LoadingAddReplyComment(), LoadingAddReplyComment());
      expect(AddedReplyCommentFailed(), AddedReplyCommentFailed());
    });
  });
}
