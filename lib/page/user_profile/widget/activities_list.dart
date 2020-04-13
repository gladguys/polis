import 'package:flutter/material.dart';

import '../../../enum/acao_type.dart';
import '../../../extension/formatters.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';

class ActivitiesList extends StatelessWidget {
  ActivitiesList(this.activities);

  final List<AcaoUsuarioModel> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, i) {
        final isFollow = activities[i].tipo == AcaoType.follow;
        return ListTile(
          leading: isFollow
              ? Icon(Icons.check, color: Colors.green)
              : Icon(Icons.close, color: Colors.red),
          title: TextRich(
            children: [
              TextSpan(
                text: isFollow ? 'Segui' : 'Deixei de seguir',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' o politico '),
              TextSpan(
                text: activities[i].nomePolitico,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' no dia '),
              TextSpan(
                text: activities[i].data.toString().formatDate(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: activities.length,
    );
  }
}
