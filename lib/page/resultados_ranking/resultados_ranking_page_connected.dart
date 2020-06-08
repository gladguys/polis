import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'resultados_ranking_page.dart';

class ResultadosRankingPageConnected extends StatelessWidget {
  ResultadosRankingPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<ResultadosRankingBloc>(
      bloc: ResultadosRankingBloc(
        repository: context.repository<FirebaseResultadosRankingRepository>(),
      )..add(GetRankingResultados()),
      page: ResultadosRankingPage(politico),
    );
  }
}
