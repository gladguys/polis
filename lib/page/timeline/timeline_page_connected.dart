import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';
import '../../bloc/timeline/timeline_bloc.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/services.dart';
import '../page_connected.dart';
import '../pages.dart';

class TimelinePageConnected extends StatefulWidget {
  TimelinePageConnected({@required this.appUpdateService})
      : assert(appUpdateService != null);

  final AppUpdateService appUpdateService;

  @override
  _TimelinePageConnectedState createState() => _TimelinePageConnectedState();
}

class _TimelinePageConnectedState extends State<TimelinePageConnected> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    print(context.bloc<UserBloc>().user);
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    return PageConnected<TimelineBloc>(
      bloc: TimelineBloc(
        repository: context.repository<FirebaseTimelineRepository>(),
      )..add(FetchUserTimeline(context.bloc<UserBloc>().user.userId)),
      page: TimelinePage(),
    );
  }
}
