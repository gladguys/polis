import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../bloc/blocs.dart';
import '../../../extension/formatters.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';
import '../../theme/main_theme.dart';

class Timeline extends StatefulWidget {
  Timeline({@required this.activities, @required this.updatesCount})
      : assert(activities != null),
        assert(updatesCount != null);

  final List<dynamic> activities;
  final int updatesCount;

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ScrollController scrollController;

  double get currentPosition => scrollController.offset;
  double get maxScrollPosition => scrollController.position.maxScrollExtent;
  bool get isPositionInRange => !scrollController.position.outOfRange;
  int get updatesCount => widget.updatesCount;
  TimelineBloc get timelineBloc => context.bloc<TimelineBloc>();
  String get userId => context.bloc<UserBloc>().user.userId;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScrollListener() {
    if (currentPosition >= maxScrollPosition && isPositionInRange) {
      timelineBloc.add(FetchMorePosts(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        _buildList(),
        updatesCount > 0
            ? Positioned(
                top: 32,
                child: _buildUpdateButton(),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildList() {
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

  Widget _buildUpdateButton() {
    return RaisedButton(
      key: const ValueKey('update-timeline-btn'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.syncAlt,
            size: 18,
          ),
          const SizedBox(width: 8),
          TextRich(
            fontSize: 14,
            children: <InlineSpan>[
              TextSpan(
                text: updatesCount.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' $NEW_ACTIVITIES',
              ),
            ],
          ),
        ],
      ),
      onPressed: () => timelineBloc.add(ReloadTimeline(userId)),
    );
  }
}
