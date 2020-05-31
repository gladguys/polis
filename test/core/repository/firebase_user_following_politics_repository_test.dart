import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebaseUserFollowingPoliticsRepository tests', () {
    MockFirestore mockFirestore;
    FirebaseUserFollowingPoliticsRepository
        firebaseUserFollowingPoliticsRepository;
    MockCollectionReference mockPoliticosSeguindoCollectionReference;
    MockCollectionReference mockPoliticosSeguindoInnerCollectionReference;
    MockDocumentReference mockUserDocumentReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebaseUserFollowingPoliticsRepository =
          FirebaseUserFollowingPoliticsRepository(
        firestore: mockFirestore,
      );
      mockPoliticosSeguindoCollectionReference = MockCollectionReference();
      mockPoliticosSeguindoInnerCollectionReference = MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebaseUserFollowingPoliticsRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getFollowingPolitics', () {
      test('returns list of followed politics', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguindoCollectionReference);
        when(mockPoliticosSeguindoCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockPoliticosSeguindoInnerCollectionReference);
        when(mockPoliticosSeguindoInnerCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '2'});
        final politics = await firebaseUserFollowingPoliticsRepository
            .getFollowingPolitics('1');
        expect(politics.length, 1);
        expect(
          politics[0],
          PoliticoModel(id: '2'),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenThrow(Exception());
        firebaseUserFollowingPoliticsRepository
            .getFollowingPolitics('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
