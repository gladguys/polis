import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/model/comment_model.dart';
import '../../../core/repository/abstract/comment_repository.dart';
import '../../../core/repository/utils.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({@required this.post, @required this.repository})
      : assert(post != null),
        assert(repository != null);

  final dynamic post;
  final CommentRepository repository;

  List<CommentModel> postComments;

  @override
  CommentState get initialState => InitialCommentState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is GetPostComments) {
      yield LoadingPostComments();

      try {
        postComments =
            await repository.getPostComments(postId: getIdFromPost(post));

        yield GetPostCommentsSuccess(comments: postComments);
      } on Exception {
        yield GetPostCommentsFailed();
      }
    }
    if (event is AddComment) {
      final oldComments = [
        ...postComments,
      ];
      final newComment = CommentModel(
        id: '1',
        texto: event.text,
      );
      postComments = [
        newComment,
        ...oldComments,
      ];
      yield NewCommentAdded(
        comment: newComment,
        numberOfComments: postComments.length,
      );
    }
    if (event is UpdateCommentReplies) {
      final comment = event.comment;
      final replies = event.replies;
      final indexOfComment = postComments
          .indexWhere((postComment) => postComment.id == comment.id);
      postComments[indexOfComment] = postComments[indexOfComment].copyWith(
        respostas: [...replies],
      );

      yield NewReplyCommentAdded(
        comment: comment,
        numberOfComments: postComments.length,
      );
    }
  }
}
