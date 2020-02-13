import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/firebase_signup_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseSignupRepository tests', () {
    FirebaseSignupRepository firebaseSignupRepository;
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
      firebaseSignupRepository = FirebaseSignupRepository(
          firebaseAuth: mockFirebaseAuth, firestore: mockFirestore);
      mockAuthResult = MockAuthResult();
      mockFirebaseUser = MockFirebaseUser();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockCollectionReference = MockCollectionReference();
    });

    test('test asserts', () {
      expect(
          () => FirebaseSignupRepository(
                firebaseAuth: null,
                firestore: mockFirestore,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSignupRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
              ),
          throwsAssertionError);
    });

    test(
        'createUserWithEmailAndPassword creates firestore user if not created'
        'yet', () async {
      final user = UserModel(userId: '1', email: 'email', password: 'password');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
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

      await firebaseSignupRepository.createUserWithEmailAndPassword(user);
      verify(mockDocumentReference.setData(any)).called(1);
    });

    test('should throw EmailAlreadyInUseException exception', () async {
      final user = UserModel(userId: '1', email: 'email', password: 'password');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenThrow(PlatformException(
              code: '1', message: 'ERROR_EMAIL_ALREADY_IN_USE'));
      firebaseSignupRepository
          .createUserWithEmailAndPassword(user)
          .then((_) {})
          .catchError(
              (e) => expect(e, isInstanceOf<EmailAlreadyInUseException>()));
    });

    test('should throw WeakPasswordException exception', () async {
      final user = UserModel(userId: '1', email: 'email', password: 'password');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenThrow(
              PlatformException(code: '1', message: 'ERROR_WEAK_PASSWORD'));
      firebaseSignupRepository
          .createUserWithEmailAndPassword(user)
          .then((_) {})
          .catchError((e) => expect(e, isInstanceOf<WeakPasswordException>()));
    });

    test('should throw ComunicationException when userExists fails', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) => Future.value(mockAuthResult));
      when(mockAuthResult.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.uid).thenReturn('1');
      when(mockFirestore.collection(USERS)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.document('1')).thenThrow(Exception());
      when(mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));
      when(mockDocumentSnapshot.exists).thenReturn(false);

      firebaseSignupRepository
          .userExists('1')
          .then((_) {})
          .catchError((e) => expect(e, isInstanceOf<ComunicationException>()));
    });

    test('should throw ComunicationException when createFirestoreUser fails',
        () async {
      final user = UserModel(userId: '1', email: 'email', password: 'password');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) => Future.value(mockAuthResult));
      when(mockAuthResult.user).thenReturn(mockFirebaseUser);
      when(mockFirebaseUser.uid).thenReturn('1');
      when(mockFirestore.collection(USERS)).thenReturn(mockCollectionReference);
      when(mockCollectionReference.document('1')).thenThrow(Exception());
      when(mockDocumentReference.get())
          .thenAnswer((_) => Future.value(mockDocumentSnapshot));
      when(mockDocumentSnapshot.exists).thenReturn(false);

      firebaseSignupRepository
          .createFirestoreUser('1', user)
          .then((_) {})
          .catchError((e) => expect(e, isInstanceOf<ComunicationException>()));
    });
  });
}
