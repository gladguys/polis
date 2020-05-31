import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/blocs.dart';
import '../../../core/constants.dart';
import '../../../core/domain/enum/timeline_status.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../widget/ad/timeline_ad_banner.dart';
import '../../../widget/text_rich.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';
import '../../theme/main_theme.dart';

class Timeline extends StatefulWidget {
  Timeline({
    @required this.activities,
    @required this.updatesCount,
    this.timelineStatus = TimelineStatus.loaded,
  })  : assert(activities != null),
        assert(updatesCount != null);

  final List<dynamic> activities;
  final int updatesCount;
  final timelineStatus;

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ScrollController scrollController;
  NativeAdmobController nativeAdmobController;

  double get currentPosition => scrollController.offset;
  double get maxScrollPosition => scrollController.position.maxScrollExtent;
  bool get isPositionInRange => !scrollController.position.outOfRange;
  bool get scrollPositionPassedLimit =>
      currentPosition >= maxScrollPosition - kBottomOffsetToLoadMore;
  int get updatesCount => widget.updatesCount;
  TimelineBloc get timelineBloc => context.bloc<TimelineBloc>();
  double get timelineCurrentPosition => timelineBloc.timelineCurrentPosition;
  String get userId => context.bloc<UserBloc>().user.userId;

  bool hasLoadedAlready;
  int currentActivitiesLength;
  int oldActivitiesLength;

  void _onScrollListener() {
    if (scrollPositionPassedLimit && isPositionInRange && !hasLoadedAlready) {
      timelineBloc.add(FetchMorePosts(userId, currentPosition));
      hasLoadedAlready = true;
    }
  }

  @override
  void initState() {
    hasLoadedAlready = false;
    currentActivitiesLength = widget.activities.length;
    oldActivitiesLength = widget.activities.length;

    scrollController = ScrollController(
      initialScrollOffset: timelineCurrentPosition,
    );
    scrollController.addListener(_onScrollListener);
    nativeAdmobController = NativeAdmobController();
    super.initState();
  }

  @override
  void didUpdateWidget(Timeline oldWidget) {
    currentActivitiesLength = widget.activities.length;

    if (widget.timelineStatus == TimelineStatus.loaded &&
        oldActivitiesLength != currentActivitiesLength) {
      hasLoadedAlready = false;
      oldActivitiesLength = widget.activities.length;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    scrollController.dispose();
    nativeAdmobController.dispose();
    super.dispose();
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
    return ListView.builder(
      controller: scrollController,
      key: timelineListKey,
      padding: const EdgeInsets.only(top: 2, bottom: 16),
      itemCount: widget.activities.length,
      itemBuilder: (_, i) => Column(
        children: <Widget>[
          if (widget.activities[i] is DespesaModel)
            DespesaTileConnected(widget.activities[i])
          else
            PropostaTileConnected(widget.activities[i] as PropostaModel),
          if ((i == 4) || (i > 10 && i % 10 == 0))
            TimelineAdBanner(nativeAdmobController),
          if (i == widget.activities.length - 1 &&
              widget.timelineStatus == TimelineStatus.loading)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SpinKitThreeBounce(
                color: theme.primaryColor,
                size: 32,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return RaisedButton(
      key: updateTimelineButtonKey,
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
              TextSpan(
                text: updatesCount > 1 ? ' $NEW_ACTIVITIES' : ' $NEW_ACTIVITY',
              ),
            ],
          ),
        ],
      ),
      onPressed: () => timelineBloc.add(ReloadTimeline(userId)),
    );
  }
}
