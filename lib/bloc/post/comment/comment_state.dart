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

class NewReplyCommentAdded extends CommentState {
  NewReplyCommentAdded({this.comment, this.numberOfReplies});

  final CommentModel comment;
  final int numberOfReplies;

  @override
  List<Object> get props => [comment, numberOfReplies];
}
