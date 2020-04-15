import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/blocs.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

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
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: widget.activities.length,
      itemBuilder: (_, i) {
        return Column(
          children: <Widget>[
            if (widget.activities[i] is DespesaModel)
              DespesaTileConnected(widget.activities[i])
            else
              PropostaTileConnected(widget.activities[i] as PropostaModel),
            if ((i == 2) || (i > 2 && i % 5 == 0))
              _buildAdmobBanner(),
          ],
        );
      },
      separatorBuilder: (_, i) => const Divider(
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

  Widget _buildAdmobBanner() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        color: Colors.grey[200],
        child: AdmobBanner(
          adUnitId: 'ca-app-pub-5806526425473649/1618913550',
          adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
          listener: (event, args) {},
        ),
      ),
    );
  }
}
