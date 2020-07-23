import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_router/simple_router.dart';

import '../../../bloc/cubits.dart';
import '../../../core/domain/model/models.dart';
import '../../../core/i18n/i18n.dart';
import '../../../core/keys.dart';
import '../../../core/routing/route_names.dart';
import '../../../widget/button_follow_unfollow.dart';
import '../../../widget/card_base.dart';
import '../../../widget/image/photo_image.dart';
import '../../../widget/not_found.dart';
import '../../../widget/photo.dart';
import '../../pages.dart';

class SearchPoliticsList extends StatelessWidget {
  SearchPoliticsList(this.politicos);

  final List<PoliticoModel> politicos;

  @override
  Widget build(BuildContext context) {
    return politicos.isNotEmpty
        ? _buildList(context)
        : NotFound(msg: NO_RESULTS_FROM_SEARCH);
  }

  Widget _buildList(BuildContext context) {
    return ListView.separated(
      key: politicsListKey,
      separatorBuilder: (_, i) => const Divider(
        height: 8,
        indent: 8,
        endIndent: 8,
      ),
      itemCount: politicos.length,
      itemBuilder: (_, i) => _buildCard(context, politicos[i]),
    );
  }

  Widget _buildCard(BuildContext context, PoliticoModel politico) {
    final cubit = context.bloc<SearchPoliticCubit>();

    return CardBase(
      key: ValueKey(politico.id),
      crossAxisAlignment: CrossAxisAlignment.center,
      slotLeft: _buildLeftContent(politico),
      slotCenter: _buildCardContent(context, politico),
      slotRight: ButtonFollowUnfollow(
        isFollow: cubit.isPoliticBeingFollowed(politico),
        key: searchPoliticsFollowUnfollowButton,
        onPressed: () => cubit.followUnfollowSearchPolitic(
          user: context.bloc<UserCubit>().user,
          politico: politico,
        ),
      ),
      onTap: () => SimpleRouter.forward(
        BlocProvider.value(
          value: context.bloc<SearchPoliticCubit>().politicProfileCubit
            ..getPoliticInfo(politico.id),
          child: PoliticProfilePage(
            onUnfollowPolitic: () => cubit.followUnfollowSearchPolitic(
              user: context.bloc<UserCubit>().user,
              politico: politico,
            ),
          ),
        ),
        name: POLITIC_PROFILE_PAGE,
      ),
    );
  }

  Widget _buildLeftContent(PoliticoModel politico) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Photo(url: politico.urlFoto),
        Positioned(
          right: 0,
          bottom: 0,
          child: PhotoImage(
            url: politico.urlPartidoLogo,
            size: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent(BuildContext context, PoliticoModel politico) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            politico.nomeEleitoral,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$POLITIC · ${politico.siglaPartido}'
            ' · ${politico.siglaUf}',
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[600]
                  : Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
