import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebaseFollowRepository tests', () {
    FirebaseFollowRepository firebaseFollowRepository;
    MockCollectionReference mockPoliticosSeguidosCollectionReference;
    MockCollectionReference mockPoliticosSeguidosInnerCollectionReference;
    MockCollectionReference mockUsuariosSeguindoCollectionReference;
    MockCollectionReference mockUsuariosSeguindoInnerCollectionReference;
    MockFirestore mockFirestore;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockUserDocumentReference;
    MockDocumentReference mockPoliticoDocumentReference;

    setUp(() {
      mockFirestore = MockFirestore();
      mockPoliticosSeguidosCollectionReference = MockCollectionReference();
      mockUsuariosSeguindoCollectionReference = MockCollectionReference();
      mockPoliticosSeguidosInnerCollectionReference = MockCollectionReference();
      mockUsuariosSeguindoInnerCollectionReference = MockCollectionReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockUserDocumentReference = MockDocumentReference();
      mockPoliticoDocumentReference = MockDocumentReference();
      firebaseFollowRepository = FirebaseFollowRepository(
        firestore: mockFirestore,
      );
    });

    test('test asserts', () {
      expect(
          () => FirebaseFollowRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('followPolitic tests', () {
      test(
          '''when follow politic add document in POLITICOS_SEGUIDOS and USUARIOS_SEGUINDO collections''',
          () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguidosCollectionReference);
        when(mockPoliticosSeguidosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockPoliticosSeguidosInnerCollectionReference);
        when(mockPoliticosSeguidosInnerCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);

        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenReturn(mockUsuariosSeguindoInnerCollectionReference);
        when(mockUsuariosSeguindoInnerCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);

        final user = UserModel(
          userId: '1',
        );
        final politico = PoliticoModel(
          id: '2',
        );
        await firebaseFollowRepository.followPolitic(
          user: user,
          politico: politico,
        );
        verify(mockPoliticoDocumentReference.setData(politico.toJson()))
            .called(1);
        verify(mockUserDocumentReference.setData(user.toJson())).called(1);
      });

      test('throws exception', () {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenThrow(Exception());
        final user = UserModel(
          userId: '1',
        );
        final politico = PoliticoModel(
          id: '2',
        );
        firebaseFollowRepository
            .followPolitic(
              user: user,
              politico: politico,
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('unfollowPolitic tests', () {
      test(
          '''when unfollowPolitic politic delete document in POLITICOS_SEGUIDOS and USUARIOS_SEGUINDO collections''',
          () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguidosCollectionReference);
        when(mockPoliticosSeguidosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockPoliticosSeguidosInnerCollectionReference);
        when(mockPoliticosSeguidosInnerCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);

        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenReturn(mockUsuariosSeguindoInnerCollectionReference);
        when(mockUsuariosSeguindoInnerCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);

        final user = UserModel(
          userId: '1',
        );
        final politico = PoliticoModel(
          id: '2',
        );
        await firebaseFollowRepository.unfollowPolitic(
          user: user,
          politico: politico,
        );
        verify(mockPoliticoDocumentReference.delete()).called(1);
        verify(mockUserDocumentReference.delete()).called(1);
      });

      test('throws exception', () {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenThrow(Exception());
        final user = UserModel(
          userId: '1',
        );
        final politico = PoliticoModel(
          id: '2',
        );
        firebaseFollowRepository
            .unfollowPolitic(
              user: user,
              politico: politico,
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('isPoliticBeingFollowed tests', () {
      test(
          '''when unfollowPolitic politic delete document in POLITICOS_SEGUIDOS and USUARIOS_SEGUINDO collections''',
          () async {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenReturn(mockUsuariosSeguindoInnerCollectionReference);
        when(mockUsuariosSeguindoInnerCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.exists).thenReturn(true);

        await firebaseFollowRepository.isPoliticBeingFollowed(
          user: UserModel(
            userId: '1',
          ),
          politicId: '2',
        );
        verify(mockDocumentSnapshot.exists).called(1);
      });

      test('throws exception', () {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenThrow(Exception());
        firebaseFollowRepository
            .isPoliticBeingFollowed(
              user: UserModel(
                userId: '1',
              ),
              politicId: '2',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
