import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/dto/despesa_por_tipo.dart';
import '../../abstract/repositories.dart';
import 'dio_scrapper_api.dart';
import 'dio_utils.dart';

class HttpPoliticExpensesByTypeAnalysisRepository
    implements PoliticExpensesByTypeAnalysisRepository {
  HttpPoliticExpensesByTypeAnalysisRepository({@required this.client})
      : assert(client != null);

  final Dio client;

  @override
  Future<List<DespesaPorTipo>> getYearExpensesByType(
      {String politicoId, String ano}) async {
    try {
      final response = await client.get(
        '$POLITICOS/$politicoId/$GASTOS_COTA',
        queryParameters: {
          ANO_PARAM: ano,
        },
      );
      if (response.isOk) {
        final decodedResponse = response.data as List;
        return List.generate(decodedResponse.length,
            (i) => DespesaPorTipo.fromJson(decodedResponse[i]));
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }
}
