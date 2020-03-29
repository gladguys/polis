import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/timeline/timeline_bloc.dart';
import '../../repository/concrete/repositories.dart';
import '../page_connected.dart';
import '../pages.dart';

class TimelinePageConnected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageConnected<TimelineBloc>(
      bloc: TimelineBloc(
        repository: context.repository<FirebaseTimelineRepository>(),
      )..add(FetchUserTimeline(context.bloc<UserBloc>().user.userId)),
      page: TimelinePage(),
    );
  }
}
