import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../widget/card_base.dart';
import '../../widget/centered_loading.dart';
import '../../widget/default_bottombar.dart';

class TramitacaoPropostaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE, withBack: true),
        body: BlocBuilder<TramitacaoPropostaBloc, TramitacaoPropostaState>(
          builder: (_, state) {
            if (state is GetTramitacaoPropostaSuccess) {
              final tramitacoes = state.tramitacoes;
              final proposta = context.bloc<TramitacaoPropostaBloc>().proposta;
              return ListView.builder(
                itemBuilder: (_, i) => CardBase(
                  slotCenter: Card(
                    child: Text(
                      tramitacoes[i].descricaoTramitacao,
                      style: TextStyle(
                        color: tramitacoes[i].sequencia == proposta.sequencia
                            ? Colors.yellow
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                itemCount: tramitacoes.length,
              );
            }
            return CenteredLoading();
          },
        ));
  }
}
