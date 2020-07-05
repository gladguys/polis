import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimelineTile extends StatelessWidget {
  const TimelineTile({
    @required this.child,
    this.padding = const EdgeInsets.only(left: 12, bottom: 16),
    this.isFirst = false,
    this.isLast = false,
  }) : assert(child != null);

  final EdgeInsets padding;
  final Widget child;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 13),
          padding: padding,
          decoration: BoxDecoration(
            border: Border(
              left: isLast
                  ? BorderSide.none
                  : BorderSide(color: Colors.grey[350]),
            ),
          ),
          child: child,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: FaIcon(
            FontAwesomeIcons.solidCircle,
            size: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
