part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class FetchUserRelatedInfo extends UserProfileEvent {
  FetchUserRelatedInfo(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class GetPostInfo extends UserProfileEvent {
  GetPostInfo({this.postId, this.politicId, this.postType});

  final String postId;
  final String politicId;
  final PostType postType;

  @override
  List<Object> get props => [postId, politicId, postType];
}
