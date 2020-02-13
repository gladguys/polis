import 'package:equatable/equatable.dart';

import '../../model/user_model.dart';

abstract class SignupEvent extends Equatable {}

class Signup extends SignupEvent {
  Signup(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
