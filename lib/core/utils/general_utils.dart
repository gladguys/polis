import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../domain/model/models.dart';

bool isPostProposal(dynamic post) {
  return post is PropostaModel;
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

bool isPostByIdLikedForUser(BuildContext context, {String postId}) {
  final user = context.bloc<UserBloc>().user;
  return user.userLikes != null ? (user.userLikes[postId] ?? false) : false;
}

bool isPostByIdUnlikedForUser(BuildContext context, {String postId}) {
  final user = context.bloc<UserBloc>().user;
  return user.userUnlikes != null ? (user.userUnlikes[postId] ?? false) : false;
}

String getPostId(dynamic post) {
  if (post is PropostaModel) {
    return post.idPropostaPolitico;
  } else {
    return post.id;
  }
}

String getPoliticoIdFromPost(dynamic post) {
  if (post is PropostaModel) {
    return post.idPoliticoAutor;
  } else if (post is DespesaModel) {
    return post.idPolitico;
  }
  return null;
}
