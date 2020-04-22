import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  FirebasePostRepository firebasePostRepository;
  MockFirestore mockFirestore;
  MockCollectionReference mockPostsFavoritosCollectionReference;
  MockCollectionReference mockPostsFavoritosUsuarioSubcollectionReference;
  MockDocumentReference mockUserDocumentReference;
  MockDocumentReference mockPostDocumentReference;

  group('FirebasePostRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      firebasePostRepository = FirebasePostRepository(
        firestore: mockFirestore,
      );
      mockPostsFavoritosCollectionReference = MockCollectionReference();
      mockPostsFavoritosUsuarioSubcollectionReference =
          MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
      mockPostDocumentReference = MockDocumentReference();
    });

    test('test asserts', () {
      expect(
          () => FirebasePostRepository(firestore: null), throwsAssertionError);
    });

    group('favoritePost', () {
      test('should favorite', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenReturn(mockPostsFavoritosCollectionReference);
        when(mockPostsFavoritosCollectionReference.document('2'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION))
            .thenReturn(mockPostsFavoritosUsuarioSubcollectionReference);
        when(mockPostsFavoritosUsuarioSubcollectionReference.document('1'))
            .thenReturn(mockPostDocumentReference);
        await firebasePostRepository.favoritePost(
          post: {
            'id': '1',
          },
          user: UserModel(
            userId: '2',
          ),
        );
        verify(mockPostDocumentReference.setData(any)).called(1);
      });

      test('should throw ComunicationException', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenThrow(Exception());
        firebasePostRepository.favoritePost(
          post: {
            'id': '1',
          },
          user: UserModel(
            userId: '2',
          ),
        ).catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('unfavoritePost', () {
      test('should unfavorite', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenReturn(mockPostsFavoritosCollectionReference);
        when(mockPostsFavoritosCollectionReference.document('2'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION))
            .thenReturn(mockPostsFavoritosUsuarioSubcollectionReference);
        when(mockPostsFavoritosUsuarioSubcollectionReference.document('1'))
            .thenReturn(mockPostDocumentReference);
        await firebasePostRepository.unfavoritePost(
          post: {
            'id': '1',
          },
          user: UserModel(
            userId: '2',
          ),
        );
        verify(mockPostDocumentReference.delete()).called(1);
      });

      test('should throw ComunicationException', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenThrow(Exception());
        firebasePostRepository.unfavoritePost(
          post: {
            'id': '1',
          },
          user: UserModel(
            userId: '2',
          ),
        ).catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
