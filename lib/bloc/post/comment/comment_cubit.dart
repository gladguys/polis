import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/model/comment_model.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/repository/abstract/comment_repository.dart';
import '../../../core/repository/utils.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(
      {@required this.post, @required this.repository, @required this.user})
      : assert(post != null),
        assert(repository != null),
        assert(user != null),
        super(InitialCommentState());

  final dynamic post;
  final CommentRepository repository;
  final UserModel user;

  List<CommentModel> postComments = [];

  void getPostComments({String postId}) async {
    emit(LoadingPostComments());

    try {
      postComments =
          await repository.getPostComments(postId: getIdFromPost(post));

      emit(GetPostCommentsSuccess(comments: postComments));
    } on Exception {
      emit(GetPostCommentsFailed());
    }
  }

  void addComment({String text}) async {
    final oldComments = [
      ...postComments,
    ];

    final commentToSave = CommentModel(
      postId: getIdFromPost(post),
      politicoId: getPoliticoIdFromPost(post),
      texto: text,
      usuarioId: user.userId,
      usuarioNome: user.name,
      diaHora: DateTime.now(),
      qntSubComentarios: 0,
      foiEditado: false,
    );

    final newComment = await repository.saveComment(commentToSave);

    postComments = [
      newComment,
      ...oldComments,
    ];

    emit(
      NewCommentAdded(
        comment: newComment,
        numberOfComments: postComments.length,
      ),
    );
  }

  void updateSubCommentsCount(
      {CommentModel updatedComment, List<SubCommentModel> subComments}) async {
    final updatedComments = [
      ...postComments,
    ];

    postComments = updatedComments.map((comment) {
      if (comment == updatedComment) {
        return comment.copyWith(
          qntSubComentarios: subComments.length,
        );
      }
      return comment;
    }).toList();

    emit(
      NewSubCommentAdded(
        comment: updatedComment,
        numberOfSubComments: subComments.length,
      ),
    );
  }

  void deleteComment(CommentModel commentToDelete) async {
    final currentComments = [
      ...postComments,
    ];
    currentComments.removeWhere((comment) => comment.id == commentToDelete.id);

    await repository.deleteComment(comment: commentToDelete);

    postComments = [
      ...currentComments,
    ];
    emit(
      CommentDeletedSuccess(
        comment: commentToDelete,
        numberOfComments: postComments.length,
      ),
    );
  }

  void startEditingComment(CommentModel comment) async {
    emit(
      EditingCommentStarted(
        comment,
      ),
    );
  }

  void editComment({CommentModel comment, String newText}) async {
    try {
      final commentToBeEdited = comment;
      final currentComments = [
        ...postComments,
      ];

      final commentIndex = currentComments
          .indexWhere((comment) => comment.id == commentToBeEdited.id);

      currentComments[commentIndex] = currentComments[commentIndex].copyWith(
        texto: newText,
      );

      await repository.editComment(comment: currentComments[commentIndex]);

      postComments = [
        ...currentComments,
      ];

      emit(
        CommentEditedSuccess(
          comment: commentToBeEdited,
        ),
      );
    } on Exception {
      emit(CommentEditedFailed());
    }
  }

  void stopEditingComment() async {
    emit(InitialCommentState());
  }
}
