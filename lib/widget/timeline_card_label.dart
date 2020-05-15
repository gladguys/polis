import 'package:flutter/material.dart';

class TimelineCardLabel extends StatelessWidget {
  TimelineCardLabel({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[200],
        ),
      ),
      height: 20,
      width: 90,
      child: child,
    );
  }
}
