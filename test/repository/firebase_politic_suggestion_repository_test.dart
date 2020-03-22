import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/politico_model.dart';
import 'package:polis/model/user_model.dart';
import 'package:polis/repository/concrete/firebase/collection.dart';
import 'package:polis/repository/concrete/firebase/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticSuggestionRepository tests', () {
    FirebasePoliticSuggestionRepository firebasePoliticSuggestionRepository;
    MockFirestore mockFirestore;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentReference mockDocumentReference;
    MockCollectionReference mockCollectionReference;
    MockQuery refFiltered;
    List<MockDocumentSnapshot> mockDocumentSnapshotList;

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
      test('return [PoliticoModel] when there are suggestions', () async {
        when(mockFirestore.collection(POLITICOS))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.where("siglaUf", isEqualTo: "CE"))
            .thenReturn(refFiltered);
        when(refFiltered.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        final politicoJson = {
          'id': '1',
        };
        when(mockQuerySnapshot.documents).thenReturn(mockDocumentSnapshotList);
        when(mockDocumentSnapshot.data).thenReturn(politicoJson);
        final suggestedPolitics =
            await firebasePoliticSuggestionRepository.getSuggestedPolitics();
        expect(suggestedPolitics.length, 1);
        expect(suggestedPolitics[0].id, politicoJson['id']);
      });

      test('should throw exception', () {
        when(mockFirestore.collection(POLITICOS)).thenThrow(Exception());
        firebasePoliticSuggestionRepository
            .getSuggestedPolitics()
            .then((_) {})
            .catchError(
                (e) => expect(e, isInstanceOf<ComunicationException>()));
      });
    });

    group('savePoliticsToFollow tests', () {
      test('save politics works', () async {
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_SEGUIDOS_COLLECTION))
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
        when(mockFirestore.collection(POLITICOS_SEGUIDOS))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(POLITICOS_SEGUIDOS_COLLECTION))
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
        when(mockFirestore.collection(USUARIOS_SEGUINDO))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(USUARIOS_SEGUINDO_COLLECTION))
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
        when(mockFirestore.collection(USUARIOS_SEGUINDO))
            .thenReturn(mockCollectionReference);
        when(mockCollectionReference.document(any))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.collection(USUARIOS_SEGUINDO_COLLECTION))
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
