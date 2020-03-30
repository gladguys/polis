import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebaseSearchPoliticRepository tests', () {
    FirebaseSearchPoliticRepository firebaseSearchPoliticRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockPoliticosCollectionReference;
    MockCollectionReference mockPoliticosSeguindoCollectionReference;
    MockCollectionReference mockPoliticosSeguindoInnerCollectionReference;
    MockDocumentReference mocPoliticDocumentReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebaseSearchPoliticRepository = FirebaseSearchPoliticRepository(
        firestore: mockFirestore,
      );
      mocPoliticDocumentReference = MockDocumentReference();
      mockPoliticosCollectionReference = MockCollectionReference();
      mockPoliticosSeguindoCollectionReference = MockCollectionReference();
      mockPoliticosSeguindoInnerCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebaseSearchPoliticRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getAllPolitics', () {
      test('returns list of all politics', () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '1'});
        final politics = await firebaseSearchPoliticRepository.getAllPolitics();
        expect(politics.length, 1);
        expect(
          politics[0],
          PoliticoModel(id: '1'),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenThrow(Exception());
        firebaseSearchPoliticRepository
            .getAllPolitics()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getPoliticsFollowing', () {
      test('return list of followed politics', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguindoCollectionReference);
        when(mockPoliticosSeguindoCollectionReference.document('1'))
            .thenReturn(mocPoliticDocumentReference);
        when(mocPoliticDocumentReference
                .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockPoliticosSeguindoInnerCollectionReference);
        when(mockPoliticosSeguindoInnerCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([]);
        await firebaseSearchPoliticRepository.getPoliticsFollowing('1');
      });

      test('throw ComunicationException', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenThrow(Exception());
        firebaseSearchPoliticRepository
            .getPoliticsFollowing('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
