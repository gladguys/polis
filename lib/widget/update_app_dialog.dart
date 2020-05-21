import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../core/service/services.dart';
import '../i18n/i18n.dart';

class UpdateAppDialog extends StatelessWidget {
  UpdateAppDialog({@required this.appUpdateService})
      : assert(appUpdateService != null);

  final AppUpdateService appUpdateService;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(UPDATE_APP),
      content: Container(
        width: 200,
        height: 110,
        child: const Text(UPDATE_APP_DESCRIPTION),
      ),
      actions: <Widget>[
        const FlatButton(
          child: Text(AFTER),
          textColor: Colors.black,
          highlightColor: Colors.black12,
          splashColor: Colors.black26,
          onPressed: SimpleRouter.back,
        ),
        RaisedButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          onPressed: () async => appUpdateService.startFlexibleUpdate(),
          child: const Text(ACTION_UPDATE),
        ),
      ],
    );
  }
}
