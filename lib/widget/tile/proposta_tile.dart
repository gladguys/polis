import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../extension/extensions.dart';
import '../../i18n/i18n.dart';
import '../../model/proposta_model.dart';
import '../../page/pages.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo.dart';
import '../text_rich.dart';

class PropostaTile extends StatelessWidget {
  PropostaTile(this.proposta, {this.clickableImage});

  final PropostaModel proposta;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Photo(url: proposta.fotoPolitico),
        onTap: () => clickableImage
            ? SimpleRouter.forward(
                PoliticProfilePageConnected(proposta.idPoliticoAutor),
                name: POLITIC_PROFILE_PAGE,
              )
            : null,
      ),
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
    );
  }

  Widget _buildTopContent() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      children: <Widget>[
        Text(
          proposta.nomePolitico,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' · $POLITIC · ${proposta.siglaPartido} · ${proposta.estadoPolitico}',
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
        TextRich(
          children: [
            const TextSpan(
              text: '$SITUATION: ',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: proposta.descricaoSituacao ?? NOT_INFORMED_FEMALE,
              style: TextStyle(
                color: proposta.descricaoSituacao == null
                    ? Colors.grey[600]
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
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
        const SizedBox(height: 4),
        TextRich(
          fontSize: 12,
          color: Colors.grey[600],
          children: [
            const TextSpan(
              text: '$TRAMITATION: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: proposta.descricaoTramitacao ?? NOT_INFORMED_FEMALE),
          ],
        ),
        const SizedBox(height: 2),
        TextRich(
          fontSize: 12,
          color: Colors.grey[600],
          children: [
            const TextSpan(
              text: '$DATE: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: proposta.dataDocumento.formatDate() ?? NOT_INFORMED_FEMALE,
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Row(
        children: <Widget>[
          ButtonActionCard(
            icon: FontAwesomeIcons.shareAlt,
            text: SHARE,
            fontSize: 14,
            onTap: () {},
          ),
          const SizedBox(width: 16),
          ButtonActionCard(
            icon: context.bloc<PostBloc>().isPostFavorite
                ? FontAwesomeIcons.solidBookmark
                : FontAwesomeIcons.bookmark,
            iconColor:
                context.bloc<PostBloc>().isPostFavorite ? Colors.amber : null,
            text: context.bloc<PostBloc>().isPostFavorite ? SAVED : SAVE,
            fontSize: 14,
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
