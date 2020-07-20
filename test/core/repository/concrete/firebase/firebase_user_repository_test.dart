import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('FirebaseUserRepository tests', () {
    MockFirebaseAuth mockFirebaseAuth;
    MockFirestore mockFirestore;
    MockGoogleSignin mockGoogleSignin;
    FirebaseUserRepository firebaseUserRepository;
    MockCollectionReference mockUserCollectionRef;
    MockDocumentReference mockUserDocumentRef;

    setUp(() {
      mockUserCollectionRef = MockCollectionReference();
      mockUserDocumentRef = MockDocumentReference();
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirestore();
      mockGoogleSignin = MockGoogleSignin();
      firebaseUserRepository = FirebaseUserRepository(
        firebaseAuth: mockFirebaseAuth,
        googleSignIn: mockGoogleSignin,
        firestore: mockFirestore,
      );
    });

    test('test asserts', () {
      expect(
          () => FirebaseUserRepository(
                firebaseAuth: null,
                googleSignIn: mockGoogleSignin,
                firestore: mockFirestore,
              ),
          throwsAssertionError);

      expect(
          () => FirebaseUserRepository(
                firebaseAuth: mockFirebaseAuth,
                googleSignIn: null,
                firestore: mockFirestore,
              ),
          throwsAssertionError);

      expect(
          () => FirebaseUserRepository(
                firebaseAuth: mockFirebaseAuth,
                googleSignIn: mockGoogleSignin,
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
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUserCollectionRef);
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
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUserCollectionRef);
        when(mockUserCollectionRef.document('1')).thenThrow(Exception());
        firebaseUserRepository
            .setFirstLoginDone(user)
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('saveUserComments', () {
      test('works', () async {
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUserCollectionRef);
        when(mockUserCollectionRef.document('1'))
            .thenReturn(mockUserDocumentRef);
        await firebaseUserRepository.saveUserComments(
          user: UserModel(
            userId: '1',
          ),
          comments: {
            '1': true,
          },
        );
      });

      test('throws exception', () async {
        when(mockFirestore.collection(USERS_COLLECTION)).thenThrow(Exception());
        firebaseUserRepository.saveUserComments(
          user: UserModel(
            userId: '1',
          ),
          comments: {
            '1': true,
          },
        ).catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('updateUserConfigs', () {
      test('works', () async {
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUserCollectionRef);
        when(mockUserCollectionRef.document('1'))
            .thenReturn(mockUserDocumentRef);
        await firebaseUserRepository.updateUserConfigs(
          UserModel(
            userId: '1',
            userConfigs: {
              '1': true,
            },
          ),
        );
      });

      test('throws exception', () async {
        when(mockFirestore.collection(USERS_COLLECTION)).thenThrow(Exception());
        firebaseUserRepository
            .updateUserConfigs(
              UserModel(
                userId: '1',
                userConfigs: {
                  '1': true,
                },
              ),
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
