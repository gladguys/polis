import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('FirebaseUserRepository tests', () {
    MockFirestore mockFirestore;
    FirebaseTramitacaoPropostaRepository firebaseTramitacaoPropostaRepository;
    MockCollectionReference mockTramitacoesCollectionRef;
    MockCollectionReference mockTramitacoesSubcollectionRef;
    MockDocumentReference mockPropostaDocumentRef;
    MockQuery mockQuery;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      mockTramitacoesCollectionRef = MockCollectionReference();
      mockTramitacoesSubcollectionRef = MockCollectionReference();
      mockPropostaDocumentRef = MockDocumentReference();
      mockQuery = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
      firebaseTramitacaoPropostaRepository =
          FirebaseTramitacaoPropostaRepository(
        firestore: mockFirestore,
      );
    });

    test('test asserts', () {
      expect(
          () => FirebaseTramitacaoPropostaRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getTramitacoesProposta', () {
      test('works', () async {
        when(mockFirestore.collection(TRAMITACOES_COLLECTION))
            .thenReturn(mockTramitacoesCollectionRef);
        when(mockTramitacoesCollectionRef.document('1'))
            .thenReturn(mockPropostaDocumentRef);
        when(mockPropostaDocumentRef
                .collection(TRAMITACOES_PROPOSICAO_SUBCOLLECTION))
            .thenReturn(mockTramitacoesSubcollectionRef);
        when(mockTramitacoesSubcollectionRef.orderBy(SEQUENCIA_FIELD,
                descending: true))
            .thenReturn(mockQuery);
        when(mockQuery.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([mockDocumentSnapshot]);
        when(mockDocumentSnapshot.data).thenReturn({
          'ambito': 'ambito',
        });

        await firebaseTramitacaoPropostaRepository.getTramitacoesProposta('1');
      });

      test('throws exception', () async {
        when(mockFirestore.collection(TRAMITACOES_COLLECTION))
            .thenThrow(Exception());
        firebaseTramitacaoPropostaRepository
            .getTramitacoesProposta('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
