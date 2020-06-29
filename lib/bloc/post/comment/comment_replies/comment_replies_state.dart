part of 'comment_replies_bloc.dart';

abstract class CommentRepliesState extends Equatable {
  const CommentRepliesState();
}

class InitialCommentRepliesState extends CommentRepliesState {
  @override
  List<Object> get props => [];
}

class AddedReplyCommentSuccess extends CommentRepliesState {
  AddedReplyCommentSuccess({this.replyCommentAdded, this.numberOfReplies});

  final CommentModel replyCommentAdded;
  final int numberOfReplies;

  @override
  List<Object> get props => [replyCommentAdded, numberOfReplies];
}

class LoadingAddReplyComment extends CommentRepliesState {
  @override
  List<Object> get props => [];
}

class AddedReplyCommentFailed extends CommentRepliesState {
  @override
  List<Object> get props => [];
}
