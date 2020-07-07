import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/repository/abstract/comment_repository.dart';
import '../../../blocs.dart';

part 'comment_replies_event.dart';
part 'comment_replies_state.dart';

class CommentRepliesBloc
    extends Bloc<CommentRepliesEvent, CommentRepliesState> {
  CommentRepliesBloc({
    @required this.post,
    @required this.comment,
    @required this.commentBloc,
    @required this.repository,
  }) {
    assert(post != null);
    assert(comment != null);
    assert(commentBloc != null);
    assert(repository != null);
  }

  final dynamic post;
  final CommentModel comment;
  final CommentBloc commentBloc;
  final CommentRepository repository;

  List<CommentModel> commentReplies;

  @override
  CommentRepliesState get initialState => InitialCommentRepliesState();

  @override
  Stream<CommentRepliesState> mapEventToState(
      CommentRepliesEvent event) async* {
    if (event is GetCommentSubComments) {
      yield* _mapGetCommentSubCommentsToState(event);
    }
    if (event is AddReplyComment) {
      yield* _mapAddReplyCommentToState(event);
    }
  }

  Stream<CommentRepliesState> _mapGetCommentSubCommentsToState(
      GetCommentSubComments event) async* {
    final commentId = event.commentId;
    try {
      commentReplies =
          await repository.getCommentSubComments(commentId: commentId);
      yield GetCommentSubCommentsSuccess(commentReplies);
    } on Exception {
      yield GetCommentSubCommentsFailed();
    }
  }

  Stream<CommentRepliesState> _mapAddReplyCommentToState(
      AddReplyComment event) async* {
    final text = event.text;
    final newComment = CommentModel(
      texto: text,
      diaHora: DateTime.now().toString(),
    );
    final oldCommentReplies = [
      ...commentReplies,
    ];
    commentReplies = [
      ...oldCommentReplies,
      newComment,
    ];

    commentBloc.add(
      UpdateCommentReplies(
        comment: comment,
        replies: commentReplies,
      ),
    );

    yield AddedReplyCommentSuccess(
      replyCommentAdded: newComment,
      numberOfReplies: commentReplies.length,
    );
  }
}
