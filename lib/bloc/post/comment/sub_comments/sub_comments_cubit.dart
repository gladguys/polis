import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/model/comment_model.dart';
import '../../../../core/domain/model/sub_comment_model.dart';
import '../../../../core/repository/abstract/comment_repository.dart';
import '../../../../core/repository/utils.dart';
import '../../../cubits.dart';

part 'sub_comments_state.dart';

class SubCommentsCubit extends Cubit<SubCommentsState> {
  SubCommentsCubit({
    @required this.post,
    @required this.comment,
    @required this.commentCubit,
    @required this.repository,
  })  : assert(post != null),
        assert(comment != null),
        assert(commentCubit != null),
        assert(repository != null),
        super(InitialSubCommentsState());

  final dynamic post;
  final CommentModel comment;
  final CommentCubit commentCubit;
  final CommentRepository repository;

  List<SubCommentModel> subComments = [];

  void getCommentSubComments({int commentId}) async {
    emit(CommentSubCommentsLoading());

    try {
      subComments = List.unmodifiable(
          await repository.getCommentSubComments(commentId: commentId));

      emit(GetCommentSubCommentsSuccess(subComments));
    } on Exception {
      emit(GetCommentSubCommentsFailed());
    }
  }

  void addSubComment({String text}) async {
    try {
      final user = commentCubit.user;

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

      commentCubit.updateSubCommentsCount(
        updatedComment: comment,
        subComments: subComments,
      );

      emit(
        AddedSubCommentSuccess(
          subCommentAdded: savedSubComment,
          numberOfReplies: subComments.length,
        ),
      );
    } on Exception {
      emit(AddedSubCommentFailed());
    }
  }

  void deleteSubComment({SubCommentModel subComment}) async {
    try {
      final subCommentToDelete = subComment;

      final oldSubComments = [
        ...subComments,
      ];

      oldSubComments.removeWhere((comment) => comment == subCommentToDelete);

      await repository.deleteSubComment(subComment: subCommentToDelete);

      subComments = [
        ...oldSubComments,
      ];

      commentCubit.updateSubCommentsCount(
        updatedComment: comment,
        subComments: subComments,
      );

      emit(
        DeletedSubCommentSuccess(
          subCommentDeleted: subCommentToDelete,
          numberOfReplies: subComments.length,
        ),
      );
    } on Exception {
      emit(DeletedSubCommentFailed());
    }
  }

  void startEditingSubComment(SubCommentModel subComment) async {
    emit(
      EditingSubCommentStarted(
        subComment,
      ),
    );
  }

  void editSubComment({SubCommentModel subComment, String newText}) async {
    try {
      final subCommentToBeEdited = subComment;
      final currentSubComments = [
        ...subComments,
      ];

      final subCommentIndex = currentSubComments
          .indexWhere((subComment) => subComment.id == subCommentToBeEdited.id);

      currentSubComments[subCommentIndex] =
          currentSubComments[subCommentIndex].copyWith(
        texto: newText,
      );

      await repository.editSubComment(
        commentId: comment.id,
        subComment: currentSubComments[subCommentIndex],
      );

      subComments = [
        ...currentSubComments,
      ];

      emit(
        SubCommentEditedSuccess(
          subComment: subComment,
        ),
      );
    } on Exception {
      emit(SubCommentEditedFailed());
    }
  }

  void stopEditingSubComment() async {
    emit(InitialSubCommentsState());
  }
}
