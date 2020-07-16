part of 'sub_comments_bloc.dart';

abstract class SubCommentsEvent extends Equatable {
  const SubCommentsEvent();
}

class GetCommentSubComments extends SubCommentsEvent {
  GetCommentSubComments({this.commentId});

  final int commentId;

  @override
  List<Object> get props => [commentId];
}

class AddSubComment extends SubCommentsEvent {
  AddSubComment({this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

class DeleteSubComment extends SubCommentsEvent {
  DeleteSubComment({this.subComment});

  final SubCommentModel subComment;

  @override
  List<Object> get props => [subComment];
}
