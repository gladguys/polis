import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/firebase_user_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseUserRepository tests', () {
    MockFirebaseAuth mockFirebaseAuth;
    MockFirestore mockFirestore;
    FirebaseUserRepository firebaseUserRepository;
    MockCollectionReference mockUserCollectionRef;
    MockDocumentReference mockUserDocumentRef;

    setUp(() {
      mockUserCollectionRef = MockCollectionReference();
      mockUserDocumentRef = MockDocumentReference();
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirestore();
      firebaseUserRepository = FirebaseUserRepository(
        firebaseAuth: mockFirebaseAuth,
        firestore: mockFirestore,
      );
    });

    test('test asserts', () {
      expect(
          () => FirebaseUserRepository(
                firebaseAuth: null,
                firestore: mockFirestore,
              ),
          throwsAssertionError);

      expect(
          () => FirebaseUserRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
              ),
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

    group('setFirstLoginDone', () {
      test('saves the user with isFirstLoginDone set to true', () async {
        final user = UserModel(
          userId: '1',
          isFirstLoginDone: false,
        );
        when(mockFirestore.collection(USERS)).thenReturn(mockUserCollectionRef);
        when(mockUserCollectionRef.document('1'))
            .thenReturn(mockUserDocumentRef);
        final userWithFirstLogin = user.copyWith(isFirstLoginDone: true);
        await firebaseUserRepository.setFirstLoginDone(user);
        verify(mockUserDocumentRef.setData(userWithFirstLogin.toJson()));
      });

      test('throws exception', () async {
        final user = UserModel(
          userId: '1',
          isFirstLoginDone: false,
        );
        when(mockFirestore.collection(USERS)).thenReturn(mockUserCollectionRef);
        when(mockUserCollectionRef.document('1')).thenThrow(Exception());
        firebaseUserRepository
            .setFirstLoginDone(user)
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
