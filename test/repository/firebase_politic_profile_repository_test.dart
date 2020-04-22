import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/model/models.dart';
import 'package:polis/repository/concrete/firebase/firebase.dart';
import 'package:polis/repository/concrete/repositories.dart';

import '../mock.dart';

void main() {
  group('FirebasePoliticProfileRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticProfileRepository firebasePoliticProfileRepository;
    MockCollectionReference mockPoliticosCollectionReference;
    MockCollectionReference mockAtividadesCollectionReference;
    MockCollectionReference mockAtividadesSubcollectionReference;
    MockDocumentReference mockDocumentReference;
    MockDocumentSnapshot mockDocumentSnapshot;
    MockDocumentSnapshot mockDocumentPropostaSnapshot;
    MockQuery mockQuery;
    MockQuery mockQuery2;
    MockQuery mockQuery3;
    MockQuerySnapshot mockQuerySnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticProfileRepository = FirebasePoliticProfileRepository(
        firestore: mockFirestore,
      );
      mockPoliticosCollectionReference = MockCollectionReference();
      mockAtividadesCollectionReference = MockCollectionReference();
      mockAtividadesSubcollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      mockDocumentPropostaSnapshot = MockDocumentSnapshot();
      mockQuery = MockQuery();
      mockQuery2 = MockQuery();
      mockQuery3 = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticProfileRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getInfoPolitic', () {
      test('returns Politic with info', () async {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenReturn(mockPoliticosCollectionReference);
        when(mockPoliticosCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));

        when(mockDocumentSnapshot.data).thenReturn({
          'id': '1',
        });
        final politico =
            await firebasePoliticProfileRepository.getInfoPolitic('1');
        expect(politico, isNotNull);
        expect(
          politico,
          PoliticoModel(
            id: '1',
          ),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(POLITICOS_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticProfileRepository
            .getInfoPolitic('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getLastActivities', () {
      test('returns Politic last activities in descending order', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesSubcollectionReference);
        when(mockAtividadesSubcollectionReference.orderBy(DATA_DOCUMENTO_FIELD,
                descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.limit(any)).thenReturn(mockQuery);
        when(mockQuery.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents)
            .thenReturn([mockDocumentSnapshot, mockDocumentPropostaSnapshot]);

        when(mockDocumentSnapshot.data).thenReturn({
          'codDocumento': '1',
          'tipoAtividade': 'DESPESA',
        });
        when(mockDocumentPropostaSnapshot.data).thenReturn({
          'id': '1',
          'tipoAtividade': 'PROPOSICAO',
        });
        final lastActivitiesData = await firebasePoliticProfileRepository
            .getLastActivities(politicId: '1', count: 5);
        expect(lastActivitiesData.item1, isNotNull);
        expect(lastActivitiesData.item1, isNotEmpty);
        expect(
          lastActivitiesData.item1[0],
          DespesaModel(
            codDocumento: '1',
          ),
        );
        expect(
          lastActivitiesData.item1[1],
          PropostaModel(
            id: '1',
          ),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticProfileRepository
            .getLastActivities(politicId: '1', count: 5)
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });

    group('getMoreActivities', () {
      test('returns Politic more activities in descending order', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesSubcollectionReference);
        when(mockAtividadesSubcollectionReference.orderBy(DATA_DOCUMENTO_FIELD,
                descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery2);
        when(mockQuery2.limit(any)).thenReturn(mockQuery3);
        when(mockQuery3.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents)
            .thenReturn([mockDocumentSnapshot, mockDocumentPropostaSnapshot]);

        when(mockDocumentSnapshot.data).thenReturn({
          'codDocumento': '1',
          'tipoAtividade': 'DESPESA',
        });
        when(mockDocumentPropostaSnapshot.data).thenReturn({
          'id': '1',
          'tipoAtividade': 'PROPOSICAO',
        });
        final lastActivitiesData =
            await firebasePoliticProfileRepository.getMoreActivities(
                politicId: '1', count: 5, lastDocument: mockDocumentSnapshot);
        expect(lastActivitiesData.item1, isNotNull);
        expect(lastActivitiesData.item1, isNotEmpty);
        expect(
          lastActivitiesData.item1[0],
          DespesaModel(
            codDocumento: '1',
          ),
        );
        expect(
          lastActivitiesData.item1[1],
          PropostaModel(
            id: '1',
          ),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticProfileRepository
            .getMoreActivities(politicId: '1', count: 5)
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
