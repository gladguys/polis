import '../../domain/model/models.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getPostComments({String postId});
  Future<List<SubCommentModel>> getCommentSubComments({int commentId});
  Future<CommentModel> saveComment(CommentModel comment);
  Future<void> deleteComment({CommentModel comment});
  Future<CommentModel> editComment({CommentModel comment});
  Future<SubCommentModel> saveSubComment(
      {int commentId, SubCommentModel subComment});
  Future<void> deleteSubComment({SubCommentModel subComment});
  Future<SubCommentModel> editSubComment(
      {int commentId, SubCommentModel subComment});
}
