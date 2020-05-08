import 'package:flutter/material.dart';

import '../../../core/keys.dart';
import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';

class FavoritesPostList extends StatelessWidget {
  FavoritesPostList(
    this.activities,
  ) : assert(activities != null);

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: timelineListKey,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: activities.length,
      itemBuilder: (_, i) {
        if (activities[i] is DespesaModel) {
          return DespesaTileConnected(activities[i]);
        } else {
          return PropostaTileConnected(activities[i] as PropostaModel);
        }
      },
      separatorBuilder: (_, i) => const Divider(
        height: 16,
        indent: 8,
        endIndent: 8,
      ),
    );
  }
}
