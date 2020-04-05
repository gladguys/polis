import 'package:flutter/material.dart';

import '../../../enum/post_type.dart';
import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile.dart';
import '../../../widget/tile/proposta_tile.dart';
import 'goto_post_gesture_detector.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 32),
      itemBuilder: (_, i) {
        if (activities[i] is DespesaModel) {
          final despesa = activities[i] as DespesaModel;
          return GoToPostGestureDetector(
            post: despesa,
            postType: PostType.DESPESA,
            tile: DespesaTile(despesa),
          );
        } else {
          final proposta = activities[i] as PropostaModel;
          return GoToPostGestureDetector(
            post: proposta,
            postType: PostType.PROPOSICAO,
            tile: PropostaTile(proposta),
          );
        }
      },
      separatorBuilder: (_, i) => const Divider(
        height: 1,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: activities.length,
    );
  }
}
