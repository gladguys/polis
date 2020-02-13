import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/firebase_user_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseUserRepository tests', () {
    MockFirebaseAuth mockFirebaseAuth;
    FirebaseUserRepository firebaseUserRepository;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      firebaseUserRepository =
          FirebaseUserRepository(firebaseAuth: mockFirebaseAuth);
    });

    test('test asserts', () {
      expect(() => FirebaseUserRepository(firebaseAuth: null),
          throwsAssertionError);
    });

    test('should signOut user', () async {
      when(mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());
      await firebaseUserRepository.signOut();
    });

    test('should throw SignOutException when exception is thrown', () async {
      when(mockFirebaseAuth.signOut()).thenThrow(Exception());
      firebaseUserRepository.signOut().then((_) {}).catchError((e) {
        expect(e, isInstanceOf<SignOutException>());
      });
    });
  });
}
