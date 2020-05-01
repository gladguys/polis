import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../i18n/message.dart';

class ErrorContainer extends StatefulWidget {
  @override
  _ErrorContainerState createState() => _ErrorContainerState();
}

class _ErrorContainerState extends State<ErrorContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 8,
              child: FlareActor(
                '$kAnimationsPath/app_error.flr',
                animation: 'error',
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              flex: 1,
              child: Text(
                OH_NO,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  UNEXPECTED_ERROR_HAPPENED,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
