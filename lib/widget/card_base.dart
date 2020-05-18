import 'package:flutter/material.dart';

import '../core/keys.dart';

class CardBase extends StatelessWidget {
  const CardBase({
    @required this.slotCenter,
    this.slotLeft,
    this.slotRight,
    this.slotBottom,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.paddingSlotCenter,
    this.withIndent = true,
    this.key,
    this.onTap,
  }) : assert(slotCenter != null);

  final Widget slotLeft;
  final Widget slotCenter;
  final Widget slotRight;
  final Widget slotBottom;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets paddingSlotCenter;
  final bool withIndent;
  final Key key;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        key: key,
        child: Row(
          children: <Widget>[
            if (withIndent) const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: paddingSlotCenter ??
                          const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
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
            if (withIndent) const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      key: cardBaseContentKey,
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
