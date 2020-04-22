import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebaseSigninRepository tests', () {
    FirebaseSigninRepository firebaseSigninRepository;
    MockFirebaseAuth mockFirebaseAuth;
    MockFirestore mockFirestore;
    MockGoogleSignin mockGoogleSignin;
    MockQuery mockQuery;
    MockQuerySnapshot mockQuerySnapshot;
    MockGoogleSignInAccount mockGoogleSignInAccount;
    MockAuthResult mockAuthResult;
    MockFirebaseUser mockFirebaseUser;
    MockDocumentReference mockDocumentReference;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockCollectionReference mockCollectionReference;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirestore = MockFirestore();
      mockGoogleSignin = MockGoogleSignin();
      mockGoogleSignInAccount = MockGoogleSignInAccount();
      mockQuery = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      firebaseSigninRepository = FirebaseSigninRepository(
        firebaseAuth: mockFirebaseAuth,
        firestore: mockFirestore,
        googleSignin: mockGoogleSignin,
      );
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
                googleSignin: mockGoogleSignin,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
                googleSignin: mockGoogleSignin,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: mockFirestore,
                googleSignin: null,
              ),
          throwsAssertionError);
    });

    group('signInWithEmailAndPassword tests', () {
      test('return UserModel when user exists', () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenAnswer((_) => Future.value(mockAuthResult));
        when(mockAuthResult.user).thenReturn(mockFirebaseUser);
        when(mockFirebaseUser.isEmailVerified).thenReturn(true);
        when(mockFirebaseUser.uid).thenReturn('1');
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockCollectionReference);
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
          'isFirstLoginDone': true,
        };
        when(mockDocumentSnapshot.data).thenReturn(userJson);

        final user = await firebaseSigninRepository.signInWithEmailAndPassword(
            'email', 'password');
        expect(user.userId == userJson['userId'], true);
      });

      test('throw EmailNotVerifiedException when user is not verified',
          () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenAnswer((_) => Future.value(mockAuthResult));
        when(mockAuthResult.user).thenReturn(mockFirebaseUser);
        when(mockFirebaseUser.isEmailVerified).thenReturn(false);

        firebaseSigninRepository
            .signInWithEmailAndPassword('email', 'password')
            .catchError((e) => expect(e, isA<EmailNotVerifiedException>()));
      });

      test('return null when user doesn\'t exists', () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenAnswer((_) => Future.value(mockAuthResult));
        when(mockAuthResult.user).thenReturn(mockFirebaseUser);
        when(mockFirebaseUser.isEmailVerified).thenReturn(true);
        when(mockFirebaseUser.uid).thenReturn('1');
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.exists).thenReturn(false);

        final user = await firebaseSigninRepository.signInWithEmailAndPassword(
            'email', 'password');
        expect(user, equals(null));
      });

      test('throw InvalidCredentialsException when auth fails', () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenThrow(PlatformException(code: 'ERROR_INVALID_EMAIL'));

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
        when(mockFirebaseUser.isEmailVerified).thenReturn(true);
        when(mockFirebaseUser.uid).thenReturn('1');
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document('1')).thenThrow(Exception());

        firebaseSigninRepository
            .signInWithEmailAndPassword('email', 'password')
            .catchError((e) {
          expect(e, isInstanceOf<ComunicationException>());
        });
      });

      group('signInWithGoogle tests', () {
        test('return UserModel when user exists', () async {
          when(mockGoogleSignin.signIn())
              .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
          when(mockGoogleSignInAccount.email).thenReturn('test@gmail.com');
          when(mockFirestore.collection(USERS_COLLECTION))
              .thenReturn(mockCollectionReference);
          when(mockCollectionReference.where('email',
                  isEqualTo: 'test@gmail.com'))
              .thenReturn(mockQuery);
          when(mockQuery.getDocuments())
              .thenAnswer((_) => Future.value(mockQuerySnapshot));
          when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
          when(mockDocumentSnapshot.data)
              .thenReturn({'email': 'test@gmail.com'});

          final user = await firebaseSigninRepository.signInWithGoogle();
          expect(user.email, equals('test@gmail.com'));
        });

        test('should create a user on firestore when and user dont exists',
            () async {
          when(mockGoogleSignin.signIn())
              .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
          when(mockGoogleSignInAccount.email).thenReturn('test@gmail.com');
          when(mockFirestore.collection(USERS_COLLECTION))
              .thenReturn(mockCollectionReference);
          when(mockCollectionReference.where('email',
                  isEqualTo: 'test@gmail.com'))
              .thenReturn(mockQuery);
          when(mockQuery.getDocuments())
              .thenAnswer((_) => Future.value(mockQuerySnapshot));
          when(mockQuerySnapshot.documents).thenReturn([]);
          when(mockCollectionReference.document(any))
              .thenReturn(mockDocumentReference);
          when(mockDocumentReference.setData(any))
              .thenAnswer((_) => Future.value());
          final user = await firebaseSigninRepository.signInWithGoogle();
          expect(user != null, true);
          verify(mockDocumentReference.setData(any)).called(1);
        });

        test('throw ComunicationException when getting user by email',
            () async {
          when(mockGoogleSignin.signIn())
              .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
          when(mockGoogleSignInAccount.email).thenReturn('test@gmail.com');
          when(mockFirestore.collection(USERS_COLLECTION))
              .thenReturn(mockCollectionReference);
          when(mockCollectionReference.where('email',
                  isEqualTo: 'test@gmail.com'))
              .thenThrow(Exception());
          firebaseSigninRepository.signInWithGoogle().catchError(
              (e) => expect(e, isInstanceOf<ComunicationException>()));
        });

        test('throw ComunicationException when creating user on firestore fail',
            () async {
          when(mockGoogleSignin.signIn())
              .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
          when(mockGoogleSignInAccount.email).thenReturn('test@gmail.com');
          when(mockFirestore.collection(USERS_COLLECTION))
              .thenReturn(mockCollectionReference);
          when(mockCollectionReference.where('email',
                  isEqualTo: 'test@gmail.com'))
              .thenReturn(mockQuery);
          when(mockQuery.getDocuments())
              .thenAnswer((_) => Future.value(mockQuerySnapshot));
          when(mockQuerySnapshot.documents).thenReturn([]);
          when(mockCollectionReference.document(any))
              .thenReturn(mockDocumentReference);
          when(mockDocumentReference.setData(any)).thenThrow(Exception());
          firebaseSigninRepository.signInWithGoogle().catchError(
              (e) => expect(e, isInstanceOf<ComunicationException>()));
        });

        test('throw GoogleSigninException when trying to login fail', () async {
          when(mockGoogleSignin.signIn()).thenAnswer((_) => Future.value(null));
          firebaseSigninRepository.signInWithGoogle().catchError(
              (e) => expect(e, isInstanceOf<GoogleSigninException>()));
        });
      });
    });
  });
}
