import 'package:flutter/material.dart';

import '../../../enum/acao_type.dart';
import '../../../extension/formatters.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';

class UserActionsList extends StatelessWidget {
  UserActionsList(this.actions);

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, i) {
        final isFollow = actions[i].tipo == AcaoType.follow;
        return ListTile(
          leading: isFollow
              ? Icon(Icons.check, color: Colors.green)
              : Icon(Icons.close, color: Colors.red),
          title: TextRich(
            children: [
              TextSpan(
                text: isFollow ? 'Segui' : 'Deixei de seguir',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' o politico '),
              TextSpan(
                text: actions[i].nomePolitico,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: ' no dia '),
              TextSpan(
                text: actions[i].data.toString().formatDate(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: actions.length,
    );
  }
}
