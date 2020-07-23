import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticProposalsPageConnected extends StatelessWidget {
  PoliticProposalsPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticProposalsCubit>(
      bloc: PoliticProposalsCubit(
        repository: context.repository<FirebasePoliticProposalsRepository>(),
      )..getPoliticProposals(politico.id),
      page: PoliticProposalsPage(politico),
    );
  }
}
