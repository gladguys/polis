import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/constants.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebaseTimelineRepository tests', () {
    MockFirestore mockFirestore;
    FirebaseTimelineRepository firebaseTimelineRepository;
    MockCollectionReference mockTimelineCollectionReference;
    MockCollectionReference mockAtividadesTimelineCollectionReference;
    MockDocumentReference userTimelineDocumentReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentSnapshot mockDocument2Snapshot;
    MockDocumentChange mockDocumentChange;
    MockDocumentChange mockDocumentChange2;
    MockQuery mockQuery;
    MockQuery mockQueryPaginated;
    MockQuery mockQueryLimit;

    setUp(() {
      mockFirestore = MockFirestore();
      firebaseTimelineRepository = FirebaseTimelineRepository(
        firestore: mockFirestore,
      );
      mockTimelineCollectionReference = MockCollectionReference();
      mockAtividadesTimelineCollectionReference = MockCollectionReference();
      userTimelineDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockDocument2Snapshot = MockDocumentSnapshot();
      mockDocumentChange = MockDocumentChange();
      mockDocumentChange2 = MockDocumentChange();
      mockQuery = MockQuery();
      mockQueryPaginated = MockQuery();
      mockQueryLimit = MockQuery();
    });

    test('asserts', () {
      expect(
          () => FirebaseTimelineRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getUserTimeline', () {
      test('returns stream of despesas and propostas', () async {
        when(mockFirestore.collection(TIMELINE_COLLECTION))
            .thenReturn(mockTimelineCollectionReference);
        when(mockTimelineCollectionReference.document('1'))
            .thenReturn(userTimelineDocumentReference);
        when(userTimelineDocumentReference
                .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION))
            .thenReturn(mockAtividadesTimelineCollectionReference);
        when(mockAtividadesTimelineCollectionReference
                .orderBy(DATA_ATUALIZACAO_FIELD, descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.snapshots())
            .thenAnswer((_) => Stream.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documentChanges)
            .thenReturn([mockDocumentChange, mockDocumentChange2]);
        when(mockDocumentChange.type).thenReturn(DocumentChangeType.added);
        when(mockDocumentChange2.type).thenReturn(DocumentChangeType.modified);
        firebaseTimelineRepository.getNewActivitiesCounter('1').listen((data) {
          expect(data, 1);
        });
      });

      test('throws ComunicationException', () {
        when(when(mockFirestore.collection(TIMELINE_COLLECTION)))
            .thenThrow(Exception());
        try {
          firebaseTimelineRepository.getNewActivitiesCounter('1');
        } on Exception catch (e) {
          expect(e, isA<ComunicationException>());
        }
      });
    });

    group('getTimelineFirstPosts', () {
      test('returns posts when user first enter timeline', () async {
        when(mockFirestore.collection(TIMELINE_COLLECTION))
            .thenReturn(mockTimelineCollectionReference);
        when(mockTimelineCollectionReference.document('1'))
            .thenReturn(userTimelineDocumentReference);
        when(userTimelineDocumentReference
                .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION))
            .thenReturn(mockAtividadesTimelineCollectionReference);
        when(mockAtividadesTimelineCollectionReference
                .orderBy(DATA_ATUALIZACAO_FIELD, descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.limit(kTimelinePageSize)).thenReturn(mockQueryLimit);
        when(mockQueryLimit.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockDocumentSnapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'DESPESA'});
        when(mockDocument2Snapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'PROPOSTA'});
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
          mockDocument2Snapshot,
        ]);

        final timelineData = await firebaseTimelineRepository
            .getTimelineFirstPosts('1', kTimelinePageSize);
        expect(timelineData.item1, [DespesaModel(), PropostaModel()]);
        expect(timelineData.item2, mockDocument2Snapshot);
      });

      test('throws ComunicationException', () {
        when(when(mockFirestore.collection(TIMELINE_COLLECTION)))
            .thenThrow(Exception());
        firebaseTimelineRepository
            .getTimelineFirstPosts('1', kTimelinePageSize)
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getMorePosts', () {
      test('returns more posts for pagination', () async {
        when(mockFirestore.collection(TIMELINE_COLLECTION))
            .thenReturn(mockTimelineCollectionReference);
        when(mockTimelineCollectionReference.document('1'))
            .thenReturn(userTimelineDocumentReference);
        when(userTimelineDocumentReference
                .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION))
            .thenReturn(mockAtividadesTimelineCollectionReference);
        when(mockAtividadesTimelineCollectionReference
                .orderBy(DATA_ATUALIZACAO_FIELD, descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQueryPaginated);
        when(mockQueryPaginated.limit(kTimelinePageSize))
            .thenReturn(mockQueryLimit);
        when(mockQueryLimit.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockDocumentSnapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'DESPESA'});
        when(mockDocument2Snapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'PROPOSTA'});
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
          mockDocument2Snapshot,
        ]);

        final timelineData = await firebaseTimelineRepository.getMorePosts(
            '1', kTimelinePageSize, MockDocumentSnapshot());
        expect(timelineData.item1, [DespesaModel(), PropostaModel()]);
        expect(timelineData.item2, mockDocument2Snapshot);
      });

      test('throws ComunicationException', () {
        when(when(mockFirestore.collection(TIMELINE_COLLECTION)))
            .thenThrow(Exception());
        firebaseTimelineRepository
            .getMorePosts('1', kTimelinePageSize, MockDocumentSnapshot())
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
