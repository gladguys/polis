import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/text_rich.dart';
import '../../../widget/tile/despesa_tile_connected.dart';
import '../../../widget/tile/proposta_tile_connected.dart';
import '../../../extension/formatters.dart';
import '../../theme/main_theme.dart';

class Timeline extends StatelessWidget {
  Timeline({this.activities});

  final List<dynamic> activities;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        _buildList(),
        Positioned(
          top: 32,
          child: _buildUpdateButton(),
        ),
      ],
    );
  }

  Widget _buildList() {
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

  Widget _buildUpdateButton() {
    return Container(
      height: 34,
      width: 200,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.syncAlt,
              size: 18,
            ),
            const SizedBox(width: 8),
            TextRich(
              fontSize: 14,
              children: <InlineSpan>[
                TextSpan(
                  text: '10', // TODO: trazer qtd de atualizações
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' $NEW_ACTIVITIES',
                ),
              ],
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
