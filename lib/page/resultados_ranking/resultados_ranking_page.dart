import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../widget/error_container.dart';
import '../../widget/loading.dart';
import 'widget/resultados_ranking.dart';

class ResultadosRankingPage extends StatelessWidget {
  ResultadosRankingPage(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ResultadosRankingBloc, ResultadosRankingState>(
          builder: (_, state) {
            if (state is GetRankingResultadosSuccess) {
              return ResultadosRanking(
                politico: politico,
                resultadosRanking: state.resultadosRanking,
              );
            } else if (state is LoadingResultadosRanking) {
              return const Loading();
            } else {
              return const ErrorContainer();
            }
          },
        ),
      ),
    );
  }
}
