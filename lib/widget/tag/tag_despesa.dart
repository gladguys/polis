import 'package:flutter/material.dart';

import '../../core/i18n/i18n.dart';
import '../general/timeline_card_label.dart';

class TagDespesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimelineCardLabel(
          child: Text(
            EXPENSE.toUpperCase(),
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
