import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/proposta_model.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../image/logo_partido_image.dart';
import '../photo.dart';
import '../tag/tag_proposta.dart';
import '../text_rich.dart';

class FavoritePropostaTile extends StatelessWidget {
  FavoritePropostaTile(this.proposta, {this.clickableImage});

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CardBase(
        slotLeft: _buildLeftContent(),
        slotCenter: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopContent(),
            _buildCenterContent(),
          ],
        ),
        slotBottom: _buildActions(context),
        onTap: () => SimpleRouter.forward(
          PostPageConnected(
            post: proposta,
            postType: PostType.PROPOSICAO,
          ),
          name: POST_PAGE,
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: TagProposta(proposta),
      ),
    ]);
  }

  Widget _buildLeftContent() {
    return Stack(
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
        proposta.urlPartidoLogo != null
            ? Positioned(
                right: 0,
                bottom: -10,
                child: LogoPartidoImage(
                  logoPartido: proposta.urlPartidoLogo,
                  size: 22,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildTopContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
          TextRich(
            maxLines: 4,
            children: [
              TextSpan(
                text: '${proposta.descricaoTipo}: ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(text: '${proposta.ementa}'),
            ],
          ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
