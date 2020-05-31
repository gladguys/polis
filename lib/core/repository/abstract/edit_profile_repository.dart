import 'dart:io';

import '../../../core/domain/model/models.dart';

abstract class EditProfileRepository {
  Future<UserModel> updateUserInfo(
      {UserModel currentUser, String name, String email, File pickedPhoto});
}
