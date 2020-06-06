import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class PoliticProposalsPageConnected extends StatelessWidget {
  PoliticProposalsPageConnected(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return PageConnected<PoliticProposalsBloc>(
      bloc: PoliticProposalsBloc(
        repository: context.repository<FirebasePoliticProposalsRepository>(),
      )..add(GetPoliticProposals(politico.id)),
      page: PoliticProposalsPage(politico),
    );
  }
}
