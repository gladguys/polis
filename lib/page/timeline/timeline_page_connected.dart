import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits.dart';
import '../../core/repository/concrete/repositories.dart';
import '../../core/service/locator.dart';
import '../../core/service/services.dart';
import '../../widget/update_app_dialog.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appUpdateInfo = await widget.appUpdateService.checkForUpdate();
      if (appUpdateInfo.updateAvailable) {
        showDialog(
          context: context,
          builder: (_) => UpdateAppDialog(
            appUpdateService: G<AppUpdateService>(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageConnected<TimelineCubit>(
      bloc: TimelineCubit(
        repository: context.repository<FirebaseTimelineRepository>(),
      )..fetchUserTimeline(context.bloc<UserCubit>().user.userId),
      page: TimelinePage(),
    );
  }
}
