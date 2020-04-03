import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/routing/route_names.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../pages.dart';

class SearchPoliticsList extends StatelessWidget {
  SearchPoliticsList(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return politicos.isNotEmpty
        ? _buildList(context)
        : const Center(
            child: Text(NO_RESULTS_FROM_SEARCH),
          );
  }

  Widget _buildList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, i) => const Divider(
        height: 1,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: politicos.length,
      itemBuilder: (_, i) => _buildCard(context, politicos[i]),
    );
  }

  Widget _buildCard(BuildContext context, PoliticoModel politico) {
    return CardBase(
      key: ValueKey(politico.id),
      content: _buildCardContent(context, politico),
      rightContent: _buildButtonFollow(context, politico),
      onTap: () => SimpleRouter.forward(
        PoliticProfilePageConnected(politico.id),
        name: POLITIC_PROFILE_PAGE,
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, PoliticoModel politico) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: politico.urlFoto != null
              ? Container(
                  color: Colors.white,
                  child: FancyShimmerImage(
                    imageUrl: politico.urlFoto,
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
          child: Wrap(
            direction: Axis.vertical,
            spacing: 2,
            children: <Widget>[
              Text(
                politico.nomeEleitoral,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$POLITIC · ${politico.siglaPartido}'
                ' · ${politico.siglaUf}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonFollow(BuildContext context, PoliticoModel politico) {
    final bloc = context.bloc<SearchPoliticBloc>();
    final color =
        bloc.isPoliticBeingFollowed(politico) ? Colors.red : Colors.green;

    return Container(
      width: 110,
      height: 22,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        child: Text(
          bloc.isPoliticBeingFollowed(politico) ? STOP_FOLLOWING : FOLLOW,
          key: const ValueKey('follow-unfollow-btn'),
          style: const TextStyle(fontSize: 11),
        ),
        textColor: color,
        borderSide: BorderSide(
          color: color
        ),
        highlightedBorderColor: color,
        onPressed: () => bloc.add(
          FollowUnfollowSearchPolitic(
            user: context.bloc<UserBloc>().user,
            politico: politico,
          ),
        ),
      ),
    );
  }
}

class CardBase extends StatelessWidget {
  const CardBase({
    @required this.content,
    @required this.onTap,
    this.key,
    this.rightContent,
  })  : assert(content != null),
        assert(onTap != null);

  final Widget content;
  final Function onTap;
  final Key key;
  final Widget rightContent;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      key: key,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: content,
              ),
            ),
          ),
          if (rightContent != null) rightContent,
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
