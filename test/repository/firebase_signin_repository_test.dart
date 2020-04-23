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
    MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
    MockPolisGoogleAuthProvider mockPolisGoogleAuthProvider;
    MockAuthCredential mockAuthCredential;
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
      mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
      mockPolisGoogleAuthProvider = MockPolisGoogleAuthProvider();
      mockAuthCredential = MockAuthCredential();
      mockQuery = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      firebaseSigninRepository = FirebaseSigninRepository(
        firebaseAuth: mockFirebaseAuth,
        firestore: mockFirestore,
        googleSignin: mockGoogleSignin,
        polisGoogleAuthProvider: mockPolisGoogleAuthProvider,
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
                polisGoogleAuthProvider: mockPolisGoogleAuthProvider,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: null,
                googleSignin: mockGoogleSignin,
                polisGoogleAuthProvider: mockPolisGoogleAuthProvider,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: mockFirestore,
                googleSignin: null,
                polisGoogleAuthProvider: mockPolisGoogleAuthProvider,
              ),
          throwsAssertionError);
      expect(
          () => FirebaseSigninRepository(
                firebaseAuth: mockFirebaseAuth,
                firestore: mockFirestore,
                googleSignin: mockGoogleSignin,
                polisGoogleAuthProvider: null,
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

      test(
          '''throw InvalidCredentialsException when auth fails and contains ERROR_WRONG_PASSWORD''',
          () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenThrow(PlatformException(code: 'ERROR_WRONG_PASSWORD'));

        firebaseSigninRepository
            .signInWithEmailAndPassword('email', 'password')
            .then((_) {})
            .catchError((e) {
          expect(e, isInstanceOf<InvalidCredentialsException>());
        });
      });

      test(
          '''throw InvalidCredentialsException when auth fails for ERROR_USER_NOT_FOUND''',
          () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: 'email', password: 'password'))
            .thenThrow(PlatformException(code: 'ERROR_USER_NOT_FOUND'));

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

      group('sendResetEmail', () {
        test('works', () async {
          when(mockFirebaseAuth.sendPasswordResetEmail(email: 'email'))
              .thenAnswer((_) => Future.value());
          await firebaseSigninRepository.sendResetEmail('email');
        });

        test('throws exception', () {
          when(mockFirebaseAuth.sendPasswordResetEmail(email: 'email'))
              .thenThrow(Exception());
          firebaseSigninRepository
              .sendResetEmail('email')
              .catchError((e) => expect(e, isA<ComunicationException>()));
        });
      });

      group('signInWithGoogle tests', () {
        test('return UserModel when user exists', () async {
          when(mockGoogleSignin.signIn())
              .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
          when(mockGoogleSignInAccount.authentication)
              .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
          when(mockGoogleSignInAuthentication.accessToken)
              .thenReturn('acesss-token');
          when(mockGoogleSignInAuthentication.idToken).thenReturn('id-token');
          when(mockPolisGoogleAuthProvider.getCredential(
                  accessToken: 'acesss-token', idToken: 'id-token'))
              .thenReturn(mockAuthCredential);
          when(mockFirebaseAuth.signInWithCredential(mockAuthCredential))
              .thenAnswer((_) => Future.value());
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
          when(mockGoogleSignInAccount.authentication)
              .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
          when(mockGoogleSignInAuthentication.accessToken)
              .thenReturn('acesss-token');
          when(mockGoogleSignInAuthentication.idToken).thenReturn('id-token');
          when(mockPolisGoogleAuthProvider.getCredential(
                  accessToken: 'acesss-token', idToken: 'id-token'))
              .thenReturn(mockAuthCredential);
          when(mockFirebaseAuth.signInWithCredential(mockAuthCredential))
              .thenAnswer((_) => Future.value());
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
          when(mockGoogleSignInAccount.authentication)
              .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
          when(mockGoogleSignInAuthentication.accessToken)
              .thenReturn('acesss-token');
          when(mockGoogleSignInAuthentication.idToken).thenReturn('id-token');
          when(mockPolisGoogleAuthProvider.getCredential(
                  accessToken: 'acesss-token', idToken: 'id-token'))
              .thenReturn(mockAuthCredential);
          when(mockFirebaseAuth.signInWithCredential(mockAuthCredential))
              .thenAnswer((_) => Future.value());
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
          when(mockGoogleSignInAccount.authentication)
              .thenAnswer((_) => Future.value(mockGoogleSignInAuthentication));
          when(mockGoogleSignInAuthentication.accessToken)
              .thenReturn('acesss-token');
          when(mockGoogleSignInAuthentication.idToken).thenReturn('id-token');
          when(mockPolisGoogleAuthProvider.getCredential(
                  accessToken: 'acesss-token', idToken: 'id-token'))
              .thenReturn(mockAuthCredential);
          when(mockFirebaseAuth.signInWithCredential(mockAuthCredential))
              .thenAnswer((_) => Future.value());
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
              (e) => expect(e, isInstanceOf<ComunicationException>()));
        });
      });
    });
  });
}
