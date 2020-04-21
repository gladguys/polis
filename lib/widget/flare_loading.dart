import 'package:flare_loading/flare_loading.dart';
import 'package:flutter/material.dart';

class LoadingFlare extends StatefulWidget {
  @override
  _LoadingFlareState createState() => _LoadingFlareState();
}

class _LoadingFlareState extends State<LoadingFlare> {
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
