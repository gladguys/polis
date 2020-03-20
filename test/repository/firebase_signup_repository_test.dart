import 'dart:io';

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
    MockFirebaseStorage mockFirebaseStorage;
    MockAuthResult mockAuthResult;
    MockFirebaseUser mockFirebaseUser;
    MockDocumentReference mockDocumentReference;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockCollectionReference mockCollectionReference;
    MockStorageReference mockStorageReference;
    MockStorageUploadTask mockStorageUploadTask;
    MockStorageTaskSnapshot mockStorageTaskSnapshot;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockStorageReference = MockStorageReference();
      mockStorageUploadTask = MockStorageUploadTask();
      mockStorageTaskSnapshot = MockStorageTaskSnapshot();
      mockFirestore = MockFirestore();
      mockFirebaseStorage = MockFirebaseStorage();
      firebaseSignupRepository = FirebaseSignupRepository(
        firebaseAuth: mockFirebaseAuth,
        firestore: mockFirestore,
        storage: mockFirebaseStorage,
      );
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
                storage: mockFirebaseStorage,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSignupRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
                storage: mockFirebaseStorage,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSignupRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: mockFirestore,
                storage: null,
              ),
          throwsAssertionError);
    });

    test(
        '''createUserWithEmailAndPassword creates firestore user if not created yet''',
        () async {
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

      await firebaseSignupRepository.createUserWithEmailAndPassword(user, null);
      verify(mockDocumentReference.setData(any)).called(1);
    });

    test(
        '''createUserWithEmailAndPassword uploads profilePhoto to FirebaseStorage''',
        () async {
      final userStorageRef = MockStorageReference();
      final imageRef = MockStorageReference();
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
      when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
      when(mockStorageReference.child(USERS)).thenReturn(userStorageRef);
      when(userStorageRef.child(any)).thenReturn(imageRef);
      when(imageRef.putFile(any)).thenReturn(mockStorageUploadTask);
      when(mockStorageUploadTask.onComplete)
          .thenAnswer((_) => Future.value(mockStorageTaskSnapshot));
      when(imageRef.getDownloadURL())
          .thenAnswer((_) => Future.value('my-photo-url'));
      await firebaseSignupRepository.createUserWithEmailAndPassword(
          user, File('file'));
      verify(mockDocumentReference.setData(UserModel(
        userId: '1',
        name: null,
        photoUrl: 'my-photo-url',
        email: 'email',
        password: null,
      ).toJson()))
          .called(1);
    });

    test('''should throw UploadFileException exception when upload fails''',
        () async {
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
      when(mockFirebaseStorage.ref()).thenThrow(Exception());
      await firebaseSignupRepository
          .createUserWithEmailAndPassword(user, File('file'))
          .catchError((e) => expect(e, isA<UploadFileException>()));
    });

    test('should throw EmailAlreadyInUseException exception', () async {
      final user = UserModel(userId: '1', email: 'email', password: 'password');
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenThrow(PlatformException(
              code: '1', message: 'ERROR_EMAIL_ALREADY_IN_USE'));
      firebaseSignupRepository
          .createUserWithEmailAndPassword(user, null)
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
          .createUserWithEmailAndPassword(user, null)
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
