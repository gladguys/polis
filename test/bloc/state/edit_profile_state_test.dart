import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';

void main() {
  group('EditProfileState tests', () {
    test('states', () {
      expect(InitialEditProfileState(), InitialEditProfileState());
      expect(UpdatingUser(), UpdatingUser());
      expect(UserUpdateSuccess(), UserUpdateSuccess());
      expect(UserUpdateFailed(), UserUpdateFailed());
    });
  });
}
