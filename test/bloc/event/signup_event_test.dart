import 'package:flutter_test/flutter_test.dart';
import 'package:polis/bloc/blocs.dart';
import 'package:polis/model/user_model.dart';

void main() {
  group('SignupEvent tests', () {
    test('test props', () {
      final ev1 = Signup(user: UserModel(userId: '1'));
      final ev2 = Signup(user: UserModel(userId: '1'));
      final ev3 = Signup(user: UserModel(userId: '3'));

      expect(ev1 == ev2, true);
      expect(ev1 == ev3, false);
    });
  });
}
