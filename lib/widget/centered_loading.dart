import 'package:flutter/material.dart';

class CenteredLoading extends StatefulWidget {
  @override
  _CenteredLoadingState createState() => _CenteredLoadingState();
}

class _CenteredLoadingState extends State<CenteredLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
