import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/photo.dart';

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
              child: FancyShimmerImage(
                imageUrl: politic.urlPartidoLogo,
                height: 40,
                width: 40,
                boxFit: BoxFit.contain,
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
