import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebasePoliticFollowersRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticFollowersRepository firebasePoliticFollowersRepository;
    MockCollectionReference mockUsuariosSeguindoCollectionReference;
    MockCollectionReference mockUsuariosSeguindoSubcollectionReference;
    MockDocumentReference mockDocumentReference;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticFollowersRepository = FirebasePoliticFollowersRepository(
        firestore: mockFirestore,
      );
      mockUsuariosSeguindoCollectionReference = MockCollectionReference();
      mockUsuariosSeguindoSubcollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticFollowersRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getUsersFollowingPolitic', () {
      test('returns list of followed politics', () async {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenReturn(mockUsuariosSeguindoSubcollectionReference);
        when(mockUsuariosSeguindoSubcollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockDocumentSnapshot.data).thenReturn({'name': 'name'});
        final followers = await firebasePoliticFollowersRepository
            .getUsersFollowingPolitic('1');
        expect(followers.length, 1);
        expect(
          followers[0],
          UsuarioSeguindoPolitico(name: 'name'),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticFollowersRepository
            .getUsersFollowingPolitic('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
