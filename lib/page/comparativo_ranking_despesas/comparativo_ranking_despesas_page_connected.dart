import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import 'comparativo_ranking_despesas_page.dart';

class ComparativoRankingDespesasPageConnected extends StatelessWidget {
  ComparativoRankingDespesasPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<ComparativoRankingDespesasCubit>(
      bloc: ComparativoRankingDespesasCubit(
        repository:
            context.repository<FirebaseComparativoRankingDespesasRepository>(),
      )..getRankingResultados(),
      page: ComparativoRankingDespesasPage(politico),
    );
  }
}
