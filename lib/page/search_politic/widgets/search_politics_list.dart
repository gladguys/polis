import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/politico_model.dart';

class SearchPoliticsList extends StatelessWidget {
  SearchPoliticsList(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return politicos.isNotEmpty
        ? ListView.separated(
            itemBuilder: (_, i) => ListTile(
              key: ValueKey(politicos[i].id),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: politicos[i].urlFoto != null
                    ? FancyShimmerImage(
                        imageUrl: politicos[i].urlFoto,
                        width: 50,
                        height: 50,
                      )
                    : FaIcon(
                        FontAwesomeIcons.solidUserCircle,
                        color: Theme.of(context).accentColor.withOpacity(.6),
                        size: 50,
                      ),
              ),
              dense: true,
              title: Text(
                politicos[i].nomeEleitoral,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Dep. Federal',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              trailing: OutlineButton(
                child: const Text(
                  'Seguir',
                  key: ValueKey('follow-unfollow-btn'),
                  style: TextStyle(fontSize: 10),
                ),
                textColor: Colors.green,
                borderSide: BorderSide(color: Colors.green),
                onPressed: () => {},
              ),
            ),
            separatorBuilder: (_, i) => const Divider(),
            itemCount: politicos.length,
          )
        : const Center(
            child: Text('Nenhum político encontrado com os filtros escolhidos'),
          );
  }
}
