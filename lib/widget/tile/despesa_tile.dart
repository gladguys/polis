import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../extension/extensions.dart';
import '../../i18n/i18n.dart';
import '../../model/models.dart';
import '../../page/pages.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo.dart';
import '../text_rich.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa, {this.clickableImage});

  final DespesaModel despesa;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Photo(url: despesa.fotoPolitico),
        onTap: () => clickableImage
            ? SimpleRouter.forward(
                PoliticProfilePageConnected(despesa.idPolitico),
                name: POLITIC_PROFILE_PAGE,
              )
            : null,
      ),
      slotCenter: BlocBuilder<PostBloc, PostState>(
        builder: (_, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopContent(),
            _buildCenterContent(),
          ],
        ),
      ),
      slotBottom: _buildActions(context),
      onTap: () => SimpleRouter.forward(
        PostPageConnected(
          post: despesa,
          postType: PostType.DESPESA,
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
          despesa.nomePolitico,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' · $POLITIC · ${despesa.siglaPartido} · ${despesa.estadoPolitico}',
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
            TextSpan(
              text: '${despesa.tipoAtividade.capitalizeUpperCase()}'
                  ' $WITH '
                  '${despesa.tipoDespesa.toLowerCase().removeDot()}'
                  ' $IN_THE_AMOUNT_OF ',
            ),
            TextSpan(
              text: '${despesa.valorLiquido.formatCurrency()}.',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${despesa.dataDocumento.formatDate()}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
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
                context.bloc<PostBloc>().isPostFavorite ? Colors.yellow : null,
            text: context.bloc<PostBloc>().isPostFavorite ? SAVED : SAVE,
            fontSize: 14,
            onTap: () => context.bloc<PostBloc>().add(
                  FavoritePostForUser(
                    post: {
                      'id': despesa.id,
                      ...despesa.toJson(),
                    },
                    user: context.bloc<UserBloc>().user,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
