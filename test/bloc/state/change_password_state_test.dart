import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';

void main() {
  group('ChangePasswordState tests', () {
    test('states', () {
      expect(InitialChangePasswordState(), InitialChangePasswordState());
      expect(UserPasswordChangeSuccess(), UserPasswordChangeSuccess());
      expect(UserWrongPasswordInformed(), UserWrongPasswordInformed());
      expect(UserPasswordChangeFailed(), UserPasswordChangeFailed());
    });
  });
}
