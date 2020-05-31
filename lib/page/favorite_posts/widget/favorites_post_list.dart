import 'package:flutter/material.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/keys.dart';
import '../../../widget/tile/favorite_despesa_tile_connected.dart';
import '../../../widget/tile/favorite_proposta_tile_connected.dart';

class FavoritesPostList extends StatelessWidget {
  FavoritesPostList(
    this.activities,
  ) : assert(activities != null);

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: timelineListKey,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: activities.length,
      itemBuilder: (_, i) {
        if (activities[i] is DespesaModel) {
          return FavoriteDespesaTileConnected(activities[i]);
        } else {
          return FavoritePropostaTileConnected(activities[i] as PropostaModel);
        }
      },
      separatorBuilder: (_, i) => const Divider(height: 1),
    );
  }
}
