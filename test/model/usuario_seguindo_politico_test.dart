import 'package:flutter_test/flutter_test.dart';
import 'package:polis/model/models.dart';

void main() {
  final jsonUserFollowing = {
    'userId': 'userId',
    'name': 'name',
    'email': 'email',
    'photoUrl': 'photoUrl',
  };

  final userSeguindoModel = UsuarioSeguindoPolitico(
    userId: 'userId',
    name: 'name',
    email: 'email',
    photoUrl: 'photoUrl',
  );

  group('UsuarioSeguindoPolitico tests', () {
    test('props', () {
      final user1 = UsuarioSeguindoPolitico(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
      );
      final user2 = UsuarioSeguindoPolitico(
        userId: '1',
        name: 'user1',
        email: 'user1@gmail.com',
      );
      final user3 = UsuarioSeguindoPolitico(
        userId: '3',
        name: 'user3',
        email: 'user3@gmail.com',
      );

      expect(user1 == user2, true);
      expect(user1 == user3, false);
    });

    test('toString()', () {
      final modelToString = UsuarioSeguindoPolitico(userId: 'myId').toString();
      final result =
          '''UsuarioSeguindoPolitico{userId: myId, photoUrl: null, name: null, email: null}''';
      expect(modelToString == result, true);
    });

    test('fromJson()', () {
      expect(
          UsuarioSeguindoPolitico.fromJson(jsonUserFollowing) ==
              userSeguindoModel,
          true);
    });

    test('toJson()', () {
      final userToJson = userSeguindoModel.toJson();
      expect(userToJson['userId'] == jsonUserFollowing['userId'], true);
      expect(userToJson['name'] == jsonUserFollowing['name'], true);
      expect(userToJson['email'] == jsonUserFollowing['email'], true);
      expect(userToJson['photoUrl'] == jsonUserFollowing['photoUrl'], true);
    });
  });
}
