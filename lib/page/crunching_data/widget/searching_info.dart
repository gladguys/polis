import 'package:flutter/material.dart';

class SearchingInfo extends StatelessWidget {
  SearchingInfo({@required this.icon}) : assert(icon != null);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Icon(icon, size: 180),
      ),
    );
  }
}
