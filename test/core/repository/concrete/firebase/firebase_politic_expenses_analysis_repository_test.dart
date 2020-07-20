import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('FirebasePoliticExpensesAnalysisRepository tests', () {
    FirebasePoliticExpensesAnalysisRepository
        firebasePoliticExpensesAnalysisRepository;
    MockFirestore mockFirestore;
    MockCollectionReference mockTotalizadorDespesasCollectionRef;
    MockDocumentReference mockPoliticoDocumentRef;
    MockCollectionReference mockTotaisAnoSubCollectionRef;
    MockDocumentReference mockAnoDocumentRef;
    MockCollectionReference mockTotalMesSubCollectionRef;
    MockQuerySnapshot mockQuerySnapshot;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      mockTotalizadorDespesasCollectionRef = MockCollectionReference();
      mockTotaisAnoSubCollectionRef = MockCollectionReference();
      mockTotalMesSubCollectionRef = MockCollectionReference();
      mockPoliticoDocumentRef = MockDocumentReference();
      mockAnoDocumentRef = MockDocumentReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockDocumentSnapshot = MockDocumentSnapshot();

      firebasePoliticExpensesAnalysisRepository =
          FirebasePoliticExpensesAnalysisRepository(
        firestore: mockFirestore,
      );
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticExpensesAnalysisRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getYearExpensesData', () {
      test('works', () async {
        when(mockFirestore.collection(TOTALIZADOR_DESPESAS_COLLECTION))
            .thenReturn(mockTotalizadorDespesasCollectionRef);
        when(mockTotalizadorDespesasCollectionRef.document('1'))
            .thenReturn(mockPoliticoDocumentRef);
        when(mockPoliticoDocumentRef.collection(TOTAIS_ANO_SUBCOLLECTION))
            .thenReturn(mockTotaisAnoSubCollectionRef);
        when(mockTotaisAnoSubCollectionRef.document('2019'))
            .thenReturn(mockAnoDocumentRef);
        when(mockAnoDocumentRef.collection(TOTAL_MES_SUBCOLLECTION))
            .thenReturn(mockTotalMesSubCollectionRef);
        when(mockTotalMesSubCollectionRef.getDocuments())
            .thenAnswer((_) => Future.value(mockQuerySnapshot));
        when(mockQuerySnapshot.documents).thenReturn([
          mockDocumentSnapshot,
        ]);
        when(mockDocumentSnapshot.data).thenReturn({
          'ano': 2019,
        });
        await firebasePoliticExpensesAnalysisRepository.getYearExpensesData(
          politicoId: '1',
          ano: '2019',
        );
      });

      test('throws exception', () async {
        when(mockFirestore.collection(TOTALIZADOR_DESPESAS_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticExpensesAnalysisRepository
            .getYearExpensesData(politicoId: '1', ano: '2019')
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
