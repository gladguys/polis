import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  FirebaseChangePasswordRepository firebaseChangePasswordRepository;
  MockFirebaseAuth mockFirebaseAuth;

  group('FirebaseChangePasswordRepository tests', () {
    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      firebaseChangePasswordRepository = FirebaseChangePasswordRepository(
        firebaseAuth: mockFirebaseAuth,
      );
    });

    test('test asserts', () {
      expect(() => FirebaseChangePasswordRepository(firebaseAuth: null),
          throwsAssertionError);
    });

    group('changeUserPassword', () {
      test('should try to auth the user with the given password', () async {
        final mockAuthResult = MockAuthResult();
        final mockFirebaseUser = MockFirebaseUser();
        when(mockFirebaseUser.email).thenReturn('email@gmail.com');
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email@gmail.com', password: '123456'))
            .thenAnswer((_) => Future.value(mockAuthResult));
        when(mockFirebaseAuth.currentUser()).thenAnswer(
          (_) => Future.value(mockFirebaseUser),
        );
        when(mockFirebaseUser.updatePassword('12345678'))
            .thenAnswer((_) async => {});
        await firebaseChangePasswordRepository.changeUserPassword(
          currentPassword: '123456',
          newPassword: '12345678',
        );
        verify(mockFirebaseUser.updatePassword('12345678')).called(1);
      });

      test('should throw WrongPasswordException when password is wrong',
          () async {
        final mockFirebaseUser = MockFirebaseUser();
        when(mockFirebaseAuth.currentUser()).thenAnswer(
          (_) => Future.value(mockFirebaseUser),
        );
        when(mockFirebaseUser.email).thenReturn('email@gmail.com');
        when(
          mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'email@gmail.com',
            password: '123456',
          ),
        ).thenThrow(
          PlatformException(
            code: '1',
            message: 'ERROR_WRONG_PASSWORD',
          ),
        );
        firebaseChangePasswordRepository
            .changeUserPassword(
              currentPassword: '123456',
              newPassword: '12345678',
            )
            .catchError((e) => expect(e, isA<WrongPasswordException>()));
      });

      test('should throw exception when update password fails', () async {
        final mockAuthResult = MockAuthResult();
        final mockFirebaseUser = MockFirebaseUser();
        when(mockFirebaseUser.email).thenReturn('email@gmail.com');
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email@gmail.com', password: '123456'))
            .thenAnswer((_) => Future.value(mockAuthResult));
        when(mockFirebaseAuth.currentUser()).thenAnswer(
          (_) => Future.value(mockFirebaseUser),
        );
        when(mockFirebaseUser.updatePassword('12345678'))
            .thenThrow(Exception());
        firebaseChangePasswordRepository
            .changeUserPassword(
              currentPassword: '123456',
              newPassword: '12345678',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
