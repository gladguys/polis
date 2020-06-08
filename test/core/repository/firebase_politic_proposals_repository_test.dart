import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebasePoliticProposalsRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticProposalsRepository firebasePoliticProposalsRepository;
    MockCollectionReference mockAtividadesCollectionReference;
    MockCollectionReference mockAtividadesPoliticosSubcollectionReference;
    MockDocumentReference mockDocumentReference;
    MockQuery mockQueryProposal;
    MockQuery mockQueryDescription;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticProposalsRepository = FirebasePoliticProposalsRepository(
        firestore: mockFirestore,
      );
      mockAtividadesCollectionReference = MockCollectionReference();
      mockAtividadesPoliticosSubcollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockQueryProposal = MockQuery();
      mockQueryDescription = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticProposalsRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getPoliticProposals', () {
      test('returns list of politic proposals', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticosSubcollectionReference);
        when(mockAtividadesPoliticosSubcollectionReference
                .where(TIPO_ATIVIDADE_FIELD, isEqualTo: 'PROPOSICAO'))
            .thenReturn(mockQueryProposal);
        when(mockQueryProposal.where(DESCRICAO_TIPO_FIELD,
                isEqualTo: 'Projeto de Lei'))
            .thenReturn(mockQueryDescription);
        when(mockQueryDescription.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '1'});
        final proposals =
            await firebasePoliticProposalsRepository.getPoliticProposals('1');
        expect(proposals.length, 1);
        expect(
          proposals[0],
          PropostaModel(id: '1'),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticProposalsRepository
            .getPoliticProposals('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
