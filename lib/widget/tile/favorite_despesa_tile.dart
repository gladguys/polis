import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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

class FavoriteDespesaTile extends StatelessWidget {
  FavoriteDespesaTile(this.despesa, {this.clickableImage});

  final DespesaModel despesa;
  final bool clickableImage;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: _buildLeftContent(),
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

  Widget _buildLeftContent() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(24),
          child: Photo(url: despesa.fotoPolitico),
          onTap: () => clickableImage
              ? SimpleRouter.forward(
                  PoliticProfilePageConnected(despesa.idPolitico),
                  name: POLITIC_PROFILE_PAGE,
                )
              : null,
        ),
        despesa.urlPartidoLogo != null
            ? Positioned(
                right: 0,
                bottom: -10,
                child: FancyShimmerImage(
                  imageUrl: despesa.urlPartidoLogo,
                  width: 22,
                  height: 22,
                  boxFit: BoxFit.contain,
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
              despesa.nomePolitico,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$POLITIC · ${despesa.siglaPartido} · ${despesa.estadoPolitico}',
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
            '${despesa.dataDocumento.formatDate()}',
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
