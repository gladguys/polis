import 'package:flutter/material.dart';

class CardBase extends StatelessWidget {
  const CardBase({
    @required this.slotCenter,
    @required this.onTap,
    this.key,
    this.slotLeft,
    this.slotRight,
    this.slotBottom,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  })  : assert(slotCenter != null),
        assert(onTap != null);

  final Widget slotLeft;
  final Widget slotCenter;
  final Widget slotRight;
  final Widget slotBottom;
  final CrossAxisAlignment crossAxisAlignment;
  final Function onTap;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      key: key,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _buildContent(),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        if (slotLeft != null) slotLeft,
        if (slotLeft != null) const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              slotCenter,
              if (slotBottom != null) slotBottom,
            ],
          ),
        ),
        if (slotRight != null) slotRight,
      ],
    );
  }
}