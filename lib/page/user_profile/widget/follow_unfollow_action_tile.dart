import 'package:flutter/material.dart';

import '../../../core/domain/enum/acao_type.dart';
import '../../../core/domain/model/acao_usuario_model.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/card_base.dart';
import '../../../widget/photo.dart';
import '../../../widget/text_rich.dart';

class FollowUnfollowActionTile extends StatelessWidget {
  FollowUnfollowActionTile({this.action});

  final AcaoUsuarioModel action;

  bool get isFollow => action.tipo == AcaoType.follow;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: Photo(url: action.urlFotoPolitico),
      slotCenter: TextRich(
        children: [
          TextSpan(
            text: isFollow ? STARTED_FOLLOWING : STOPPED_FOLLOWING,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: action.sexoPolitico == MALE
                ? ' $THE_POLITIC '
                : ' $THE_POLITIC_FEMALE ',
          ),
          TextSpan(
            text: action.nomePolitico,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const TextSpan(text: ' $IN_DAY '),
          TextSpan(
            text: '${action.data.toString().formatDateBig()}.',
          ),
        ],
      ),
    );
  }
}
