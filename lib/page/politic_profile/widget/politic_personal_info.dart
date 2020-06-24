import 'package:flutter/material.dart';

import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../widget/general/photo.dart';
import '../../../widget/image/logo_partido_image.dart';

class PoliticPersonalInfo extends StatelessWidget {
  PoliticPersonalInfo(this.politic);

  final PoliticoModel politic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Photo(
              url: politic.urlFoto,
              size: 120,
              borderRadius: BorderRadius.circular(60),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: LogoPartidoImage(
                logoPartido: politic.urlPartidoLogo,
                size: 40,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          politic.nomeEleitoral,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text('${politic.siglaPartido} · ${politic.siglaUf}'),
        Text(
          politic.sexo == 'M' ? POLITIC_MALE : POLITIC_FEMALE,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
