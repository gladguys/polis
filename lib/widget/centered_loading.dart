import 'package:flutter/material.dart';

class CenteredLoading extends StatelessWidget {
  const CenteredLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
