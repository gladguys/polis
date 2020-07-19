import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  TextRich({
    @required this.children,
    this.maxLines,
    this.fontSize = 14,
    this.color,
  })  : assert(children != null),
        assert(children.isNotEmpty);

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
          color: color ?? Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
        children: children,
      ),
    );
  }
}
