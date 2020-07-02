import 'package:flutter/material.dart';

import '../../../core/domain/enum/acao_type.dart';
import '../../../core/domain/enum/post_type.dart';
import '../../../core/domain/model/acao_usuario_model.dart';
import '../../../core/extension/extensions.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/card_base.dart';
import '../../../widget/photo.dart';
import '../../../widget/text_rich.dart';

class LikeUnlikeActionTile extends StatelessWidget {
  LikeUnlikeActionTile({this.action});

  final AcaoUsuarioModel action;

  bool get isLike => action.tipo == AcaoType.like;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: Photo(url: action.urlFotoPolitico),
      slotCenter: TextRich(
        children: [
          TextSpan(
            text: isLike ? STARTED_LIKING : STOPPED_LIKING,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: action.tipoPost == PostType.PROPOSICAO
                ? ' $A_PROPOSAL '
                : ' $AN_EXPENSE ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: action.sexoPolitico == MALE
                ? ' $OF_THE_POLITIC '
                : ' $OF_THE_POLITIC_FEMALE ',
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
