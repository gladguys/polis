import 'package:flare_loading/flare_loading.dart';
import 'package:flutter/material.dart';

class CenteredLoading extends StatefulWidget {
  @override
  _CenteredLoadingState createState() => _CenteredLoadingState();
}

class _CenteredLoadingState extends State<CenteredLoading> {
  @override
  Widget build(BuildContext context) {
    return FlareLoading(
      name: 'assets/animations/PolisLoading.flr',
      startAnimation: 'Loading',
      loopAnimation: 'Loading',
      onSuccess: (data) {},
      onError: (e, stacktrace) {},
    );
  }
}
