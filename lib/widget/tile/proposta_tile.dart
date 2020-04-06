import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../extension/formatters.dart';
import '../../i18n/i18n.dart';
import '../../model/proposta_model.dart';
import '../../page/pages.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo_politic.dart';
import '../text_rich.dart';

class PropostaTile extends StatelessWidget {
  PropostaTile(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: PhotoPolitic(urlPhoto: proposta.fotoPolitico),
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
          // TODO: trazer siglauf
          ' · $POLITIC · ${proposta.siglaPartido} · ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
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
            TextSpan(text: proposta.descricaoTramitacao),
          ],
        ),
        const SizedBox(height: 2),
        TextRich(
          fontSize: 12,
          color: Colors.grey[600],
          children: [
            const TextSpan(
              text: '$SITUATION: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: proposta.descricaoSituacao),
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
              text: '${proposta.dataDocumento.formatDate()}',
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonActionCard(
            icon: Icon(FontAwesomeIcons.thumbsUp, size: 16),
            paddingIcon: const EdgeInsets.only(bottom: 3),
            onTap: () {},
          ),
          const SizedBox(width: 16),
          ButtonActionCard(
            icon: Icon(FontAwesomeIcons.thumbsDown, size: 16),
            onTap: () {},
          ),
          const SizedBox(width: 16),
          ButtonActionCard(
            icon: Icon(FontAwesomeIcons.comment, size: 16),
            paddingIcon: const EdgeInsets.only(bottom: 2),
            onTap: () {},
          ),
          const Spacer(flex: 1),
          ButtonActionCard(
            icon: Icon(
              context.bloc<PostBloc>().isPostFavorite
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              size: 16,
              color: context.bloc<PostBloc>().isPostFavorite
                  ? Colors.green
                  : Colors.grey,
            ),
            paddingIcon: const EdgeInsets.symmetric(horizontal: 16),
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
