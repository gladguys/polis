abstract class ChangePasswordRepository {
  Future<void> changeUserPassword({String currentPassword, String newPassword});
}
