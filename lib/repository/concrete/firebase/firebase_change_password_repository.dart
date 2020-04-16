import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exceptions.dart';
import '../../abstract/change_password_repository.dart';
import 'firebase_error_constants.dart';

class FirebaseChangePasswordRepository implements ChangePasswordRepository {
  FirebaseChangePasswordRepository({@required this.firebaseAuth})
      : assert(firebaseAuth != null);

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> changeUserPassword(
      {String currentPassword, String newPassword}) async {
    final authUser = await firebaseAuth.currentUser();
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: authUser.email, password: currentPassword);
      await authUser.updatePassword(newPassword);
    } on Exception catch (e) {
      if (e.toString().contains(ERROR_WRONG_PASSWORD)) {
        throw WrongPasswordException();
      } else {
        throw ComunicationException();
      }
    }
  }
}
