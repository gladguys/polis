import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../../widget/empty_info.dart';
import '../../widget/error_container.dart';
import '../../widget/text_title.dart';
import 'widget/politic_proposals_list.dart';
import 'widget/politic_proposals_skeleton.dart';

class PoliticProposalsPage extends StatelessWidget {
  PoliticProposalsPage(this.politico);

  final PoliticoModel politico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PoliticProposalsBloc, PoliticProposalsState>(
          builder: (_, state) {
            if (state is GetPoliticProposalsSuccess) {
              return _buildList(state.proposals);
            } else if (state is LoadingPoliticProposals) {
              return const PoliticProposalsSkeleton();
            }
            return const ErrorContainer();
          },
        ),
      ),
    );
  }

  Widget _buildList(List<PropostaModel> propostas) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        TextTitle(PROJECTS_PARTICIPATIONS),
        const SizedBox(height: 8),
        propostas.isNotEmpty
            ? Expanded(
                child: PoliticProposalsList(propostas),
              )
            : Expanded(
                child: EmptyInfo(
                  text: NO_PROPOSALS,
                  icon: FontAwesomeIcons.folderOpen,
                ),
              ),
      ],
    );
  }
}
