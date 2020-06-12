import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  FirebasePostRepository firebasePostRepository;
  MockFirestore mockFirestore;
  MockCollectionReference mockPostsFavoritosCollectionReference;
  MockCollectionReference mockPostsFavoritosUsuarioSubcollectionReference;
  MockCollectionReference mockTimelineReference;
  MockCollectionReference mockAtividadesTimelineSubcollectionReference;
  MockDocumentReference mockUserDocumentReference;
  MockDocumentReference mockPostDocumentReference;
  MockDocumentSnapshot mockDocumentSnapshot;

  group('FirebasePostRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      firebasePostRepository = FirebasePostRepository(
        firestore: mockFirestore,
      );
      mockPostsFavoritosCollectionReference = MockCollectionReference();
      mockPostsFavoritosUsuarioSubcollectionReference =
          MockCollectionReference();
      mockTimelineReference = MockCollectionReference();
      mockAtividadesTimelineSubcollectionReference = MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
      mockPostDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
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

    group('setPostVisible', () {
      test('work', () async {
        when(mockFirestore.collection(TIMELINE_COLLECTION))
            .thenReturn(mockTimelineReference);
        when(mockTimelineReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION))
            .thenReturn(mockAtividadesTimelineSubcollectionReference);
        when(mockAtividadesTimelineSubcollectionReference.document('1'))
            .thenReturn(mockPostDocumentReference);
        await firebasePostRepository.setPostVisible(
          userId: '1',
          postId: '1',
        );
        verify(mockPostDocumentReference.updateData({VISUALIZADO_FIELD: true}))
            .called(1);
      });

      test('should throw ComunicationException', () async {
        when(mockFirestore.collection(TIMELINE_COLLECTION))
            .thenThrow(Exception());
        firebasePostRepository
            .setPostVisible(
              userId: '1',
              postId: '1',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('isPostFavorite', () {
      test('should return bool indicating if post is already favorited',
          () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenReturn(mockPostsFavoritosCollectionReference);
        when(mockPostsFavoritosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION))
            .thenReturn(mockPostsFavoritosUsuarioSubcollectionReference);
        when(mockPostsFavoritosUsuarioSubcollectionReference.document('1'))
            .thenReturn(mockPostDocumentReference);
        when(mockPostDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.exists).thenReturn(true);
        final exists = await firebasePostRepository.isPostFavorited(
          userId: '1',
          postId: '1',
        );
        expect(exists, true);
      });

      test('should throw ComunicationException when fail', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenThrow(Exception());
        firebasePostRepository
            .isPostFavorited(
              userId: '1',
              postId: '1',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
