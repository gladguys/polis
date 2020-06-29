import '../../domain/model/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getPostComments({String postId});
  Future<CommentModel> saveComment({String postId, CommentModel comment});
  Future<CommentModel> saveCommentReply(
      {String postId, CommentModel comment, CommentModel replyComment});
}
