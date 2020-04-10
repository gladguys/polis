import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../model/models.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';
import '../../../extension/formatters.dart';
import '../../theme/main_theme.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      useStickyGroupSeparators: true,
      elements: activities,
      order: GroupedListOrder.DESC,
      groupBy: (element) => element.dataDocumento,
      groupSeparatorBuilder: (value) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Divider(
                thickness: 1,
                height: 1,
                color: theme.primaryColorLight,
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 20,
                margin: const EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  value.toString().formatDate(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      itemBuilder: (_, element) {
        if (element is DespesaModel) {
          return DespesaTileConnected(element);
        } else {
          return PropostaTileConnected(element as PropostaModel);
        }
      },
      separator: const Divider(
        height: 16,
        indent: 8,
        endIndent: 8,
      ),
    );
  }
}
