part of 'comment_replies_bloc.dart';

abstract class CommentRepliesEvent extends Equatable {
  const CommentRepliesEvent();
}

class AddReplyComment extends CommentRepliesEvent {
  AddReplyComment({this.commentReplied, this.text});

  final CommentModel commentReplied;
  final String text;

  @override
  List<Object> get props => [commentReplied, text];
}
