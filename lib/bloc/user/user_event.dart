part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class StoreUser extends UserEvent {
  StoreUser(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class Logout extends UserEvent {
  @override
  List<Object> get props => [];
}

class UpdateCurrentUser extends UserEvent {
  UpdateCurrentUser(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class AddCommentToUser extends UserEvent {
  AddCommentToUser(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}

class DeleteCommentToUser extends UserEvent {
  DeleteCommentToUser(this.comment);

  final CommentModel comment;

  @override
  List<Object> get props => [comment];
}
