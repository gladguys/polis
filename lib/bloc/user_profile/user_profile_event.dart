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
