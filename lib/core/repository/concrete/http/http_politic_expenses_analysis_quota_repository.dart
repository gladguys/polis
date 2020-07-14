import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/polis_utils.dart';
import '../../abstract/repositories.dart';
import 'dio_main_api.dart';
import 'dio_utils.dart';

class HttpPoliticExpensesAnalysisQuotaRepository
    implements PoliticExpensesAnalysisQuotaRepository {
  HttpPoliticExpensesAnalysisQuotaRepository({@required this.client})
      : assert(client != null);

  final Dio client;

  @override
  Future<double> getMaxQuotaForStateUf(String uf) async {
    try {
      final response = await client.get(
        '$DESPESAS/$COTA/$TOTAL_ESTADO/$uf',
      );
      if (response.isOk) {
        final decodedResponse = response.data;
        final cotaDisponivel = sanitizeString(decodedResponse[COTA_DISPONIVEL]);
        return double.parse(cotaDisponivel);
      }
      throw Exception();
    } on Exception {
      rethrow;
    }
  }
}
