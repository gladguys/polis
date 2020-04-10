import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../bloc/blocs.dart';
import '../../../extension/formatters.dart';
import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';
import '../../theme/main_theme.dart';

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
    return GroupedListView(
      controller: scrollController,
      useStickyGroupSeparators: true,
      elements: widget.activities,
      order: GroupedListOrder.DESC,
      groupBy: (element) => element.dataDocumento,
      groupSeparatorBuilder: (value) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Divider(
                thickness: 1,
                height: 1,
                color: theme.primaryColorLight,
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 20,
                margin: const EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value.toString().formatDate(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      itemBuilder: (_, element) {
        if (element is DespesaModel) {
          return DespesaTileConnected(element);
        } else {
          return PropostaTileConnected(element as PropostaModel);
        }
      },
      separator: const Divider(
        height: 16,
        indent: 8,
        endIndent: 8,
      ),
    );
  }
}
