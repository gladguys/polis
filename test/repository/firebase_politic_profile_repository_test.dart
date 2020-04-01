import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticProfileRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticProfileRepository firebasePoliticProfileRepository;
    MockCollectionReference mockPoliticosCollectionReference;
    MockDocumentReference mockDocumentReference;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticProfileRepository = FirebasePoliticProfileRepository(
        firestore: mockFirestore,
      );
      mockPoliticosCollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticProfileRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getInfoPolitic', () {
      test('returns Politic with info', () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));

        when(mockDocumentSnapshot.data).thenReturn({
          'id': '1',
        });
        final politico =
            await firebasePoliticProfileRepository.getInfoPolitic('1');
        expect(politico, isNotNull);
        expect(
          politico,
          PoliticoModel(
            id: '1',
          ),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticProfileRepository
            .getInfoPolitic('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
