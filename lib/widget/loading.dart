import 'package:flare_loading/flare_loading.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
