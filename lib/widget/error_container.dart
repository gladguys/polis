import 'package:flare_loading/flare_loading.dart';
import 'package:flutter/material.dart';

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
            Expanded(
              flex: 8,
              child: FlareLoading(
                name: 'assets/animations/app_error.flr',
                startAnimation: 'error',
                loopAnimation: 'error',
                onSuccess: (data) {},
                onError: (e, stacktrace) {},
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
