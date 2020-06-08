import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/model/models.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  group('FirebasePoliticExpenseRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticExpensesRepository firebasePoliticExpensesRepository;
    MockCollectionReference mockAtividadesCollectionReference;
    MockCollectionReference mockAtividadesPoliticosSubcollectionReference;
    MockDocumentReference mockDocumentReference;
    MockQuery mockQueryExpense;
    MockQuery mockQueryOrder;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      firebasePoliticExpensesRepository = FirebasePoliticExpensesRepository(
        firestore: mockFirestore,
      );
      mockAtividadesCollectionReference = MockCollectionReference();
      mockAtividadesPoliticosSubcollectionReference = MockCollectionReference();
      mockDocumentReference = MockDocumentReference();
      mockQueryExpense = MockQuery();
      mockQueryOrder = MockQuery();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticExpensesRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getPoliticExpenses', () {
      test('returns list of politic expenses', () async {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenReturn(mockAtividadesCollectionReference);
        when(mockAtividadesCollectionReference.document('1'))
            .thenReturn(mockDocumentReference);
        when(mockDocumentReference
                .collection(ATIVIDADES_POLITICO_SUBCOLLECTION))
            .thenReturn(mockAtividadesPoliticosSubcollectionReference);
        when(mockAtividadesPoliticosSubcollectionReference
                .where(TIPO_ATIVIDADE_FIELD, isEqualTo: 'DESPESA'))
            .thenReturn(mockQueryExpense);
        when(mockQueryExpense.orderBy(DATA_DOCUMENTO_FIELD, descending: true))
            .thenReturn(mockQueryOrder);
        when(mockQueryOrder.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockDocumentSnapshot.data).thenReturn({'id': '1'});
        final expenses =
            await firebasePoliticExpensesRepository.getPoliticExpenses('1');
        expect(expenses.length, 1);
        expect(
          expenses[0],
          DespesaModel(id: '1'),
        );
      });

      test('throws ComunicationException', () {
        when(mockFirestore.collection(ATIVIDADES_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticExpensesRepository
            .getPoliticExpenses('1')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
