import 'package:equatable/equatable.dart';
import 'package:sealed_class/sealed_class.dart';

part 'edit_profile_state.g.dart';

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
