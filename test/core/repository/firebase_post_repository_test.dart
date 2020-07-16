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
  MockCollectionReference mockAtividadesCollectionReference;
  MockCollectionReference mockAtividadesPoliticSubcollectionReference;
  MockCollectionReference mockUsersCollectionReference;
  MockDocumentReference mockPoliticoDocumentReference;
  MockDocumentReference mockUserDocumentReference;
  MockDocumentReference mockPostDocumentReference;
  MockDocumentSnapshot mockDocumentSnapshot;

  group('FirebasePostRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      firebasePostRepository = FirebasePostRepository(
        firestore: mockFirestore,
      );
      mockAtividadesCollectionReference = MockCollectionReference();
      mockUsersCollectionReference = MockCollectionReference();
      mockPostsFavoritosCollectionReference = MockCollectionReference();
      mockAtividadesPoliticSubcollectionReference = MockCollectionReference();
      mockPostsFavoritosUsuarioSubcollectionReference =
          MockCollectionReference();
      mockTimelineReference = MockCollectionReference();
      mockAtividadesTimelineSubcollectionReference = MockCollectionReference();
      mockPoliticoDocumentReference = MockDocumentReference();
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
            ID_FIELD: '1',
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
            ID_FIELD: '1',
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
            ID_FIELD: '1',
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
            ID_FIELD: '1',
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

    group('likePost', () {
      test('should work when unliked', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.likePost(
          userId: '1',
          postId: '1',
          politicoId: '1',
          isUnliked: true,
        );
        expect(likes.item1, {
          '1': true,
        });
        expect(likes.item2, {
          '1': false,
        });
      });

      test('should work when not unliked', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.likePost(
          userId: '1',
          postId: '1',
          politicoId: '1',
          isUnliked: false,
        );
        expect(likes.item1, {
          '1': true,
        });
        expect(likes.item2, {
          '1': false,
        });
      });

      test('should fail', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get()).thenThrow(Exception());
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        firebasePostRepository
            .likePost(
              userId: '1',
              postId: '1',
              politicoId: '1',
              isUnliked: false,
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('unlikePost', () {
      test('should work when liked', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.unlikePost(
          userId: '1',
          postId: '1',
          politicoId: '1',
          isLiked: true,
        );
        expect(likes.item1, {
          '1': false,
        });
        expect(likes.item2, {
          '1': true,
        });
      });

      test('should work when not liked', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.unlikePost(
          userId: '1',
          postId: '1',
          politicoId: '1',
          isLiked: false,
        );
        expect(likes.item1, {
          '1': false,
        });
        expect(likes.item2, {
          '1': true,
        });
      });

      test('should fail', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());

        firebasePostRepository
            .unlikePost(
              userId: '1',
              postId: '1',
              politicoId: '1',
              isLiked: true,
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('stopLikingPost', () {
      test('should work', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.stopLikingPost(
          userId: '1',
          postId: '1',
          politicoId: '1',
        );
        expect(likes['1'], false);
      });

      test('should not work', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());

        firebasePostRepository
            .stopLikingPost(
              userId: '1',
              postId: '1',
              politicoId: '1',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('stopLikingPost', () {
      test('should work', () async {
        final mockAtividadeDocumentReference = MockDocumentReference();
        final mockAtividadeDocumentSnapshot = MockDocumentSnapshot();
        final mockUserDocumentReference = MockDocumentReference();
        final mockUserDocumentSnapshot = MockDocumentSnapshot();
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockPoliticoDocumentReference);
        when(mockPoliticoDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticSubcollectionReference);
        when(mockAtividadesPoliticSubcollectionReference.document('1'))
            .thenReturn(mockAtividadeDocumentReference);
        when(mockAtividadeDocumentReference.get())
            .thenAnswer((_) => Future.value(mockAtividadeDocumentSnapshot));
        when(mockAtividadeDocumentSnapshot.data).thenReturn({
          QTD_CURTIDAS_FIELD: 0,
          QTD_NAO_CURTIDAS_FIELD: 0,
        });
        when(mockFirestore.collection(USERS_COLLECTION))
            .thenReturn(mockUsersCollectionReference);
        when(mockUsersCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference.get())
            .thenAnswer((_) => Future.value(mockUserDocumentSnapshot));
        when(mockUserDocumentSnapshot.data).thenReturn({
          USER_LIKES_FIELD: {},
          USER_UNLIKES_FIELD: {},
        });

        final likes = await firebasePostRepository.stopUnlikingPost(
          userId: '1',
          postId: '1',
          politicoId: '1',
        );
        expect(likes['1'], false);
      });

      test('should not work', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());

        firebasePostRepository
            .stopUnlikingPost(
              userId: '1',
              postId: '1',
              politicoId: '1',
            )
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
