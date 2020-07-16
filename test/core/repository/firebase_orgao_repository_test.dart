import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebaseOrgaoRepository tests', () {
    FirebaseOrgaoRepository firebaseOrgaoRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockPoliticosCollectionReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebaseOrgaoRepository = FirebaseOrgaoRepository(
        firestore: mockFirestore,
      );
      mockPoliticosCollectionReference = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('test asserts', () {
      expect(
          () => FirebaseOrgaoRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getAllOrgaosMap', () {
      test('get all the orgaos and return a map', () async {
        when(mockFirestore.collection(ORGAOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({
          ID_FIELD: '1',
          'sigla': 'T',
        });

        final politicosMap = await firebaseOrgaoRepository.getAllOrgaosMap();
        expect(politicosMap['T'].id, '1');
      });

      test('throws exception', () {
        when(mockFirestore.collection(ORGAOS_COLLECTION))
            .thenThrow(Exception());
        firebaseOrgaoRepository
            .getAllOrgaosMap()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getAllOrgaos', () {
      test('get all orgaos', () async {
        when(mockFirestore.collection(ORGAOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({
          ID_FIELD: '1',
          'sigla': 'T',
        });

        final politicosMap = await firebaseOrgaoRepository.getAllOrgaos();
        expect(politicosMap[0].id, '1');
      });

      test('throws exception', () {
        when(mockFirestore.collection(ORGAOS_COLLECTION))
            .thenThrow(Exception());
        firebaseOrgaoRepository
            .getAllOrgaos()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
