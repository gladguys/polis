import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/model/comment_model.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/repository/abstract/comment_repository.dart';
import '../../../core/repository/utils.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(
      {@required this.post, @required this.repository, @required this.user})
      : assert(post != null),
        assert(repository != null),
        assert(user != null);

  final dynamic post;
  final CommentRepository repository;
  final UserModel user;

  List<CommentModel> postComments = [];

  @override
  CommentState get initialState => InitialCommentState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is GetPostComments) {
      yield* _mapGetPostCommentsToState(event);
    }
    if (event is AddComment) {
      yield* _mapAddCommentToState(event);
    }
    if (event is UpdateCommentReplies) {
      yield* _mapUpdateCommentRepliesToState(event);
    }
    if (event is DeleteComment) {
      yield* _mapDeleteCommentToState(event);
    }
  }

  Stream<CommentState> _mapGetPostCommentsToState(
      GetPostComments event) async* {
    yield LoadingPostComments();

    try {
      postComments =
          await repository.getPostComments(postId: getIdFromPost(post));

      yield GetPostCommentsSuccess(comments: postComments);
    } on Exception {
      yield GetPostCommentsFailed();
    }
  }

  Stream<CommentState> _mapAddCommentToState(AddComment event) async* {
    final oldComments = [
      ...postComments,
    ];

    final commentToSave = CommentModel(
      postId: getIdFromPost(post),
      texto: event.text,
      usuarioId: user.userId,
      usuarioNome: user.name,
      diaHora: DateTime.now().toString(),
    );

    final newComment = await repository.saveComment(commentToSave);

    postComments = [
      newComment,
      ...oldComments,
    ];

    yield NewCommentAdded(
      comment: newComment,
      numberOfComments: postComments.length,
    );
  }

  Stream<CommentState> _mapUpdateCommentRepliesToState(
      UpdateCommentReplies event) async* {
    final comment = event.comment;
    final subComments = event.subComments;

    yield NewReplyCommentAdded(
      comment: comment,
      numberOfReplies: subComments.length,
    );
  }

  Stream<CommentState> _mapDeleteCommentToState(DeleteComment event) async* {
    final commentToDelete = event.comment;
    final currentComments = [
      ...postComments,
    ];
    currentComments.removeWhere((comment) => comment.id == commentToDelete.id);

    postComments = [
      ...currentComments,
    ];
    yield CommentDeletedSuccess(
      comment: commentToDelete,
      numberOfComments: postComments.length,
    );
  }
}
