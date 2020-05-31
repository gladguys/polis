import 'dart:io';

import '../../../core/domain/model/models.dart';

abstract class SignupRepository {
  Future<void> createUserWithEmailAndPassword(
      UserModel user, File profilePhoto);
  Future<UserModel> createFirestoreUser(String uid, UserModel user);
  Future<bool> userExists(String uid);
}
