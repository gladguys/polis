part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class GetPostComments extends CommentEvent {
  GetPostComments({@required this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class AddComment extends CommentEvent {
  AddComment({this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

class DeleteComment extends CommentEvent {
  DeleteComment(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

class UpdateCommentReplies extends CommentEvent {
  UpdateCommentReplies({this.comment, this.subComments});

  final CommentModel comment;
  final List<SubCommentModel> subComments;

  @override
  List<Object> get props => [comment, subComments];
}

class StartEditingComment extends CommentEvent {
  StartEditingComment(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

class EditComment extends CommentEvent {
  EditComment({this.comment, this.newText});

  final CommentModel comment;
  final String newText;

  @override
  List<Object> get props => [comment, newText];
}

class StopEditingComment extends CommentEvent {
  @override
  List<Object> get props => [];
}
