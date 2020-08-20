import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('FirebasePoliticSuggestionRepository tests', () {
    FirebasePoliticSuggestionRepository firebasePoliticSuggestionRepository;
    MockFirestore mockFirestore;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockDocumentReference;
    MockCollectionReference mockCollectionReference;
    List<MockDocumentSnapshot> mockDocumentSnapshotList;
    MockQuery refFiltered;

    setUp(() {
      mockFirestore = MockFirestore();
      mockDocumentReference = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      firebasePoliticSuggestionRepository = FirebasePoliticSuggestionRepository(
        firestore: mockFirestore,
      );
      refFiltered = MockQuery();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockCollectionReference = MockCollectionReference();
      mockDocumentSnapshotList = [
        mockDocumentSnapshot,
      ];
    });

    test('test asserts', () {
      expect(
          () => FirebasePoliticSuggestionRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getSuggestedPolitics tests', () {
      test(
          '''return [PoliticoModel] when there are suggestions and user select all states''',
          () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        final politicoJson = {
          ID_FIELD: '1',
        };
        when(mockQuerySnapshot.documents).thenReturn(mockDocumentSnapshotList);
        when(mockDocumentSnapshot.data).thenReturn(politicoJson);
        final suggestedPolitics =
            await firebasePoliticSuggestionRepository.getSuggestedPolitics('T');
        expect(suggestedPolitics.length, 1);
        expect(suggestedPolitics[0].id, politicoJson[ID_FIELD]);
        verify(mockCollectionReference.getDocuments()).called(1);
      });

      test(
          '''return [PoliticoModel] when there are suggestions and user select a single state''',
          () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(
          mockCollectionReference.where(
            SIGLA_UF_FIELD,
            isEqualTo: 'CE',
          ),
        ).thenReturn(refFiltered);
        final politicoJson = {
          ID_FIELD: '1',
        };
        when(refFiltered.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn(mockDocumentSnapshotList);
        when(mockDocumentSnapshot.data).thenReturn(politicoJson);
        final suggestedPolitics = await firebasePoliticSuggestionRepository
            .getSuggestedPolitics('CE');
        expect(suggestedPolitics.length, 1);
        expect(suggestedPolitics[0].id, politicoJson[ID_FIELD]);
        verify(mockCollectionReference.where(SIGLA_UF_FIELD, isEqualTo: 'CE'))
            .called(1);
      });

      test('should throw exception', () {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticSuggestionRepository
            .getSuggestedPolitics('T')
            .then((_) {})
            .catchError(
                (e) => expect(e, isInstanceOf<ComunicationException>()));
      });
    });

    group('savePoliticsToFollow tests', () {
      test('save politics works', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        final politic = PoliticoModel(
          id: '1',
          nomeCivil: 'nome',
        );
        await firebasePoliticSuggestionRepository
            .savePoliticsToFollow(userId: '1', politics: [politic]);
        verify(mockDocumentReference.setData(politic.toJson())).called(1);
      });

      test('throw ComunicationException', () {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_SEGUIDOS_SUBCOLLECTION))
            .thenThrow(Exception());
        final politic = PoliticoModel(
          id: '1',
          nomeCivil: 'nome',
        );
        firebasePoliticSuggestionRepository
            .savePoliticsToFollow(userId: '1', politics: [politic]).catchError(
                (e) => expect(e, isInstanceOf<ComunicationException>()));
      });
    });

    group('saveFollowerToPolitics tests', () {
      test('works', () async {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        final user = UserModel(
          userId: '1',
        );
        final politic = PoliticoModel(
          id: '1',
          nomeCivil: 'nome',
        );
        await firebasePoliticSuggestionRepository
            .saveFollowerToPolitics(user: user, politics: [politic]);
        verify(mockDocumentReference.setData(user.toJson())).called(1);
      });

      test('throw ComunicationException', () {
        when(mockFirestore.collection(USUARIOS_SEGUINDO_COLLECTION))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(USUARIOS_SEGUINDO_SUBCOLLECTION))
            .thenThrow(Exception());
        final politic = PoliticoModel(
          id: '1',
          nomeCivil: 'nome',
        );
        firebasePoliticSuggestionRepository
            .saveFollowerToPolitics(user: UserModel(), politics: [
          politic
        ]).catchError((e) => expect(e, isInstanceOf<ComunicationException>()));
      });
    });
  });
}
