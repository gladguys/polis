import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/comunication_exception.dart';
import 'package:polis/model/politico_model.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/firebase_follow_repository.dart';

import '../mock.dart';

void main() {
  group('FirebaseFollowRepository tests', () {
    FirebaseFollowRepository firebaseFollowRepository;
    MockCollectionReference mockPoliticosSeguidosCollectionReference;
    MockCollectionReference mockPoliticosSeguidosInnerCollectionReference;
    MockCollectionReference mockUsuariosSeguindoCollectionReference;
    MockCollectionReference mockUsuariosSeguindoInnerCollectionReference;
    MockFirestore mockFirestore;
    MockDocumentReference mockUserDocumentReference;
    MockDocumentReference mockPoliticoDocumentReference;

    setUp(() {
      mockFirestore = MockFirestore();
      mockPoliticosSeguidosCollectionReference = MockCollectionReference();
      mockUsuariosSeguindoCollectionReference = MockCollectionReference();
      mockPoliticosSeguidosInnerCollectionReference = MockCollectionReference();
      mockUsuariosSeguindoInnerCollectionReference = MockCollectionReference();
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
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
            .thenReturn(mockPoliticosSeguidosCollectionReference);
        when(mockPoliticosSeguidosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguidosInnerCollectionReference);
        when(mockPoliticosSeguidosInnerCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);

        when(mockFirestore.collection(USUARIOS_SEGUINDO))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(USUARIOS_SEGUINDO_COLLECTION))
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
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
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
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
            .thenReturn(mockPoliticosSeguidosCollectionReference);
        when(mockPoliticosSeguidosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockPoliticosSeguidosInnerCollectionReference);
        when(mockPoliticosSeguidosInnerCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);

        when(mockFirestore.collection(USUARIOS_SEGUINDO))
            .thenReturn(mockUsuariosSeguindoCollectionReference);
        when(mockUsuariosSeguindoCollectionReference.document('2'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(USUARIOS_SEGUINDO_COLLECTION))
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
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
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
  });
}
