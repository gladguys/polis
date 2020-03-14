import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticSuggestionRepository tests', () {
    FirebasePoliticSuggestionRepository firebasePoliticSuggestionRepository;
    MockFirestore mockFirestore;
    //MockQuery mockQuery;
    //MockQuerySnapshot mockQuerySnapshot;
    //MockDocumentReference mockDocumentReference;
    //MockDocumentSnapshot mockDocumentSnapshot;
    //MockCollectionReference mockCollectionReference;
    //List<MockDocumentSnapshot> mockDocumentSnapshotList;

    setUp(() {
      mockFirestore = MockFirestore();
      //mockQuery = MockQuery();
      //mockQuerySnapshot = MockQuerySnapshot();
      firebasePoliticSuggestionRepository = FirebasePoliticSuggestionRepository(
        firestore: mockFirestore,
      );
      //mockDocumentReference = MockDocumentReference();
      //mockDocumentSnapshot = MockDocumentSnapshot();
      //mockCollectionReference = MockCollectionReference();
      //mockDocumentSnapshotList = [
      //mockDocumentSnapshot,
      //];
    });

    test('test asserts', () {
      expect(
          () => FirebasePoliticSuggestionRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getSuggestedPolitics tests', () {
      // TODO(rodrigo): fix this test
      /*test('return [PoliticoModel] when there are suggestions', () async {
        when(mockFirestore.collection(POLITICOS))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn(mockDocumentSnapshotList);
        when(mockDocumentSnapshotList.sublist(any, any))
            .thenReturn([mockDocumentSnapshot]);
        final politicoJson = {
          'id': '1',
        };
        //when(mockDocumentSnapshot.data).thenReturn(politicoJson);

        final suggestedPolitics =
            await firebasePoliticSuggestionRepository.getSuggestedPolitics();
        expect(suggestedPolitics.length, 1);
        expect(suggestedPolitics[0].id, politicoJson['id']);
      });*/

      test('should throw exception', () {
        when(mockFirestore.collection(POLITICOS)).thenThrow(Exception());
        firebasePoliticSuggestionRepository
            .getSuggestedPolitics()
            .then((_) {})
            .catchError(
                (e) => expect(e, isInstanceOf<ComunicationException>()));
      });
    });
  });
}
