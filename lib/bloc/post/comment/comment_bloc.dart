import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/model/comment_model.dart';
import '../../../core/repository/abstract/comment_repository.dart';
import '../../../core/repository/utils.dart';
import '../../blocs.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(
      {@required this.post, @required this.repository, @required this.userBloc})
      : assert(post != null),
        assert(repository != null),
        assert(userBloc != null);

  final dynamic post;
  final CommentRepository repository;
  final UserBloc userBloc;

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
    final newComment = CommentModel(
      // TODO: save the comment on the polis-api
      // TODO: this should match the id create on the server for the comment
      //id: Random().nextInt(9999).toString(),
      id: '7',
      texto: event.text,
    );

    userBloc.add(AddCommentToUser(newComment));

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
    final replies = event.replies;
    final indexOfComment =
        postComments.indexWhere((postComment) => postComment.id == comment.id);

    yield NewReplyCommentAdded(
      comment: comment,
      numberOfReplies: replies.length,
    );
  }

  Stream<CommentState> _mapDeleteCommentToState(DeleteComment event) async* {
    final commentToDelete = event.comment;
    final currentComments = [
      ...postComments,
    ];
    currentComments.removeWhere((comment) => comment.id == commentToDelete.id);

    userBloc.add(DeleteCommentToUser(commentToDelete));

    postComments = [
      ...currentComments,
    ];
    yield CommentDeletedSuccess(
      comment: commentToDelete,
      numberOfComments: postComments.length,
    );
  }
}
