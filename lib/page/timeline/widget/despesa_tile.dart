import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/models.dart';
import '../../../i18n/i18n.dart';
import '../../../model/despesa_model.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa);

  final DespesaModel despesa;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FancyShimmerImage(
              // imageUrl: despesa.,
              imageUrl:
                  'https://www.camara.leg.br/internet/deputado/bandep/98057.jpg',
              width: 40,
              height: 40,
              boxFit: BoxFit.cover,
            ),
          ),
          Text(
            '${despesa.siglaPartido} · CE', //TODO: UF do deputado
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
      title: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text(
                despesa.nomePolitico,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' · Dep. Federal', //TODO: cargo do político
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${despesa.tipoAtividade} $WITH ${despesa.tipoDespesa} '
            '$IN_THE_AMOUNT_OF ${despesa.valorLiquido}.',
          ),
          const SizedBox(height: 4),
          Text('${despesa.dataDocumento}'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Icon(FontAwesomeIcons.thumbsUp),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(FontAwesomeIcons.thumbsDown),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(FontAwesomeIcons.comment),
                onPressed: () {},
              ),
              const Spacer(flex: 2),
              FlatButton(
                child: Icon(FontAwesomeIcons.bookmark),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
