import 'package:flutter/material.dart';

class TimelineCardLabel extends StatelessWidget {
  TimelineCardLabel({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(6),
        ),
      ),
      child: child,
    );
  }
}
