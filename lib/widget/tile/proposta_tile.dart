import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/formatters.dart';
import '../../i18n/i18n.dart';
import '../../model/models.dart';
import '../text_rich.dart';

class PropostaTile extends StatelessWidget {
  PropostaTile(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: proposta.fotoPolitico != null
                  ? Container(
                      color: Colors.white,
                      child: FancyShimmerImage(
                        imageUrl: proposta.fotoPolitico,
                        width: 48,
                        height: 48,
                        boxFit: BoxFit.contain,
                      ),
                    )
                  : FaIcon(
                      FontAwesomeIcons.solidUserCircle,
                      color: Colors.grey[400],
                      size: 48,
                    ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: <Widget>[
                      Text(
                        proposta.nomePolitico,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // TODO: trazer siglauf
                        ' · $POLITIC · ${proposta.siglaPartido} · ',
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
                      TextRich(
                        maxLines: 4,
                        children: [
                          TextSpan(
                            text: '${proposta.descricaoTipo}: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(text: '${proposta.ementa}'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextRich(
                        fontSize: 12,
                        color: Colors.grey[600],
                        children: [
                          const TextSpan(
                            text: '$TRAMITATION: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: proposta.descricaoTramitacao),
                        ],
                      ),
                      const SizedBox(height: 2),
                      TextRich(
                        fontSize: 12,
                        color: Colors.grey[600],
                        children: [
                          const TextSpan(
                            text: '$SITUATION: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: proposta.descricaoSituacao),
                        ],
                      ),
                      const SizedBox(height: 2),
                      TextRich(
                        fontSize: 12,
                        color: Colors.grey[600],
                        children: [
                          const TextSpan(
                            text: '$DATE: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${proposta.dataDocumento.formatDate()}',
                          ),
                        ],
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
      ),
    );
  }

  Widget _buildButtonActions({
    IconData icon,
    EdgeInsets paddingIcon = EdgeInsets.zero,
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
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
