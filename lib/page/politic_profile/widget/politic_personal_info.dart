import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/models.dart';

class PoliticPersonalInfo extends StatelessWidget {
  PoliticPersonalInfo(this.politic);

  final PoliticoModel politic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: politic.urlFoto != null
                ? FancyShimmerImage(
                    imageUrl: politic.urlFoto,
                    width: 120,
                    height: 120,
                  )
                : const FaIcon(
                    FontAwesomeIcons.solidUserCircle,
                    size: 120,
                  ),
          ),
        ),
        const SizedBox(height: 12),
        Text(politic.nomeEleitoral),
        const SizedBox(height: 4),
        Text(
          '${politic.siglaPartido} - ${politic.siglaUf}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Deputado Federal',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
