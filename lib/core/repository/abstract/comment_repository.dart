import '../../domain/model/models.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getPostComments({String postId});
  Future<List<SubCommentModel>> getCommentSubComments({int commentId});
  Future<CommentModel> saveComment(CommentModel comment);
  Future<CommentModel> deleteComment({String postId, CommentModel comment});
  Future<CommentModel> editComment({String postId, CommentModel comment});
  Future<SubCommentModel> saveSubComment(
      {int commentId, SubCommentModel subComment});
}
