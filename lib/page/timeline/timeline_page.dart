import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../i18n/i18n.dart';
import '../../widget/default_bottombar.dart';
import '../pages.dart';
import 'widget/timeline.dart';
import 'widget/timeline_skeleton.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottombar(TIMELINE_PAGE),
      body: SafeArea(
        child: BlocBuilder<TimelineBloc, TimelineState>(
          builder: (_, state) {
            if (state is TimelineUpdated) {
              return Timeline(
                activities: state.activities,
                updatesCount: state.updatesCount,
              );
            } else if (state is ReachedEndFetchingMore) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Timeline(
                      activities: state.activities,
                      updatesCount: 0,
                    ),
                  ),
                  const SpinKitCircle(
                    color: Colors.amber,
                    size: 50,
                  ),
                ],
              );
            } else if (state is NoPostsAvailable) {
              return Container(
                  child: Padding(
                padding: const EdgeInsets.all(48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(AntDesign.unknowfile1, size: 48),
                    const SizedBox(height: 22),
                    const Text(
                      TIMELINE_IS_EMPTY,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      GO_FOLLOW_SOME_POLITICS,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 18),
                    RaisedButton(
                      color: Colors.amber,
                      child: const Text(
                        FOLLOW_POLITICS,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () => SimpleRouter.forward(
                        SearchPoliticPageConnected(),
                        name: SEARCH_POLITIC_PAGE,
                      ),
                    ),
                  ],
                ),
              ));
            } else {
              return TimelineSkeleton();
            }
          },
        ),
      ),
    );
  }
}
