import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({
    @required this.label,
    this.value,
    this.emptyValue,
  }) : assert(label != null);

  final String label, value, emptyValue;

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
          Text(value)
        else
          Text(
            emptyValue ?? '-',
            style: const TextStyle(color: Colors.grey),
          ),
      ],
    );
  }
}
