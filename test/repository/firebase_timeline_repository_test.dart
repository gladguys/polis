import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/comunication_exception.dart';
import 'package:polis/model/despesa_model.dart';
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
        when(mockFirestore.collection(TIMELINE))
            .thenReturn(mockTimelineCollectionReference);
        when(mockTimelineCollectionReference.document('1'))
            .thenReturn(userTimelineDocumentReference);
        when(userTimelineDocumentReference
                .collection(ATIVIDADES_TIMELINE_COLLECTION))
            .thenReturn(mockAtividadesTimelineCollectionReference);
        when(mockDocumentSnapshot.data)
            .thenReturn({TIPO_ATIVIDADE_FIELD: 'DESPESA'});
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockAtividadesTimelineCollectionReference.snapshots())
            .thenAnswer((_) => snapshotStream);

        firebaseTimelineRepository.getUserTimeline('1').listen((data) {
          expect(data.item1, [DespesaModel()]);
          expect(data.item2, []);
        });
      });

      test('throws ComunicationException', () {
        when(when(mockFirestore.collection(TIMELINE))).thenThrow(Exception());
        try {
          firebaseTimelineRepository.getUserTimeline('1');
        } on Exception catch (e) {
          expect(e, isA<ComunicationException>());
        }
      });
    });
  });
}
