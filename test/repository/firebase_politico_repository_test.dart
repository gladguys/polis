import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticoRepository tests', () {
    FirebasePoliticoRepository firebasePoliticoRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockPoliticosCollectionReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticoRepository = FirebasePoliticoRepository(
        firestore: mockFirestore,
      );
      mockPoliticosCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('test asserts', () {
      expect(
          () => FirebasePoliticoRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getAllPoliticos', () {
      test('get all the politicos', () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '1'});

        final politicos = await firebasePoliticoRepository.getAllPoliticos();
        expect(politicos[0].id, '1');
      });

      test('throws exception', () {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticoRepository
            .getAllPoliticos()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
