import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../extension/formatters.dart';
import '../../../i18n/i18n.dart';
import '../../../model/despesa_model.dart';
import '../../../model/models.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              FontAwesomeIcons.solidUserCircle,
              size: 48,
              color: Colors.grey,
            ),
            // TODO: foto do deputado
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(24),
            //   child: Container(
            //     color: Colors.white,
            //     child: FancyShimmerImage(
            //       imageUrl: despesa.urlFoto,
            //       width: 48,
            //       height: 48,
            //       boxFit: BoxFit.contain,
            //     ),
            //   ),
            // ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: <Widget>[
                    Text(
                      despesa.nomePolitico,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' · ${despesa.siglaPartido} · $POLITIC',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 4),
                    Text(
                      '${despesa.tipoAtividade.capitalizeUpperCase()}'
                      ' $WITH '
                      '${despesa.tipoDespesa.toLowerCase()}'
                      ' $IN_THE_AMOUNT_OF '
                      '${despesa.valorLiquido.formatCurrency()}.',
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${despesa.dataDocumento.formatDate()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildButtonActions(
                      icon: FontAwesomeIcons.thumbsUp,
                      paddingIcon: const EdgeInsets.only(bottom: 3),
                    ),
                    const SizedBox(width: 16),
                    _buildButtonActions(
                      icon: FontAwesomeIcons.thumbsDown,
                    ),
                    const SizedBox(width: 16),
                    _buildButtonActions(
                      icon: FontAwesomeIcons.comment,
                      paddingIcon: const EdgeInsets.only(bottom: 2),
                    ),
                    const Spacer(flex: 1),
                    _buildButtonActions(
                      icon: FontAwesomeIcons.bookmark,
                      paddingIcon: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonActions({
    IconData icon,
    EdgeInsets paddingIcon = EdgeInsets.zero,
    String text,
    Function onPressed,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: <Widget>[
              Padding(
                padding: paddingIcon,
                child: Icon(icon, size: 16),
              ),
              if (text != null)
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
