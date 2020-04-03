import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    @required this.children,
    this.maxLines,
    this.fontSize = 14,
    this.color = Colors.black,
  }) : assert(children != null);

  final List<InlineSpan> children;
  final int maxLines;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.clip,
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: fontSize,
          color: color,
        ),
        children: children,
      ),
    );
  }
}
