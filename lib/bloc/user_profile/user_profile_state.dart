part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class InitialUserProfileState extends UserProfileState {
  @override
  List<Object> get props => [];
}

class FetchUserRelatedInfoSuccess extends UserProfileState {
  FetchUserRelatedInfoSuccess(
      {@required this.politicsFollowing, @required this.userActions})
      : assert(politicsFollowing != null),
        assert(userActions != null);

  final List<PoliticoModel> politicsFollowing;
  final List<AcaoUsuarioModel> userActions;

  @override
  List<Object> get props => [politicsFollowing, userActions];
}

class FetchUserRelatedInfoFailed extends UserProfileState {
  @override
  List<Object> get props => [];
}

class LoadingFetchUserInfo extends UserProfileState {
  @override
  List<Object> get props => [];
}
