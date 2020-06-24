import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../bloc/blocs.dart';
import '../../../core/constants.dart';
import '../../../core/domain/model/despesa_model.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/general/not_found.dart';
import '../../../widget/tile/politic_despesa_tile_connected.dart';
import '../../../widget/tile/politic_proposta_tile_connected.dart';
import '../../theme/main_theme.dart';

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
  bool get scrollPositionPassedLimit =>
      currentPosition >= maxScrollPosition - kBottomOffsetToLoadMore;
  PoliticProfileBloc get politicProfileBloc =>
      context.bloc<PoliticProfileBloc>();

  bool hasLoadedAlready;
  int currentActivitiesLength;
  int oldActivitiesLength;

  void _onScrollListener() {
    if (scrollPositionPassedLimit && isPositionInRange && !hasLoadedAlready) {
      politicProfileBloc.add(GetMoreActivities(politicProfileBloc.politico.id));
      hasLoadedAlready = true;
    }
  }

  @override
  void initState() {
    hasLoadedAlready = false;
    currentActivitiesLength = widget.lastActivities.length;
    oldActivitiesLength = widget.lastActivities.length;

    scrollController = ScrollController();
    scrollController.addListener(_onScrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(PoliticActivities oldWidget) {
    currentActivitiesLength = widget.lastActivities.length;

    if (oldActivitiesLength != currentActivitiesLength) {
      hasLoadedAlready = false;
      oldActivitiesLength = widget.lastActivities.length;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lastActivities.isNotEmpty) {
      return Container(
        height: context.screenHeight - 140,
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          itemBuilder: (_, i) {
            final activity = widget.lastActivities[i];
            if (i == widget.lastActivities.length - 1) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SpinKitThreeBounce(
                  color: theme.primaryColor,
                  size: 32,
                ),
              );
            }

            if (activity is DespesaModel) {
              return PoliticDespesaTileConnected(
                activity,
                clickableImage: false,
              );
            } else {
              final proposicao = activity as PropostaModel;
              return PoliticPropostaTileConnected(
                proposicao,
                clickableImage: false,
              );
            }
          },
          itemCount: widget.lastActivities.length,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 64),
        child: NotFound(msg: NO_ACTIVITY_FOR_POLITIC),
      );
    }
  }
}
