import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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
  MockQuerySnapshot mockQuerySnapshot;
  MockStorageReference mockStorageReference;
  MockStorageReference mockUsersStorageReference;
  MockStorageReference imageRef;
  MockStorageTaskSnapshot mockStorageTaskSnapshot;
  MockStorageUploadTask mockStorageUploadTask;
  MockDocumentSnapshot mockDespesaDocumentSnapshot;
  MockDocumentSnapshot mockPropostaDocumentSnapshot;
  MockQuery mockQuery;

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
      mockQuerySnapshot = MockQuerySnapshot();
      mockDespesaDocumentSnapshot = MockDocumentSnapshot();
      mockPropostaDocumentSnapshot = MockDocumentSnapshot();
      mockQuery = MockQuery();
    });

    test('test asserts', () {
      expect(() => FirebaseFavoritePostsRepository(firestore: null),
          throwsAssertionError);
    });

    group('updateUserInfo', () {
      test('should upload image if user has to storage', () async {
        when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
        when(mockStorageReference.child(USERS_COLLECTION))
            .thenReturn(mockUsersStorageReference);
        when(mockUsersStorageReference.child('1')).thenReturn(imageRef);

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
    });
  });
}
