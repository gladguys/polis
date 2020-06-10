import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/proposta_model.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../../page/theme/main_theme.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../image/photo_image.dart';
import '../photo.dart';
import '../tag/tag_proposta.dart';
import '../text_rich.dart';

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
          child: TagProposta(proposta),
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
            child: PhotoImage(
              url: proposta.urlPartidoLogo,
              size: 22,
            ),
          ),
        ],
      ),
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
        if (proposta.foiAtualizada)
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 4),
            child: TextRich(
              maxLines: 4,
              children: [
                const TextSpan(
                  text: '$UPDATE: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '${proposta.despacho}'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => state.join(
        (_) => _mapActionsStateToWidget(state, context),
        (_) => _mapActionsStateToWidget(state, context),
        (_) => _mapActionsStateToWidget(state, context),
        (_) => _mapActionsStateToWidget(state, context),
        (_) => _mapActionsStateToWidget(state, context),
      ),
    );
  }

  Widget _mapActionsStateToWidget(state, BuildContext context) {
    return Padding(
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
                context.bloc<PostBloc>().isPostFavorite ? Colors.yellow : null,
            onTap: () => context.bloc<PostBloc>().add(
                  FavoritePostForUser(
                    post: proposta.toJson(),
                    user: context.bloc<UserBloc>().user,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
