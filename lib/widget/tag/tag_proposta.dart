import 'package:flutter/material.dart';

import '../../core/domain/model/models.dart';
import '../../core/i18n/i18n.dart';
import '../general/timeline_card_label.dart';

class TagProposta extends StatelessWidget {
  TagProposta(this.proposta, {this.showStatus = true});

  final PropostaModel proposta;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimelineCardLabel(
          child: _getText(),
        ),
      ],
    );
  }

  Widget _getText() {
    if (showStatus) {
      return proposta.foiAtualizada ?? false
          ? Text(
              UPDATE.toUpperCase(),
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.yellow[800],
              ),
            )
          : Text(
              NEW.toUpperCase(),
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            );
    } else {
      return Text(
        PROPOSAL.toUpperCase(),
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      );
    }
  }
}
