import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticoRepository tests', () {
    FirebaseSyncLogRepository firebaseSyncLogRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockSyncLogCollectionReference;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockDocumentReference;

    setUp(() {
      mockFirestore = MockFirestore();
      firebaseSyncLogRepository = FirebaseSyncLogRepository(
        firestore: mockFirestore,
      );
      mockSyncLogCollectionReference = MockCollectionReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockDocumentReference = MockDocumentReference();
    });

    test('test asserts', () {
      expect(
          () => FirebaseSyncLogRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getPartidoHash', () {
      test('get the hash', () async {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenReturn(mockSyncLogCollectionReference);
        when(mockSyncLogCollectionReference.document(PARTIDO_SYNC))
            .thenAnswer((_) => mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.data).thenReturn({'hash': 'hashPartido'});

        final hashPartido = await firebaseSyncLogRepository.getPartidoHash();
        expect(hashPartido, 'hashPartido');
      });

      test('throws exception', () {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenThrow(Exception());
        firebaseSyncLogRepository
            .getPartidoHash()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getPoliticoHash', () {
      test('get the hash', () async {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenReturn(mockSyncLogCollectionReference);
        when(mockSyncLogCollectionReference.document(POLITICO_SYNC))
            .thenAnswer((_) => mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.data).thenReturn({'hash': 'hashPolitico'});

        final hashPolitico = await firebaseSyncLogRepository.getPoliticoHash();
        expect(hashPolitico, 'hashPolitico');
      });

      test('throws exception', () {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenThrow(Exception());
        firebaseSyncLogRepository
            .getPoliticoHash()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
