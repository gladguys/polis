import 'dart:io';

import '../../model/models.dart';

abstract class SignupRepository {
  Future<void> createUserWithEmailAndPassword(
      UserModel user, File profilePhoto);
  Future<UserModel> createFirestoreUser(String uid, UserModel user);
  Future<bool> userExists(String uid);
}
