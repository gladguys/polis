import 'dart:io';

import '../../model/models.dart';

abstract class EditProfileRepository {
  Future<UserModel> updateUserInfo(
      {UserModel currentUser, String name, String email, File pickedPhoto});
}
