import '../../domain/model/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getPostComments({String postId});
  Future<List<CommentModel>> getCommentSubComments({String commentId});
  Future<CommentModel> saveComment(CommentModel comment);
  Future<CommentModel> deleteComment({String postId, CommentModel comment});
  Future<CommentModel> editComment({String postId, CommentModel comment});
  Future<CommentModel> saveCommentReply(
      {String postId, CommentModel comment, CommentModel replyComment});
}
