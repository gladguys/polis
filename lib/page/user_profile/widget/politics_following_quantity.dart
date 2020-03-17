import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/politico_model.dart';

class PoliticsFollowingQuantity extends StatelessWidget {
  PoliticsFollowingQuantity({this.politics});

  final List<PoliticoModel> politics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          FOLLOWING,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          politics.length.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        Text(
          POLITICS,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
