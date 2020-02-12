import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({this.name, this.email, this.password});

  final String name;
  final String email;
  final String password;

  @override
  List<Object> get props => [name, email];
}
