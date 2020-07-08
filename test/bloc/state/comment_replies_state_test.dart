import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  group('CommentState tests', () {
    test('states', () {
      expect(InitialSubCommentsState(), InitialSubCommentsState());
      expect(
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(),
          numberOfReplies: 1,
        ),
        AddedSubCommentSuccess(
          subCommentAdded: SubCommentModel(),
          numberOfReplies: 1,
        ),
      );
      expect(LoadingAddSubComment(), LoadingAddSubComment());
      expect(AddedSubCommentFailed(), AddedSubCommentFailed());
    });
  });
}
