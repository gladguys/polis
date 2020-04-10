import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class Timeline extends StatefulWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ScrollController scrollController;

  double get currentPosition => scrollController.offset;
  double get maxScrollPosition => scrollController.position.maxScrollExtent;
  bool get isPositionInRange => !scrollController.position.outOfRange;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    super.dispose();
  }

  void _onScrollListener() {
    if (currentPosition >= maxScrollPosition && isPositionInRange) {
      final userId = context.bloc<UserBloc>().user.userId;
      context.bloc<TimelineBloc>().add(FetchMorePosts(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: UniqueKey(),
      controller: scrollController,
      padding: const EdgeInsets.only(top: 8),
      itemBuilder: (_, i) {
        if (widget.activities[i] is DespesaModel) {
          return DespesaTileConnected(widget.activities[i] as DespesaModel);
        } else {
          return PropostaTileConnected(widget.activities[i] as PropostaModel);
        }
      },
      separatorBuilder: (_, i) => const Divider(
        height: 16,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: widget.activities.length,
    );
  }
}
