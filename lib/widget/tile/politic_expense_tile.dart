import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../card_base.dart';
import '../image/photo_image.dart';
import '../photo.dart';
import '../text_rich.dart';

class PoliticExpenseTile extends StatelessWidget {
  PoliticExpenseTile(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: _buildLeftContent(),
      slotCenter: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopContent(context),
          _buildCenterContent(),
        ],
      ),
      slotBottom: _buildActions(context),
      onTap: () => SimpleRouter.forward(
        PostPageConnected(
          post: despesa,
          postType: PostType.DESPESA,
        ),
        name: POST_PAGE,
      ),
    );
  }

  Widget _buildLeftContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Photo(url: despesa.fotoPolitico),
          Positioned(
            right: 0,
            bottom: -10,
            child: PhotoImage(
              url: despesa.urlPartidoLogo,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 14),
            Text(
              despesa.nomePolitico,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$POLITIC · ${despesa.siglaPartido} · ${despesa.estadoPolitico}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[600]
                    : Colors.grey[300],
              ),
            ),
          ],
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
                  '${despesa.tipoDespesa.toLowerCase().removeDot()}'
                  ' $IN_THE_AMOUNT_OF ',
            ),
            TextSpan(
              text: '${despesa.valorLiquido.formatCurrency()}.',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${despesa.dataDocumento.formatDate()}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[600]
                  : Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
