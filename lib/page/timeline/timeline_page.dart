import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../bloc/utils.dart';
import '../../core/domain/enum/timeline_status.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
import '../pages.dart';
import '../theme/main_theme.dart';
import 'widget/timeline.dart';
import 'widget/timeline_skeleton.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE),
      body: SafeArea(
        child: BlocBuilder<TimelineBloc, TimelineState>(
          builder: (_, state) => state.join(
            _mapLoadingStateToWidget,
            _mapNoPostsAvailableToWidget,
            _mapTimelineUpdatedToWidget,
            _mapTimelineRefreshedToWidget,
            mapErrorStateToWidget,
            _mapReachedEndFetchingMoreToWidget,
            _mapLoadingStateToWidget,
          ),
        ),
      ),
    );
  }

  Widget _mapTimelineUpdatedToWidget(TimelineUpdated state) {
    return Timeline(
      activities: state.activities,
      updatesCount: state.updatesCount,
    );
  }

  Widget _mapTimelineRefreshedToWidget(TimelineRefreshed state) {
    return Timeline(
      activities: state.activities,
      updatesCount: 0,
    );
  }

  Widget _mapReachedEndFetchingMoreToWidget(ReachedEndFetchingMore state) {
    return Timeline(
      activities: state.activities,
      updatesCount: 0,
      timelineStatus: TimelineStatus.loading,
    );
  }

  Widget _mapNoPostsAvailableToWidget(NoPostsAvailable state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            FontAwesomeIcons.folderOpen,
            size: 96,
            color: theme.primaryColorLight,
          ),
          const SizedBox(height: 16),
          const Text(
            TIMELINE_IS_EMPTY,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            GO_FOLLOW_SOME_POLITICS,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 18),
          RaisedButton(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Text(FOLLOW_POLITICS),
            onPressed: () => SimpleRouter.forward(
              SearchPoliticPageConnected(),
              name: SEARCH_POLITIC_PAGE,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapLoadingStateToWidget(state) {
    return const TimelineSkeleton();
  }
}
