import 'package:flutter/material.dart';

import '../../../enum/acao_type.dart';
import '../../../extension/formatters.dart';
import '../../../extension/media_query_extensions.dart';
import '../../../i18n/label.dart';
import '../../../model/models.dart';
import '../../../widget/card_base.dart';
import '../../../widget/photo.dart';
import '../../../widget/text_rich.dart';

class UserActionsList extends StatelessWidget {
  UserActionsList(this.actions);

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (context.screenHeight * 0.97) - 50 - 72,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 4, bottom: 24),
        itemCount: actions.length,
        separatorBuilder: (_, i) => const Divider(indent: 8, endIndent: 8),
        itemBuilder: (_, i) {
          final isFollow = actions[i].tipo == AcaoType.follow;
          return CardBase(
            crossAxisAlignment: CrossAxisAlignment.center,
            slotLeft: Photo(url: actions[i].urlFotoPolitico),
            slotCenter: TextRich(
              children: [
                TextSpan(
                  text: isFollow ? STARTED_FOLLOWING : STOPPED_FOLLOWING,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: actions[i].sexoPolitico == 'M'
                      ? ' $THE_POLITIC '
                      : ' $THE_POLITIC_FEMALE ',
                ),
                TextSpan(
                  text: actions[i].nomePolitico,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(text: ' $IN_DAY '),
                TextSpan(
                  text: '${actions[i].data.toString().formatDateBig()}.',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
