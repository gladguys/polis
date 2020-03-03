import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/user_model.dart';

void main() {
  final jsonUser = {
    'userId': 'userId',
    'name': 'name',
    'email': 'email',
    'photoUrl': 'photoUrl',
  };

  final userModel = UserModel(
      userId: 'userId', name: 'name', email: 'email', photoUrl: 'photoUrl');

  group('UserModel tests', () {
    test('props', () {
      final user1 = UserModel(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
        password: 'verysecret',
      );
      final user2 = UserModel(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
        password: 'verysecretqqq',
      );
      final user3 = UserModel(
        userId: '3',
        name: 'user3',
        email: 'user3@gmail.com',
        password: 'verysecret',
      );

      expect(user1 == user2, true);
      expect(user1 == user3, false);
    });

    test('toString()', () {
      final modelToString = UserModel(userId: 'myId').toString();
      final result =
          '''UserModel{userId: myId, name: null, email: null, photoUrl: null, password: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(UserModel.fromJson(jsonUser) == userModel, true);
    });

    test('toJson()', () {
      final userToJson = userModel.toJson();
      expect(userToJson['userId'] == jsonUser['userId'], true);
      expect(userToJson['name'] == jsonUser['name'], true);
      expect(userToJson['email'] == jsonUser['email'], true);
      expect(userToJson['password'] == jsonUser['password'], true);
    });
  });
}
