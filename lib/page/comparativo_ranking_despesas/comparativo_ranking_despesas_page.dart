import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/commom_bloc.dart';
import '../../core/domain/model/models.dart';
import 'widget/resultados_ranking.dart';

class ComparativoRankingDespesasPage extends StatelessWidget {
  ComparativoRankingDespesasPage(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ComparativoRankingDespesasBloc,
            ComparativoRankingDespesasState>(
          builder: (_, state) => state.maybeMap(
            getRankingResultadosSuccess: _mapSuccessToWidget,
            loadingResultadosRanking: mapLoadingStateToWidget,
            orElse: mapErrorToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapSuccessToWidget(GetRankingResultadosSuccess state) {
    return ResultadosRanking(
      politico: politico,
      resultadosRanking: state.resultadosRanking,
    );
  }
}
