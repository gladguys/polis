import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';

abstract class SignupEvent extends Equatable {}

class Signup extends SignupEvent {
  Signup({@required this.user, this.profilePhoto}) : assert(user != null);

  final UserModel user;
  final File profilePhoto;

  @override
  List<Object> get props => [user];
}
