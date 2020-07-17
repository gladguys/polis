import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/domain/model/sub_comment_model.dart';
import '../../../../core/repository/abstract/comment_repository.dart';
import '../../../../core/repository/utils.dart';
import '../../../blocs.dart';

part 'sub_comments_event.dart';
part 'sub_comments_state.dart';

class SubCommentsBloc extends Bloc<SubCommentsEvent, SubCommentsState> {
  SubCommentsBloc({
    @required this.post,
    @required this.comment,
    @required this.commentBloc,
    @required this.repository,
  })  : assert(post != null),
        assert(comment != null),
        assert(commentBloc != null),
        assert(repository != null),
        super(InitialSubCommentsState());

  final dynamic post;
  final CommentModel comment;
  final CommentBloc commentBloc;
  final CommentRepository repository;

  List<SubCommentModel> subComments = [];

  @override
  Stream<SubCommentsState> mapEventToState(SubCommentsEvent event) async* {
    if (event is GetCommentSubComments) {
      yield* _mapGetCommentSubCommentsToState(event);
    }
    if (event is AddSubComment) {
      yield* _mapAddSubCommentToState(event);
    }
    if (event is DeleteSubComment) {
      yield* _mapDeleteSubCommentToState(event);
    }
    if (event is StartEditingSubComment) {
      yield* _mapStartEditingSubCommentToState(event);
    }
    if (event is StopEditingSubComment) {
      yield* _mapStopEditingSubCommentToState(event);
    }
    if (event is EditSubComment) {
      yield* _mapEditSubCommentToState(event);
    }
  }

  Stream<SubCommentsState> _mapGetCommentSubCommentsToState(
      GetCommentSubComments event) async* {
    yield CommentSubCommentsLoading();
    final commentId = event.commentId;
    try {
      subComments = List.unmodifiable(
          await repository.getCommentSubComments(commentId: commentId));

      yield GetCommentSubCommentsSuccess(subComments);
    } on Exception {
      yield GetCommentSubCommentsFailed();
    }
  }

  Stream<SubCommentsState> _mapAddSubCommentToState(
      AddSubComment event) async* {
    try {
      final text = event.text;
      final user = commentBloc.user;

      final subCommentToSave = SubCommentModel(
        postId: getIdFromPost(post),
        texto: text,
        usuarioId: user.userId,
        usuarioNome: user.name,
        diaHora: DateTime.now(),
        comentarioPaiId: comment.id,
      );

      final savedSubComment = await repository.saveSubComment(
        commentId: comment.id,
        subComment: subCommentToSave,
      );

      final oldSubComments = [
        ...subComments,
      ];
      subComments = [
        ...oldSubComments,
        savedSubComment,
      ];

      commentBloc.add(
        UpdateCommentReplies(
          comment: comment,
          subComments: subComments,
        ),
      );

      yield AddedSubCommentSuccess(
        subCommentAdded: savedSubComment,
        numberOfReplies: subComments.length,
      );
    } on Exception {
      yield AddedSubCommentFailed();
    }
  }

  Stream<SubCommentsState> _mapDeleteSubCommentToState(
      DeleteSubComment event) async* {
    try {
      final subCommentToDelete = event.subComment;

      final oldSubComments = [
        ...subComments,
      ];

      oldSubComments.removeWhere((comment) => comment == subCommentToDelete);

      await repository.deleteSubComment(subComment: subCommentToDelete);

      subComments = [
        ...oldSubComments,
      ];

      commentBloc.add(
        UpdateCommentReplies(
          comment: comment,
          subComments: subComments,
        ),
      );

      yield DeletedSubCommentSuccess(
        subCommentDeleted: subCommentToDelete,
        numberOfReplies: subComments.length,
      );
    } on Exception {
      yield DeletedSubCommentFailed();
    }
  }

  Stream<SubCommentsState> _mapStartEditingSubCommentToState(
      StartEditingSubComment event) async* {
    yield EditingSubCommentStarted(
      event.subComment,
    );
  }

  Stream<SubCommentsState> _mapEditSubCommentToState(
      EditSubComment event) async* {
    final subCommentToBeEdited = event.subComment;
    final currentSubComments = [
      ...subComments,
    ];

    final subCommentIndex = currentSubComments
        .indexWhere((subComment) => subComment.id == subCommentToBeEdited.id);

    currentSubComments[subCommentIndex] =
        currentSubComments[subCommentIndex].copyWith(
      texto: event.newText,
    );

    await repository.editSubComment(
      commentId: comment.id,
      subComment: currentSubComments[subCommentIndex],
    );

    subComments = [
      ...currentSubComments,
    ];

    yield SubCommentEditedSuccess(
      subComment: event.subComment,
    );
  }

  Stream<SubCommentsState> _mapStopEditingSubCommentToState(
      StopEditingSubComment event) async* {
    yield InitialSubCommentsState();
  }
}
