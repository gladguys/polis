import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/blocs.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../core/routing/route_names.dart';
import '../../../widget/button_follow_unfollow.dart';
import '../../../widget/card_base.dart';
import '../../../widget/not_found.dart';
import '../../../widget/photo.dart';
import '../../pages.dart';

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
    final localUser = context.bloc<UserBloc>().user;
    final pickedUser = context.bloc<UserProfileBloc>().user;
    final isLocalUserThePickedOne = localUser == pickedUser;
    return ListView.separated(
      itemCount: politicos.length,
      itemBuilder: (_, i) =>
          _buildListTile(context, politicos[i], isLocalUserThePickedOne),
      separatorBuilder: (_, i) => const Divider(
        height: 1,
        indent: 8,
        endIndent: 8,
      ),
    );
  }

  Widget _buildListTile(BuildContext context, PoliticoModel politico,
      bool isLocalUserThePickedOne) {
    final bloc = context.bloc<UserFollowingPoliticsBloc>();
    return CardBase(
      key: ValueKey(politico.id),
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: GestureDetector(
        child: Photo(url: politico.urlFoto),
        onTap: () => SimpleRouter.forward(
          PoliticProfilePageConnected(
            politico.id,
            onUnfollowPolitic: () => bloc.add(
              FollowUnfollowPolitic(
                user: context.bloc<UserBloc>().user,
                politico: politico,
              ),
            ),
          ),
          name: POLITIC_PROFILE_PAGE,
        ),
      ),
      slotCenter: _buildSlotCenter(politico),
      slotRight: isLocalUserThePickedOne
          ? ButtonFollowUnfollow(
              isFollow: bloc.isPoliticBeingFollowed(politico),
              key: followUnfollowButtonKey,
              onPressed: () => bloc.add(
                FollowUnfollowPolitic(
                  user: context.bloc<UserBloc>().user,
                  politico: politico,
                ),
              ),
            )
          : const SizedBox.shrink(),
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
