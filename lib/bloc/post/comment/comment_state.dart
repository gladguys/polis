part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class InitialCommentState extends CommentState {
  @override
  List<Object> get props => [];
}

class GetPostCommentsSuccess extends CommentState {
  GetPostCommentsSuccess({this.comments});

  final List<CommentModel> comments;

  @override
  List<Object> get props => [comments];
}

class LoadingPostComments extends CommentState {
  @override
  List<Object> get props => [];
}

class GetPostCommentsFailed extends CommentState {
  @override
  List<Object> get props => [];
}

class NewCommentAdded extends CommentState {
  NewCommentAdded({this.comment, this.numberOfComments});

  final CommentModel comment;
  final int numberOfComments;

  @override
  List<Object> get props => [comment, numberOfComments];
}

class CommentDeletedSuccess extends CommentState {
  CommentDeletedSuccess({this.comment, this.numberOfComments});

  final CommentModel comment;
  final int numberOfComments;

  @override
  List<Object> get props => [comment, numberOfComments];
}

class NewSubCommentAdded extends CommentState {
  NewSubCommentAdded({this.comment, this.numberOfReplies});

  final CommentModel comment;
  final int numberOfReplies;

  @override
  List<Object> get props => [comment, numberOfReplies];
}

class EditingCommentStarted extends CommentState {
  EditingCommentStarted(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

class CommentEditedSuccess extends CommentState {
  CommentEditedSuccess({this.comment});

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

class CommentEditedFailed extends CommentState {
  @override
  List<Object> get props => [];
}
