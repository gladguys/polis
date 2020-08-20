import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  test('props', () {
    expect(GetCommentSubComments(commentId: 1),
        GetCommentSubComments(commentId: 1));
    expect(
      DeleteSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
      ),
      DeleteSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
      ),
    );
    expect(
      StartEditingSubComment(
        SubCommentModel(
          id: 1,
        ),
      ),
      StartEditingSubComment(
        SubCommentModel(
          id: 1,
        ),
      ),
    );
    expect(
      EditSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
        newText: 'novo',
      ),
      EditSubComment(
        subComment: SubCommentModel(
          id: 1,
        ),
        newText: 'novo',
      ),
    );
    expect(StopEditingSubComment(), StopEditingSubComment());
  });
}
