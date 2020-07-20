import 'package:tuple/tuple.dart';

import '../domain/enum/post_type.dart';
import '../domain/model/models.dart';

PostType getPostType(dynamic post) {
  if (post is PropostaModel) {
    return PostType.PROPOSICAO;
  } else {
    return PostType.DESPESA;
  }
}

bool isPostProposal(dynamic post) {
  return post is PropostaModel;
}

bool isPostExpense(dynamic post) {
  return post is DespesaModel;
}

Tuple2<bool, bool> getPostLikeStatusForUser({dynamic post, UserModel user}) {
  final isLiked = isPostLikedForUser(post: post, user: user);
  final isUnliked = isPostUnlikedForUser(post: post, user: user);
  return Tuple2<bool, bool>(isLiked, isUnliked);
}

bool isPostLikedForUser({dynamic post, UserModel user}) {
  String postId;
  if (post is PropostaModel) {
    postId = post.idPropostaPolitico;
  } else {
    postId = post.id;
  }
  return user.userLikes != null ? (user.userLikes[postId] ?? false) : false;
}

bool isPostUnlikedForUser({dynamic post, UserModel user}) {
  String postId;
  if (post is PropostaModel) {
    postId = post.idPropostaPolitico;
  } else {
    postId = post.id;
  }
  return user.userUnlikes != null ? (user.userUnlikes[postId] ?? false) : false;
}

String getPostId(dynamic post) {
  if (post is PropostaModel) {
    return post.idPropostaPolitico;
  } else if (post is DespesaModel) {
    return post.id;
  }
  return null;
}

String getPoliticoIdFromPost(dynamic post) {
  if (post is PropostaModel) {
    return post.idPoliticoAutor;
  } else if (post is DespesaModel) {
    return post.idPolitico;
  }
  return null;
}

PostType getPostTypeFromJson(dynamic post) {
  if (post['tipoAtividade'] == 'DESPESA') {
    return PostType.DESPESA;
  } else {
    return PostType.PROPOSICAO;
  }
}

String getPostIdFromJson(dynamic post) {
  return post['idPropostaPolitico'] ?? post['id'];
}

String getPoliticoIdFromPostJson(dynamic post) {
  return post['idPoliticoAutor'] ?? post['idPolitico'];
}
