import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/routing/route_names.dart';
import '../../../model/models.dart';
import '../../pages.dart';

class SearchPoliticsList extends StatelessWidget {
  SearchPoliticsList(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<SearchPoliticBloc>();
    return politicos.isNotEmpty
        ? ListView.separated(
            itemBuilder: (_, i) => ListTile(
              onTap: () => SimpleRouter.forward(
                PoliticProfilePageConnected(politicos[i].id),
                name: POLITIC_PROFILE_PAGE,
              ),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Dep. Federal - ${politicos[i].siglaPartido}',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              trailing: OutlineButton(
                child: Text(
                  bloc.isPoliticBeingFollowed(politicos[i])
                      ? 'Deixar de seguir'
                      : 'Seguir',
                  key: const ValueKey('follow-unfollow-btn'),
                  style: const TextStyle(fontSize: 10),
                ),
                textColor: bloc.isPoliticBeingFollowed(politicos[i])
                    ? Colors.red
                    : Colors.green,
                borderSide: BorderSide(
                  color: bloc.isPoliticBeingFollowed(politicos[i])
                      ? Colors.red
                      : Colors.green,
                ),
                onPressed: () => bloc.add(
                  FollowUnfollowSearchPolitic(
                    user: context.bloc<UserBloc>().user,
                    politico: politicos[i],
                  ),
                ),
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
