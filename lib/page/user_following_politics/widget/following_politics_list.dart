import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/cubits.dart';
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
    final localUser = context.bloc<UserCubit>().user;
    final pickedUser = context.bloc<UserProfileCubit>().user;
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
    final cubit = context.bloc<UserFollowingPoliticsCubit>();
    return CardBase(
      key: ValueKey(politico.id),
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: GestureDetector(
        child: Photo(url: politico.urlFoto),
        onTap: () => SimpleRouter.forward(
          PoliticProfilePageConnected(
            politico.id,
            onUnfollowPolitic: () => cubit.followUnfollowPolitic(
              user: context.bloc<UserCubit>().user,
              politico: politico,
            ),
          ),
          name: POLITIC_PROFILE_PAGE,
        ),
      ),
      slotCenter: _buildSlotCenter(politico, context),
      slotRight: isLocalUserThePickedOne
          ? ButtonFollowUnfollow(
              isFollow: cubit.isPoliticBeingFollowed(politico),
              key: followUnfollowButtonKey,
              onPressed: () => cubit.followUnfollowPolitic(
                user: context.bloc<UserCubit>().user,
                politico: politico,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildSlotCenter(PoliticoModel politico, BuildContext context) {
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
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
