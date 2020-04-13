import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebaseUserProfileRepository tests', () {
    FirebaseUserProfileRepository firebaseUserProfileRepository;
    MockFirestore mockFirestore;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockDocumentReference;
    MockCollectionReference mockCollectionReference;
    MockCollectionReference mockAcoesCollectionReference;
    MockCollectionReference mockAcoesUsuarioSubcollectionReference;
    MockCollectionReference mockPoliticsFollowingCollectionReference;
    MockQuery mockQuery;

    setUp(() {
      mockFirestore = MockFirestore();
      mockDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      firebaseUserProfileRepository = FirebaseUserProfileRepository(
        firestore: mockFirestore,
      );
      mockCollectionReference = MockCollectionReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockAcoesCollectionReference = MockCollectionReference();
      mockAcoesUsuarioSubcollectionReference = MockCollectionReference();
      mockPoliticsFollowingCollectionReference = MockCollectionReference();
      mockQuery = MockQuery();
    });

    test('test asserts', () {
      expect(
          () => FirebaseUserProfileRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getPoliticsFollowing tests', () {
      test('return [PoliticoModel] with list of following politics', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockPoliticsFollowingCollectionReference);
        when(mockPoliticsFollowingCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([]);
        await firebaseUserProfileRepository.getPoliticsFollowing('1');
      });

      test('throw ComunicationException when something is wrong', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenThrow(Exception());
        firebaseUserProfileRepository
            .getPoliticsFollowing('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getUserActivities tests', () {
      test('works', () async {
        when(mockFirestore.collection(ACOES_COLLECTION))
            .thenReturn(mockAcoesCollectionReference);
        when(mockAcoesCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(ACOES_USUARIO_SUBCOLLECTION))
            .thenReturn(mockAcoesUsuarioSubcollectionReference);
        when(mockAcoesUsuarioSubcollectionReference.orderBy(DATA_ACAO,
                descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({
          'idPolitico': '1',
          'data': Timestamp.fromMillisecondsSinceEpoch(555)
        });
        final activities =
            await firebaseUserProfileRepository.getUserActivities('1');
        expect(activities, isNotEmpty);
      });

      test('throw ComunicationException when something is wrong', () async {
        when(mockFirestore.collection(ACOES_COLLECTION)).thenThrow(Exception());
        firebaseUserProfileRepository
            .getUserActivities('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
