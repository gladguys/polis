import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../../../core/keys.dart';
import '../../../i18n/i18n.dart';
import '../../../model/models.dart';
import '../../../widget/button_follow_unfollow.dart';
import '../../../widget/card_base.dart';
import '../../../widget/not_found.dart';
import '../../../widget/photo.dart';

class FollowingPoliticsList extends StatelessWidget {
  FollowingPoliticsList(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return politicos.isNotEmpty
        ? _buildList(context)
        : NotFound(msg: YOU_DONT_FOLLOW_ANYONE_YET);
  }

  Widget _buildList(BuildContext context) {
    return ListView.separated(
      itemCount: politicos.length,
      itemBuilder: (_, i) => _buildListTile(context, politicos[i]),
      separatorBuilder: (_, i) => const Divider(
        height: 1,
        indent: 8,
        endIndent: 8,
      ),
    );
  }

  Widget _buildListTile(BuildContext context, PoliticoModel politico) {
    final bloc = context.bloc<UserFollowingPoliticsBloc>();

    return CardBase(
      key: ValueKey(politico.id),
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: Photo(url: politico.urlFoto),
      slotCenter: _buildSlotCenter(politico),
      slotRight: ButtonFollowUnfollow(
        isFollow: bloc.isPoliticBeingFollowed(politico),
        key: followUnfollowButtonKey,
        onPressed: () => bloc.add(
          FollowUnfollowPolitic(
            user: context.bloc<UserBloc>().user,
            politico: politico,
          ),
        ),
      ),
    );
  }

  Widget _buildSlotCenter(PoliticoModel politico) {
    return Wrap(
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
    );
  }
}
