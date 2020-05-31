import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  FirebaseFavoritePostsRepository firebaseFavoritePostsRepository;
  MockFirestore mockFirestore;
  MockCollectionReference mockPostsFavoritosCollectionReference;
  MockCollectionReference mockPostsFavoritosUsuarioSubcollectionReference;
  MockDocumentReference mockUserDocumentReference;
  MockQuerySnapshot mockQuerySnapshot;
  MockDocumentSnapshot mockDespesaDocumentSnapshot;
  MockDocumentSnapshot mockPropostaDocumentSnapshot;
  MockQuery mockQuery;

  group('FirebasePostRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      firebaseFavoritePostsRepository = FirebaseFavoritePostsRepository(
        firestore: mockFirestore,
      );
      mockPostsFavoritosCollectionReference = MockCollectionReference();
      mockPostsFavoritosUsuarioSubcollectionReference =
          MockCollectionReference();
      mockUserDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDespesaDocumentSnapshot = MockDocumentSnapshot();
      mockPropostaDocumentSnapshot = MockDocumentSnapshot();
      mockQuery = MockQuery();
    });

    test('test asserts', () {
      expect(() => FirebaseFavoritePostsRepository(firestore: null),
          throwsAssertionError);
    });

    group('getUserFavoritePosts', () {
      test('should get favorite posts and set favorite flag to true', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenReturn(mockPostsFavoritosCollectionReference);
        when(mockPostsFavoritosCollectionReference.document('1'))
            .thenReturn(mockUserDocumentReference);
        when(mockUserDocumentReference
                .collection(POSTS_FAVORITOS_USUARIO_SUBCOLLECTION))
            .thenReturn(mockPostsFavoritosUsuarioSubcollectionReference);
        when(mockPostsFavoritosUsuarioSubcollectionReference
                .orderBy(DATA_FAVORITADO_FIELD, descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn(
            [mockDespesaDocumentSnapshot, mockPropostaDocumentSnapshot]);
        when(mockDespesaDocumentSnapshot.data).thenReturn({
          'tipoAtividade': 'DESPESA',
        });
        when(mockPropostaDocumentSnapshot.data).thenReturn({
          'tipoAtividade': 'PROPOSICAO',
        });
        final posts =
            await firebaseFavoritePostsRepository.getUserFavoritePosts('1');
        final postsWithFavoriteFlag = posts.where((post) {
          if (post is DespesaModel) {
            return post.favorito;
          } else if (post is PropostaModel) {
            return post.favorito;
          }
          return false;
        }).toList();
        expect(postsWithFavoriteFlag.length, 2);
      });

      test('should throw ComunicationException', () async {
        when(mockFirestore.collection(POSTS_FAVORITOS_COLLECTION))
            .thenThrow(Exception());
        firebaseFavoritePostsRepository
            .getUserFavoritePosts('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
