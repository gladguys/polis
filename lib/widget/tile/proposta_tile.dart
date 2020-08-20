import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/domain/model/proposta_model.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../../page/post/widget/like_post_button.dart';
import '../../page/post/widget/unlike_post_button.dart';
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
          slotLeft: _buildLeftContent(context),
          slotCenter: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTopContent(context),
              _buildCenterContent(),
              const SizedBox(height: 8),
              Text(
                proposta.dataAtualizacao.formatDate() ?? NOT_INFORMED_FEMALE,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[600]
                      : Colors.grey[300],
                ),
              ),
            ],
          ),
          slotBottom: _buildActions(context),
          key: cardBaseKey,
          onTap: () async {
            context.bloc<TimelineBloc>().add(RefreshTimeline());
            await SimpleRouter.forward(
              PostPageConnected(
                post: proposta,
                postType: PostType.PROPOSICAO,
                timelineBloc: context.bloc<TimelineBloc>(),
              ),
              name: POST_PAGE,
            );
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

  Widget _buildLeftContent(BuildContext context) {
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
                color: Theme.of(context).primaryColor,
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

  Widget _buildTopContent(BuildContext context) {
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
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey[600]
                : Colors.grey[300],
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
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LikePostButton(post: proposta),
                  const SizedBox(width: 24),
                  UnlikePostButton(post: proposta),
                  const SizedBox(width: 24),
                  ButtonActionCard(
                    icon: FontAwesomeIcons.comment,
                    iconColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[700]
                        : Colors.grey[500],
                    text: proposta.qntComentarios.toString(),
                    textColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[700]
                        : Colors.grey[500],
                    onTap: () {},
                  ),
                  const Spacer(),
                  ButtonActionCard(
                    isIconOnly: true,
                    icon: proposta.favorito ?? false
                        ? FontAwesomeIcons.solidBookmark
                        : FontAwesomeIcons.bookmark,
                    iconColor: (proposta.favorito ?? false)
                        ? Colors.yellow
                        : Theme.of(context).brightness == Brightness.light
                            ? Colors.grey[700]
                            : Colors.grey[500],
                    onTap: () => context.bloc<PostBloc>().add(
                          FavoritePostForUser(
                            post: proposta.toJson(),
                            user: context.bloc<UserBloc>().user,
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
