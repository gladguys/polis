import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';

import '../../../bloc/blocs.dart';
import '../../../core/keys.dart';
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
  NativeAdmobController nativeAdmobController;

  int get updatesCount => widget.updatesCount;
  TimelineBloc get timelineBloc => context.bloc<TimelineBloc>();
  String get userId => context.bloc<UserBloc>().user.userId;

  @override
  void initState() {
    nativeAdmobController = NativeAdmobController();
    super.initState();
  }

  @override
  void dispose() {
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
    return IncrementallyLoadingListView(
      key: timelineListKey,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: () => widget.activities.length,
      hasMore: () => true,
      loadMore: () async => timelineBloc.add(FetchMorePosts(userId)),
      loadMoreOffsetFromBottom: 3,
      itemBuilder: (_, i) => Column(
        children: <Widget>[
          if (widget.activities[i] is DespesaModel)
            DespesaTileConnected(widget.activities[i])
          else
            PropostaTileConnected(widget.activities[i] as PropostaModel),
          const Divider(height: 16, indent: 8, endIndent: 8),
          if ((i == 2) || (i > 2 && i % 5 == 0)) _buildAdmobBanner(),
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

  Widget _buildAdmobBanner() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 24),
            color: Colors.grey[200],
            child: NativeAdmob(
              loading: Container(),
              adUnitID: 'ca-app-pub-5806526425473649/2966344739',
              controller: nativeAdmobController,
              type: NativeAdmobType.banner,
            ),
          ),
        ),
        const Divider(height: 16, indent: 8, endIndent: 8),
      ],
    );
  }
}
