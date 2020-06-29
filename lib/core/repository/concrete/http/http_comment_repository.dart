import '../../../domain/model/comment_model.dart';
import '../../abstract/comment_repository.dart';

class HttpCommentRepository implements CommentRepository {
  @override
  Future<List<CommentModel>> getPostComments({String postId}) {
    final comments = [
      CommentModel(id: '1', texto: 'Apoio esse projeto de lei!!!'),
      CommentModel(id: '2', texto: 'Palhaçada geral!', respostas: [
        CommentModel(id: '3', texto: 'Palhaço é você meu amigo!'),
        CommentModel(id: '4', texto: 'Respeita teu pai!'),
      ]),
    ];
    return Future.value(comments);
  }

  @override
  Future<CommentModel> saveComment({String postId, CommentModel comment}) {
    throw UnimplementedError();
  }

  @override
  Future<CommentModel> saveCommentReply(
      {String postId, CommentModel comment, CommentModel replyComment}) {
    throw UnimplementedError();
  }
}
