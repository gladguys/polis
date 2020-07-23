part of 'edit_profile_cubit.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();
}

class InitialEditProfileState extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UpdatingUser extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UserUpdateSuccess extends EditProfileState {
  @override
  List<Object> get props => [];
}

class UserUpdateFailed extends EditProfileState {
  @override
  List<Object> get props => [];
}
