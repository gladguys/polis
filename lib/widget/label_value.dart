import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({
    @required this.label,
    this.value,
    this.emptyValue,
    this.isDotted = false,
    this.maxLines,
  }) : assert(label != null);

  final String label, value, emptyValue;
  final bool isDotted;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        if (value != null && value.isNotEmpty)
          if (maxLines != null)
            Text(
              value,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: isDotted
                  ? const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                    )
                  : null,
            )
          else
            Text(
              value,
              style: isDotted
                  ? const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                    )
                  : null,
            )
        else
          Text(
            emptyValue ?? '-',
            style: const TextStyle(color: Colors.grey),
          ),
      ],
    );
  }
}
