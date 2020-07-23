import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/cubits.dart';

void main() {
  group('ChangePasswordState tests', () {
    test('states', () {
      expect(InitialChangePasswordState(), InitialChangePasswordState());
      expect(UserPasswordChanging(), UserPasswordChanging());
      expect(UserPasswordChangeSuccess(), UserPasswordChangeSuccess());
      expect(UserWrongPasswordInformed(), UserWrongPasswordInformed());
      expect(UserPasswordChangeFailed(), UserPasswordChangeFailed());
    });
  });
}
