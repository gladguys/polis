import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../extension/extensions.dart';
import '../../i18n/i18n.dart';
import '../../model/proposta_model.dart';
import '../../page/pages.dart';
import '../../page/theme/main_theme.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo.dart';
import '../text_rich.dart';
import '../timeline_card_label.dart';

class PropostaTile extends StatelessWidget {
  PropostaTile(this.proposta, {this.clickableImage});

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Divider(height: 1),
        CardBase(
          withIndent: false,
          paddingSlotCenter: EdgeInsets.zero,
          slotLeft: _buildLeftContent(),
          slotCenter: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopContent(),
              _buildCenterContent(),
            ],
          ),
          slotBottom: _buildActions(context),
          onTap: () async {
            await SimpleRouter.forward(
              PostPageConnected(
                post: proposta,
                postType: PostType.PROPOSICAO,
                timelineBloc: context.bloc<TimelineBloc>(),
              ),
              name: POST_PAGE,
            );
            context.bloc<TimelineBloc>().add(RefreshTimeline());
          },
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _buildTag(),
        ),
      ],
    );
  }

  Widget _buildLeftContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(24),
            child: Photo(url: proposta.fotoPolitico),
            onTap: () => clickableImage
                ? SimpleRouter.forward(
                    PoliticProfilePageConnected(proposta.idPoliticoAutor),
                    name: POLITIC_PROFILE_PAGE,
                  )
                : null,
          ),
          if (!proposta.visualizado)
            Positioned(
              top: -4,
              left: 0,
              child: FaIcon(
                FontAwesome5Solid.circle,
                color: theme.primaryColor,
                size: 5,
              ),
            ),
          Positioned(
            right: 0,
            bottom: -10,
            child: FancyShimmerImage(
              imageUrl: proposta.urlPartidoLogo,
              width: 22,
              height: 22,
              boxFit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TimelineCardLabel(
          child: proposta.foiAtualizada ?? false
              ? Text(
                  UPDATE.toUpperCase(),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.yellow[800],
                  ),
                )
              : Text(
                  NEW.toUpperCase(),
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildTopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 14),
        Text(
          proposta.nomePolitico,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$POLITIC'
          ' · ${proposta.siglaPartido}'
          ' · ${proposta.estadoPolitico}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        if (proposta.descricaoTipo == PLENARY_AMENDMENT)
          Text('${proposta.descricaoTipo}')
        else
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextRich(
              maxLines: 4,
              children: [
                TextSpan(
                  text: '${proposta.descricaoTipo}: ',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '${proposta.ementa}'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Padding(
        padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              proposta.dataAtualizacao.formatDate() ?? NOT_INFORMED_FEMALE,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            ButtonActionCard(
              isIconOnly: true,
              icon: context.bloc<PostBloc>().isPostFavorite
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              iconColor:
                  context.bloc<PostBloc>().isPostFavorite ? Colors.amber : null,
              onTap: () => context.bloc<PostBloc>().add(
                    FavoritePostForUser(
                      post: proposta.toJson(),
                      user: context.bloc<UserBloc>().user,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
