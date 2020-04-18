import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  FirebaseEditProfileRepository firebaseEditProfileRepository;
  MockFirestore mockFirestore;
  MockFirebaseAuth mockFirebaseAuth;
  MockFirebaseStorage mockFirebaseStorage;
  MockCollectionReference mockUsersCollectionReference;
  MockDocumentReference mockUserDocumentReference;
  MockStorageReference mockStorageReference;
  MockStorageReference mockUsersStorageReference;
  MockStorageReference imageRef;
  MockStorageTaskSnapshot mockStorageTaskSnapshot;
  MockStorageUploadTask mockStorageUploadTask;

  group('FirebasePostRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseStorage = MockFirebaseStorage();
      mockStorageReference = MockStorageReference();
      mockUsersStorageReference = MockStorageReference();
      mockStorageUploadTask = MockStorageUploadTask();
      mockStorageTaskSnapshot = MockStorageTaskSnapshot();
      imageRef = MockStorageReference();
      firebaseEditProfileRepository = FirebaseEditProfileRepository(
        firestore: mockFirestore,
        firebaseAuth: mockFirebaseAuth,
        firebaseStorage: mockFirebaseStorage,
      );
      mockUsersCollectionReference = MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
    });

    test('test asserts', () {
      expect(
          () => FirebaseEditProfileRepository(
                firestore: null,
                firebaseAuth: mockFirebaseAuth,
                firebaseStorage: mockFirebaseStorage,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseEditProfileRepository(
                firestore: mockFirestore,
                firebaseAuth: null,
                firebaseStorage: mockFirebaseStorage,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseEditProfileRepository(
                firestore: mockFirestore,
                firebaseAuth: mockFirebaseAuth,
                firebaseStorage: null,
              ),
          throwsAssertionError);
    });

    group('updateUserInfo', () {
      test('should upload image if user has to storage', () async {
        when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
        when(mockStorageReference.child(USERS_COLLECTION))
            .thenReturn(mockUsersStorageReference);
        when(mockUsersStorageReference.child('1')).thenReturn(imageRef);
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);

        when(imageRef.putFile(any)).thenReturn(mockStorageUploadTask);
        when(mockStorageUploadTask.onComplete)
            .thenAnswer((_) => Future.value(mockStorageTaskSnapshot));
        when(imageRef.getDownloadURL())
            .thenAnswer((_) => Future.value('my-photo-url'));

        await firebaseEditProfileRepository.updateUserInfo(
          currentUser: UserModel(userId: '1'),
          name: 'name',
          email: 'email',
          pickedPhoto: File(
            'assets/images/google.png',
          ),
        );
      });

      test('should throw exception when upload image fail', () async {
        when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
        when(mockStorageReference.child(USERS_COLLECTION))
            .thenReturn(mockUsersStorageReference);
        when(mockUsersStorageReference.child('1')).thenReturn(imageRef);

        when(imageRef.putFile(any)).thenThrow(Exception());

        firebaseEditProfileRepository
            .updateUserInfo(
              currentUser: UserModel(userId: '1'),
              name: 'name',
              email: 'email',
              pickedPhoto: File(
                'assets/images/google.png',
              ),
            )
            .catchError((e) => expect(e, isA<UploadFileException>()));
      });

      test('should not upload image when file is null', () async {
        when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
        when(mockStorageReference.child(USERS_COLLECTION))
            .thenReturn(mockUsersStorageReference);
        when(mockUsersStorageReference.child('1')).thenReturn(imageRef);
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);

        when(imageRef.putFile(any)).thenReturn(mockStorageUploadTask);
        when(mockStorageUploadTask.onComplete)
            .thenAnswer((_) => Future.value(mockStorageTaskSnapshot));
        when(imageRef.getDownloadURL())
            .thenAnswer((_) => Future.value('my-photo-url'));

        await firebaseEditProfileRepository.updateUserInfo(
          currentUser: UserModel(userId: '1'),
          name: 'name',
          email: 'email',
          pickedPhoto: null,
        );
      });

      test('should throw exception when updating user', () async {
        when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
        when(mockStorageReference.child(USERS_COLLECTION))
            .thenReturn(mockUsersStorageReference);
        when(mockUsersStorageReference.child('1')).thenReturn(imageRef);
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1')).thenThrow(Exception());

        when(imageRef.putFile(any)).thenReturn(mockStorageUploadTask);
        when(mockStorageUploadTask.onComplete)
            .thenAnswer((_) => Future.value(mockStorageTaskSnapshot));
        when(imageRef.getDownloadURL())
            .thenAnswer((_) => Future.value('my-photo-url'));

        firebaseEditProfileRepository
            .updateUserInfo(
              currentUser: UserModel(userId: '1'),
              name: 'name',
              email: 'email',
              pickedPhoto: null,
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
