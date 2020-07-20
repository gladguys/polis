import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('FirebasePoliticExpensesAnalysisConfigRepository tests', () {
    MockFirestore mockFirestore;
    FirebasePoliticExpensesAnalysisConfigRepository
        firebasePoliticExpensesAnalysisConfigRepository;
    MockCollectionReference mockSyncLogCollectionRef;
    MockDocumentReference mockInicioAnoDespesasDocumentRef;
    MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirestore();
      mockSyncLogCollectionRef = MockCollectionReference();
      mockInicioAnoDespesasDocumentRef = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
      firebasePoliticExpensesAnalysisConfigRepository =
          FirebasePoliticExpensesAnalysisConfigRepository(
        firestore: mockFirestore,
      );
    });

    test('asserts', () {
      expect(
          () => FirebasePoliticExpensesAnalysisConfigRepository(
                firestore: null,
              ),
          throwsAssertionError);
    });

    group('getExpensesBeginYear', () {
      test('works', () async {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenReturn(mockSyncLogCollectionRef);
        when(mockSyncLogCollectionRef.document(INICIO_ANO_DESPESAS))
            .thenReturn(mockInicioAnoDespesasDocumentRef);
        when(mockInicioAnoDespesasDocumentRef.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.data).thenReturn({
          VALUE: 2019,
        });
        final beginYear = await firebasePoliticExpensesAnalysisConfigRepository
            .getExpensesBeginYear();
        expect(beginYear, 2019);
      });

      test('throws exception', () async {
        when(mockFirestore.collection(SYNC_LOG_COLLECTION))
            .thenThrow(Exception());
        firebasePoliticExpensesAnalysisConfigRepository
            .getExpensesBeginYear()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
