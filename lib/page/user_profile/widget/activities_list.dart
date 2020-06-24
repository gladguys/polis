import 'package:flutter/material.dart';

import '../../../core/domain/enum/acao_type.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/label.dart';
import '../../../widget/general/card_base.dart';
import '../../../widget/general/photo.dart';
import '../../../widget/general/text_rich.dart';

class UserActionsList extends StatelessWidget {
  UserActionsList(this.actions);

  final List<AcaoUsuarioModel> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight - 140,
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
