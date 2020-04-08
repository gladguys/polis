import 'package:flutter/material.dart';

class CardBase extends StatelessWidget {
  const CardBase({
    @required this.slotCenter,
    this.slotLeft,
    this.slotRight,
    this.slotBottom,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.key,
    this.onTap,
  }) : assert(slotCenter != null);

  final Widget slotLeft;
  final Widget slotCenter;
  final Widget slotRight;
  final Widget slotBottom;
  final CrossAxisAlignment crossAxisAlignment;
  final Key key;
  final Function onTap;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: _buildContent(),
                  ),
                ),
                if (slotBottom != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(width: 56),
                      Expanded(child: slotBottom),
                    ],
                  )
              ],
            ),
          ),
          if (slotRight != null) slotRight,
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      key: const ValueKey('card-base-content'),
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        if (slotLeft != null) slotLeft,
        if (slotLeft != null) const SizedBox(width: 8),
        Expanded(
          child: slotCenter,
        ),
      ],
    );
  }
}
