import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/utils.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import 'widget/tramitacao_list.dart';

class TramitacaoPropostaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE, withBack: true),
      body: SafeArea(
        child: BlocBuilder<TramitacaoPropostaBloc, TramitacaoPropostaState>(
          builder: (_, state) => state.join(
            mapLoadingStateToWidget,
            _mapGetTramitacaoPropostaSuccessToWidget,
            mapLoadingStateToWidget,
            mapErrorStateToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapGetTramitacaoPropostaSuccessToWidget(
      GetTramitacaoPropostaSuccess state) {
    return TramitacaoList(state.tramitacoes);
  }
}
