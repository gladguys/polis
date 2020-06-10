part of 'edit_profile_bloc.dart';

@Sealed([
  InitialEditProfileState,
  UserUpdateSuccess,
  UpdatingUser,
  UserUpdateFailed,
])
abstract class EditProfileState extends Equatable {
  const EditProfileState();
}

class InitialEditProfileState extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UserUpdateSuccess extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UpdatingUser extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UserUpdateFailed extends EditProfileState {
  @override
  List<Object> get props => [];
}
