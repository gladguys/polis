import 'package:flutter_test/flutter_test.dart';
import 'package:polis/core/domain/enum/auth_provider.dart';
import 'package:polis/core/domain/model/models.dart';

void main() {
  final jsonUser = {
    'userId': 'userId',
    'name': 'name',
    'email': 'email',
    'photoUrl': 'photoUrl',
    'authProvider': 'GOOGLE',
    'isFirstLoginDone': true,
  };

  final userModel = UserModel(
      userId: 'userId',
      name: 'name',
      email: 'email',
      photoUrl: 'photoUrl',
      authProvider: AuthProvider.google,
      isFirstLoginDone: true);

  group('UserModel tests', () {
    test('props', () {
      final user1 = UserModel(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
        password: 'verysecret',
        authProvider: AuthProvider.google,
        isFirstLoginDone: true,
      );
      final user2 = UserModel(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
        password: 'verysecretqqq',
        authProvider: AuthProvider.google,
        isFirstLoginDone: true,
      );
      final user3 = UserModel(
        userId: '3',
        name: 'user3',
        email: 'user3@gmail.com',
        password: 'verysecret',
        authProvider: AuthProvider.emailAndPassword,
        isFirstLoginDone: false,
      );

      expect(user1 == user2, true);
      expect(user1 == user3, false);
    });

    test('toString()', () {
      final modelToString = UserModel(userId: 'myId').toString();
      final result =
          '''UserModel{userId: myId, name: null, email: null, photoUrl: null, isFirstLoginDone: null, authProvider: null, password: null, fcmToken: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(UserModel.fromJson(jsonUser) == userModel, true);
    });

    test('copyWith()', () {
      final user = UserModel(isFirstLoginDone: true);
      final userCopyName = user.copyWith(name: 'Rod');
      final userCopyFirstLogin = user.copyWith(isFirstLoginDone: false);
      expect(user.isFirstLoginDone, true);
      expect(userCopyName.isFirstLoginDone, true);
      expect(userCopyFirstLogin.isFirstLoginDone, false);
    });

    test('toJson()', () {
      final userToJson = userModel.toJson();
      expect(userToJson['userId'] == jsonUser['userId'], true);
      expect(userToJson['name'] == jsonUser['name'], true);
      expect(userToJson['email'] == jsonUser['email'], true);
      expect(userToJson['password'] == jsonUser['password'], true);
      expect(userToJson['authProvider'] == jsonUser['authProvider'], true);
      expect(
          userToJson['isFirstLoginDone'] == jsonUser['isFirstLoginDone'], true);
    });
  });
}
