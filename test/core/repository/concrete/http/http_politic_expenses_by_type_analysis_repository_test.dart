import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:polis/core/domain/dto/despesa_por_tipo.dart';
import 'package:polis/core/repository/concrete/repositories.dart';

import '../../../../mock.dart';

void main() {
  group('HttpPoliticExpensesByTypeAnalysisRepository tests', () {
    HttpPoliticExpensesByTypeAnalysisRepository
        httpPoliticExpensesByTypeAnalysisRepository;
    MockDio mockDio;
    MockResponse mockResponse;

    setUp(() {
      mockDio = MockDio();
      mockResponse = MockResponse();
      httpPoliticExpensesByTypeAnalysisRepository =
          HttpPoliticExpensesByTypeAnalysisRepository(
        client: mockDio,
      );
    });

    test('asserts', () {
      expect(
          () => HttpPoliticExpensesByTypeAnalysisRepository(
                client: null,
              ),
          throwsAssertionError);
    });

    group('getYearExpensesByType', () {
      test('works', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(200);
        when(mockResponse.data).thenReturn(
          [
            DespesaPorTipo(
              tipoCota: 'tipo',
              valor: '10000',
              percentual: '10%',
            ).toJson(),
          ],
        );
        await httpPoliticExpensesByTypeAnalysisRepository.getYearExpensesByType(
            politicoId: '1', ano: '2019');
      });

      test('throws exception', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenThrow(Exception());
        try {
          await httpPoliticExpensesByTypeAnalysisRepository
              .getYearExpensesByType(politicoId: '1', ano: '2019');
        } on Exception {}
      });

      test('throws exception when response is not ok', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenAnswer((_) => Future.value(mockResponse));
        when(mockResponse.statusCode).thenReturn(500);
        httpPoliticExpensesByTypeAnalysisRepository
            .getYearExpensesByType(politicoId: '1', ano: '2019')
            .catchError((e) => expect(e, isA<Exception>()));
      });
    });
  });
}
