import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebaseTimelineRepository tests', () {
    MockFirestore mockFirestore;
    FirebaseTimelineRepository firebaseTimelineRepository;
    MockCollectionReference mockTimelineCollectionReference;
    MockCollectionReference mockAtividadesTimelineCollectionReference;
    MockDocumentReference userTimelineDocumentReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    Stream<QuerySnapshot> snapshotStream;
    MockQuery mockQuery;

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
      snapshotStream = Stream.value(mockQuerySnapshot);
      mockQuery = MockQuery();
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
                .orderBy(DATA_DOCUMENTO_FIELD, descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.snapshots()).thenAnswer((_) => snapshotStream);
        when(mockDocumentSnapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'DESPESA'});
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);

        firebaseTimelineRepository.getUserTimeline('1').listen((data) {
          expect(data, [DespesaModel()]);
        });
      });

      test('throws ComunicationException', () {
        when(when(mockFirestore.collection(TIMELINE_COLLECTION)))
            .thenThrow(Exception());
        try {
          firebaseTimelineRepository.getUserTimeline('1');
        } on Exception catch (e) {
          expect(e, isA<ComunicationException>());
        }
      });
    });
  });
}
