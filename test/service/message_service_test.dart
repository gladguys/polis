import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/comunication_exception.dart';
import 'package:polis/core/service/services.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';

import '../mock.dart';

void main() {
  group('MessageService tests', () {
    MessageService messageService;
    MockFirebaseMessaging mockFirebaseMessaging;
    MockSharedPreferencesService mockSharedPreferencesService;
    MockFirestore mockFirestore;

    setUp(() {
      mockFirebaseMessaging = MockFirebaseMessaging();
      mockSharedPreferencesService = MockSharedPreferencesService();
      mockFirestore = MockFirestore();
      messageService = MessageService(
        firebaseMessaging: mockFirebaseMessaging,
        sharedPreferencesService: mockSharedPreferencesService,
        firestore: mockFirestore,
      );
    });

    test('asserts', () {
      expect(
          () => MessageService(
                firebaseMessaging: null,
                sharedPreferencesService: mockSharedPreferencesService,
                firestore: mockFirestore,
              ),
          throwsAssertionError);

      expect(
          () => MessageService(
                firebaseMessaging: mockFirebaseMessaging,
                sharedPreferencesService: null,
                firestore: mockFirestore,
              ),
          throwsAssertionError);

      expect(
          () => MessageService(
                firebaseMessaging: mockFirebaseMessaging,
                sharedPreferencesService: mockSharedPreferencesService,
                firestore: null,
              ),
          throwsAssertionError);
    });

    test('should initMessaging', () async {
      final userCollectionRef = MockCollectionReference();
      final userDocumentRef = MockDocumentReference();
      when(mockFirestore.collection(USERS_COLLECTION))
          .thenReturn(userCollectionRef);
      when(userCollectionRef.document('1')).thenReturn(userDocumentRef);
      when(userDocumentRef.updateData(any)).thenAnswer((_) => Future.value());
      when(mockSharedPreferencesService.getUser()).thenReturn(
        UserModel(
          userId: '1',
        ),
      );
      when(mockFirebaseMessaging.onTokenRefresh).thenAnswer(
        (_) => Stream.fromIterable(
          [
            'token1',
            'token2',
            'token3',
          ],
        ),
      );
      await messageService.initMessaging();
    });

    test('getUserToken should call getToken from FCM', () async {
      await messageService.getUserToken();
      verify(mockFirebaseMessaging.getToken()).called(1);
    });

    group('saveUserToken', () {
      test('should save user token passed on firestore', () async {
        final userCollectionRef = MockCollectionReference();
        final userDocumentRef = MockDocumentReference();
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(userCollectionRef);
        when(userCollectionRef.document('1')).thenReturn(userDocumentRef);
        when(userDocumentRef.updateData(any)).thenAnswer((_) => Future.value());
        await messageService.saveUserToken(userId: '1', token: 'token');
        verifyNever(messageService.getUserToken());
        verify(
          userDocumentRef.updateData({
            FCM_TOKEN: 'token',
          }),
        ).called(1);
      });

      test('should save user token on firestore from token stored', () async {
        final userCollectionRef = MockCollectionReference();
        final userDocumentRef = MockDocumentReference();
        when(mockFirebaseMessaging.getToken())
            .thenAnswer((_) => Future.value('token-fcm'));
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(userCollectionRef);
        when(userCollectionRef.document('1')).thenReturn(userDocumentRef);
        when(userDocumentRef.updateData(any)).thenAnswer((_) => Future.value());
        await messageService.saveUserToken(userId: '1');
        verify(messageService.getUserToken()).called(1);
        verify(
          userDocumentRef.updateData({
            FCM_TOKEN: 'token-fcm',
          }),
        ).called(1);
      });

      test('throws ComunicationException exception', () async {
        final userCollectionRef = MockCollectionReference();
        final userDocumentRef = MockDocumentReference();
        when(mockFirebaseMessaging.getToken()).thenThrow(Exception());
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(userCollectionRef);
        when(userCollectionRef.document('1')).thenReturn(userDocumentRef);
        when(userDocumentRef.updateData(any)).thenAnswer((_) => Future.value());
        messageService
            .saveUserToken(userId: '1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
