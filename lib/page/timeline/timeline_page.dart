import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/timeline/timeline_bloc.dart';
import '../../bloc/timeline/timeline_state.dart';
import '../../core/routing/route_names.dart';
import '../../widget/default_bottombar.dart';
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
              return Timeline(activities: state.activities);
            } else {
              return TimelineSkeleton();
            }
          },
        ),
      ),
    );
  }
}
