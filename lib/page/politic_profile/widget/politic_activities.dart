import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../i18n/i18n.dart';
import '../../../model/despesa_model.dart';
import '../../../model/models.dart';
import '../../../widget/not_found.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class PoliticActivities extends StatefulWidget {
  PoliticActivities(this.lastActivities) : assert(lastActivities != null);

  final List<dynamic> lastActivities;

  @override
  _PoliticActivitiesState createState() => _PoliticActivitiesState();
}

class _PoliticActivitiesState extends State<PoliticActivities> {
  ScrollController scrollController;

  double get currentPosition => scrollController.offset;
  double get maxScrollPosition => scrollController.position.maxScrollExtent;
  bool get isPositionInRange => !scrollController.position.outOfRange;
  PoliticProfileBloc get politicProfileBloc =>
      context.bloc<PoliticProfileBloc>();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScrollListener);
    super.initState();
  }

  void _onScrollListener() {
    if (currentPosition >= maxScrollPosition && isPositionInRange) {
      politicProfileBloc.add(GetMoreActivities(politicProfileBloc.politico.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lastActivities.isNotEmpty) {
      return Container(
        height: (MediaQuery.of(context).size.height * 0.97) - 50 - 72,
        child: ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          separatorBuilder: (_, i) => const Divider(indent: 8, endIndent: 8),
          itemBuilder: (_, i) {
            final activity = widget.lastActivities[i];
            if (activity is DespesaModel) {
              return DespesaTileConnected(activity, clickableImage: false);
            } else {
              final proposicao = activity as PropostaModel;
              return PropostaTileConnected(proposicao, clickableImage: false);
            }
          },
          itemCount: widget.lastActivities.length,
        ),
      );
    } else {
      return NotFound(msg: NO_ACTIVITY_FOR_POLITIC);
    }
  }
}
