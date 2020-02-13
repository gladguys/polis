import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/firebase_signin_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseSigninRepository tests', () {
    FirebaseSigninRepository firebaseSigninRepository;
    MockFirebaseAuth mockFirebaseAuth;
    MockFirestore mockFirestore;
    MockAuthResult mockAuthResult;
    MockFirebaseUser mockFirebaseUser;
    MockDocumentReference mockDocumentReference;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockCollectionReference mockCollectionReference;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirestore();
      firebaseSigninRepository = FirebaseSigninRepository(
          firebaseAuth: mockFirebaseAuth, firestore: mockFirestore);
      mockAuthResult = MockAuthResult();
      mockFirebaseUser = MockFirebaseUser();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockCollectionReference = MockCollectionReference();
    });

    test('test asserts', () {
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: null,
                firestore: mockFirestore,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
              ),
          throwsAssertionError);
    });

    test('signInWithEmailAndPassword return UserModel when user exists',
        () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) => Future.value(mockAuthResult));
      when(mockAuthResult.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.uid).thenReturn('1');
      when(mockFirestore.collection(USERS)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.document('1'))
          .thenReturn(mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));
      when(mockDocumentSnapshot.exists).thenReturn(true);
      final userJson = {
        'userId': '1',
        'name': 'name',
        'email': 'email',
        'photoUrl': 'photourl',
      };
      when(mockDocumentSnapshot.data).thenReturn(userJson);

      final user = await firebaseSigninRepository.signInWithEmailAndPassword(
          'email', 'password');
      expect(user.userId == userJson['userId'], true);
    });

    test('signInWithEmailAndPassword return null when user doesn\'t exists',
        () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) => Future.value(mockAuthResult));
      when(mockAuthResult.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.uid).thenReturn('1');
      when(mockFirestore.collection(USERS)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.document('1'))
          .thenReturn(mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));
      when(mockDocumentSnapshot.exists).thenReturn(false);

      final user = await firebaseSigninRepository.signInWithEmailAndPassword(
          'email', 'password');
      expect(user, equals(null));
    });

    test('throws InvalidCredentialsException when auth fails', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenThrow(PlatformException(code: 'INVALID_CREDENTIALS'));

      firebaseSigninRepository
          .signInWithEmailAndPassword('email', 'password')
          .then((_) {})
          .catchError((e) {
        expect(e, isInstanceOf<InvalidCredentialsException>());
      });
    });

    test('throw ComunicationException when firestore mess up', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) => Future.value(mockAuthResult));
      when(mockAuthResult.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.uid).thenReturn('1');
      when(mockFirestore.collection(USERS)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.document('1')).thenThrow(Exception());

      firebaseSigninRepository
          .signInWithEmailAndPassword('email', 'password')
          .then((_) {})
          .catchError((e) {
        expect(e, isInstanceOf<ComunicationException>());
      });
    });
  });
}
