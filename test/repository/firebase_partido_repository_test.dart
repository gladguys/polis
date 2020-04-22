import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePartidoRepository tests', () {
    FirebasePartidoRepository firebasePartidoRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockPartidosCollectionReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePartidoRepository = FirebasePartidoRepository(
        firestore: mockFirestore,
      );
      mockPartidosCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('test asserts', () {
      expect(
          () => FirebasePartidoRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getAllPartidos', () {
      test('get all the partidos', () async {
        when(mockFirestore.collection(PARTIDOS_COLLECTION))
            .thenReturn(mockPartidosCollectionReference);
        when(mockPartidosCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '1'});

        final partidos = await firebasePartidoRepository.getAllPartidos();
        expect(partidos[0].id, '1');
      });

      test('throws exception', () {
        when(mockFirestore.collection(PARTIDOS_COLLECTION))
            .thenThrow(Exception());
        firebasePartidoRepository
            .getAllPartidos()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
