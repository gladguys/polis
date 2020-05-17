import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../enum/post_type.dart';
import '../../extension/extensions.dart';
import '../../i18n/i18n.dart';
import '../../model/models.dart';
import '../../page/pages.dart';
import '../../page/theme/main_theme.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../photo.dart';
import '../text_rich.dart';
import '../timeline_card_label.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa, {this.clickableImage});

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
      key: cardBaseKey,
      onTap: () async {
        await SimpleRouter.forward(
          PostPageConnected(
            post: despesa,
            postType: PostType.DESPESA,
            timelineBloc: context.bloc<TimelineBloc>(),
          ),
          name: POST_PAGE,
        );
        context.bloc<TimelineBloc>().add(RefreshTimeline());
      },
    );
  }

  Widget _buildLeftContent() {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      child: Column(
        children: <Widget>[
          Row(
        children: <Widget>[
          if (!despesa.visualizado)
            FaIcon(
              FontAwesome5Solid.circle,
              color: theme.primaryColor,
              size: 5,
            ),
          Photo(url: despesa.fotoPolitico),
          ],),
          const SizedBox(height: 16),
          FancyShimmerImage(
            imageUrl: despesa.urlPartidoLogo,
            width: 30,
            height: 30,
            boxFit: BoxFit.contain,
          ),
        ],
      ),
      onTap: () => clickableImage
          ? SimpleRouter.forward(
              PoliticProfilePageConnected(despesa.idPolitico),
              name: POLITIC_PROFILE_PAGE,
            )
          : null,
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
        TimelineCardLabel(
          child: Center(
            child: Text(
              EXPENSE.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.amber,
              ),
            ),
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
        Text(
          '${despesa.dataDocumento.formatDate()}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
