import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/repository/concrete/http/dio_main_api.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('HttpPoliticExpensesAnalysisQuotaRepository tests', () {
    HttpPoliticExpensesAnalysisQuotaRepository
        httpPoliticExpensesAnalysisQuotaRepository;
    MockDio mockDio;
    MockResponse mockResponse;

    setUp(() {
      mockDio = MockDio();
      mockResponse = MockResponse();
      httpPoliticExpensesAnalysisQuotaRepository =
          HttpPoliticExpensesAnalysisQuotaRepository(
        client: mockDio,
      );
    });

    test('asserts', () {
      expect(
          () => HttpPoliticExpensesAnalysisQuotaRepository(
                client: null,
              ),
          throwsAssertionError);
    });

    group('getMaxQuotaForStateUf', () {
      test('works', () async {
        when(mockDio.get(any)).thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn({
          COTA_DISPONIVEL: '10.000,00',
        });
        final quota = await httpPoliticExpensesAnalysisQuotaRepository
            .getMaxQuotaForStateUf('CE');
        expect(quota, 10000.0);
      });

      test('throws exception', () async {
        when(mockDio.get(any)).thenThrow(Exception());
        try {
          await httpPoliticExpensesAnalysisQuotaRepository
              .getMaxQuotaForStateUf('CE');
        } on Exception {}
      });

      test('throws exception when response is not ok', () async {
        when(mockDio.get(any)).thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(500);
        httpPoliticExpensesAnalysisQuotaRepository
            .getMaxQuotaForStateUf('CE')
            .catchError((e) => expect(e, isA<Exception>()));
      });
    });
  });
}
