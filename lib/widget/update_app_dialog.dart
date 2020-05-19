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
    return CupertinoAlertDialog(
      content: Container(
        width: 200,
        height: 200,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                UPDATE_APP,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                UPDATE_APP_DESCRIPTION,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const FlatButton(
                  onPressed: SimpleRouter.back,
                  child: Text(
                    NO,
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
                RaisedButton(
                  shape: const ContinuousRectangleBorder(),
                  onPressed: () async => appUpdateService.startFlexibleUpdate(),
                  child: Text(
                    ACTION_UPDATE,
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
