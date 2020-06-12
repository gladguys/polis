import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/exception/exceptions.dart';
import 'package:polis/core/repository/concrete/firebase/firebase.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../mock.dart';

void main() {
  FirebaseComparativoRankingDespesasRepository
      firebaseComparativoRankingDespesasRepository;
  MockFirestore mockFirestore;
  MockCollectionReference mockResultadosRankingCollectionRef;
  MockDocumentReference mockRankingDocumentRef;
  MockDocumentSnapshot mockDocumentSnapshot;

  group('FirebaseChangePasswordRepository tests', () {
    setUp(() {
      mockFirestore = MockFirestore();
      firebaseComparativoRankingDespesasRepository =
          FirebaseComparativoRankingDespesasRepository(
        firestore: mockFirestore,
      );
      mockResultadosRankingCollectionRef = MockCollectionReference();
      mockResultadosRankingCollectionRef = MockCollectionReference();
      mockRankingDocumentRef = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();
    });

    test('asserts', () {
      expect(
          () => FirebaseComparativoRankingDespesasRepository(firestore: null),
          throwsAssertionError);
    });

    group('getRankingResults', () {
      test('should get ResultadosRankingModel as result', () async {
        when(mockFirestore.collection(RESULTADOS_RANKING_COLLECTION))
            .thenReturn(mockResultadosRankingCollectionRef);
        when(mockResultadosRankingCollectionRef.document(RANKING))
            .thenReturn(mockRankingDocumentRef);
        when(mockRankingDocumentRef.get())
            .thenAnswer((_) => Future.value(mockDocumentSnapshot));
        when(mockDocumentSnapshot.data).thenReturn({'despesaMedia': 10.0});
        final resultadoRanking =
            await firebaseComparativoRankingDespesasRepository
                .getRankingResults();
        expect(resultadoRanking.despesaMedia, 10.0);
      });

      test('should throw ComunicationException when fails', () async {
        when(mockFirestore.collection(RESULTADOS_RANKING_COLLECTION))
            .thenThrow(Exception());
        firebaseComparativoRankingDespesasRepository
            .getRankingResults()
            .catchError((e) => expect(e, isA<ComunicationException>()));
      });
    });
  });
}
