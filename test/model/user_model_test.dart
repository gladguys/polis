import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    test('UserModel props', () {
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

    test('UserModel toString() works', () {
      final modelToString = UserModel(userId: 'myId').toString();
      final result =
          '''UserModel{userId: myId, name: null, email: null, photoUrl: null, password: null}''';
      expect(modelToString == result, true);
    });

    test('UserModel fromJson() works', () {
      expect(UserModel.fromJson(jsonUser) == userModel, true);
    });

    test('UserModel toJson() works', () {
      final userToJson = userModel.toJson();
      expect(userToJson['userId'] == jsonUser['userId'], true);
      expect(userToJson['name'] == jsonUser['name'], true);
      expect(userToJson['email'] == jsonUser['email'], true);
      expect(userToJson['password'] == jsonUser['password'], true);
    });

    test('UserModel userFromGoogle() works', () {
      final userFromGoogle = UserModel.userFromGoogle(MockGoogleIdentity());
      expect(userFromGoogle == userModel, true);
    });

    test('UserModel userFromFirebase() works', () {
      final userFromGoogle = UserModel.userFromFirebase(MockFirebaseUser());
      expect(userFromGoogle == userModel, true);
    });
  });
}

class MockGoogleIdentity implements GoogleIdentity {
  @override
  String get displayName => 'name';

  @override
  String get email => 'email';

  @override
  String get id => 'userId';

  @override
  String get photoUrl => 'photoUrl';
}

class MockFirebaseUser implements FirebaseUser {
  @override
  Future<void> delete() {
    return null;
  }

  @override
  String get displayName => 'name';

  @override
  String get email => 'email';

  @override
  Future<IdTokenResult> getIdToken({bool refresh = false}) {
    return null;
  }

  @override
  bool get isAnonymous => false;

  @override
  bool get isEmailVerified => false;

  @override
  Future<AuthResult> linkWithCredential(AuthCredential credential) {
    return null;
  }

  @override
  FirebaseUserMetadata get metadata => null;

  @override
  String get phoneNumber => null;

  @override
  String get photoUrl => 'photoUrl';

  @override
  List<UserInfo> get providerData => null;

  @override
  String get providerId => null;

  @override
  Future<AuthResult> reauthenticateWithCredential(AuthCredential credential) {
    return null;
  }

  @override
  Future<void> reload() {
    return null;
  }

  @override
  Future<void> sendEmailVerification() {
    return null;
  }

  @override
  String get uid => 'userId';

  @override
  Future<void> unlinkFromProvider(String provider) {
    return null;
  }

  @override
  Future<void> updateEmail(String email) {
    return null;
  }

  @override
  Future<void> updatePassword(String password) {
    return null;
  }

  @override
  Future<void> updatePhoneNumberCredential(AuthCredential credential) {
    return null;
  }

  @override
  Future<void> updateProfile(UserUpdateInfo userUpdateInfo) {
    return null;
  }
}
