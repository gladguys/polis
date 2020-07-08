part of 'sub_comments_bloc.dart';

abstract class SubCommentsState extends Equatable {
  const SubCommentsState();
}

class InitialSubCommentsState extends SubCommentsState {
  @override
  List<Object> get props => [];
}

class GetCommentSubCommentsSuccess extends SubCommentsState {
  GetCommentSubCommentsSuccess(this.subComments);

  final List<CommentModel> subComments;

  @override
  List<Object> get props => [subComments];
}

class CommentSubCommentsLoading extends SubCommentsState {
  @override
  List<Object> get props => [];
}

class GetCommentSubCommentsFailed extends SubCommentsState {
  @override
  List<Object> get props => [];
}

class AddedSubCommentSuccess extends SubCommentsState {
  AddedSubCommentSuccess({this.subCommentAdded, this.numberOfReplies});

  final SubCommentModel subCommentAdded;
  final int numberOfReplies;

  @override
  List<Object> get props => [subCommentAdded, numberOfReplies];
}

class LoadingAddSubComment extends SubCommentsState {
  @override
  List<Object> get props => [];
}

class AddedSubCommentFailed extends SubCommentsState {
  @override
  List<Object> get props => [];
}

class DeletedSubCommentSuccess extends SubCommentsState {
  DeletedSubCommentSuccess({this.subCommentDeleted, this.numberOfReplies});

  final SubCommentModel subCommentDeleted;
  final int numberOfReplies;

  @override
  List<Object> get props => [subCommentDeleted, numberOfReplies];
}

class DeletedSubCommentFailed extends SubCommentsState {
  @override
  List<Object> get props => [];
}
