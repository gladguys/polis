import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/user_model.dart';

void main() {
  group('UserModel tests', () {
    test('UserModel props', () {
      final user1 = UserModel(
          name: 'user1', email: 'user1@gmail.com', password: 'verysecret');
      final user2 = UserModel(
          name: 'user1', email: 'user1@gmail.com', password: 'verysecretqqq');
      final user3 = UserModel(
          name: 'user3', email: 'user3@gmail.com', password: 'verysecret');

      expect(user1 == user2, true);
      expect(user1 == user3, false);
    });
  });
}
