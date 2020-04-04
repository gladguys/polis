import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/formatters.dart';
import '../../i18n/i18n.dart';
import '../../model/despesa_model.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo_politic.dart';
import '../text_rich.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: PhotoPolitic(urlPhoto: despesa.fotoPolitico),
      slotCenter: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopContent(),
          _buildCenterContent(),
        ],
      ),
      slotBottom: _buildActions(),
      onTap: () {},
    );
  }

  Widget _buildTopContent() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      children: <Widget>[
        Text(
          despesa.nomePolitico,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          // TODO: trazer siglauf
          ' · $POLITIC · ${despesa.siglaPartido} · ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        TextRich(
          children: [
            TextSpan(
                text: '${despesa.tipoAtividade.capitalizeUpperCase()}'
                    ' $WITH '
                    '${despesa.tipoDespesa.toLowerCase()}'
                    ' $IN_THE_AMOUNT_OF '),
            TextSpan(
              text: '${despesa.valorLiquido.formatCurrency()}.',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${despesa.dataDocumento.formatDate()}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ButtonActionCard(
          icon: FontAwesomeIcons.thumbsUp,
          paddingIcon: const EdgeInsets.only(bottom: 3),
          onTap: () {},
        ),
        const SizedBox(width: 16),
        ButtonActionCard(
          icon: FontAwesomeIcons.thumbsDown,
          onTap: () {},
        ),
        const SizedBox(width: 16),
        ButtonActionCard(
          icon: FontAwesomeIcons.comment,
          paddingIcon: const EdgeInsets.only(bottom: 2),
          onTap: () {},
        ),
        const Spacer(flex: 1),
        ButtonActionCard(
          icon: FontAwesomeIcons.bookmark,
          paddingIcon: const EdgeInsets.symmetric(horizontal: 16),
          onTap: () {},
        ),
      ],
    );
  }
}
