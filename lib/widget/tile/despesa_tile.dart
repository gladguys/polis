import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/domain/enum/post_type.dart';
import '../../core/domain/model/models.dart';
import '../../core/extension/extensions.dart';
import '../../core/i18n/i18n.dart';
import '../../core/keys.dart';
import '../../core/routing/route_names.dart';
import '../../page/pages.dart';
import '../../page/post/widget/like_post_button.dart';
import '../../page/post/widget/unlike_post_button.dart';
import '../../page/theme/main_theme.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../image/photo_image.dart';
import '../photo.dart';
import '../tag/tag_despesa.dart';
import '../text_rich.dart';

class DespesaTile extends StatelessWidget {
  DespesaTile(this.despesa, {this.clickableImage});

  final DespesaModel despesa;
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
          slotCenter: BlocBuilder<PostBloc, PostState>(
            builder: (_, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTopContent(),
                _buildCenterContent(),
                const SizedBox(height: 8),
                Text(
                  '${despesa.dataDocumento.formatDate()}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
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
        ),
        Positioned(
          top: 0,
          right: 0,
          child: TagDespesa(),
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
            child: Photo(url: despesa.fotoPolitico),
            onTap: () => clickableImage
                ? SimpleRouter.forward(
                    PoliticProfilePageConnected(despesa.idPolitico),
                    name: POLITIC_PROFILE_PAGE,
                  )
                : null,
          ),
          if (!despesa.visualizado)
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
              url: despesa.urlPartidoLogo,
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
    );
  }

  Widget _buildCenterContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: TextRich(
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
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 4, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikePostButton(post: despesa),
                UnlikePostButton(post: despesa),
                ButtonActionCard(
                  icon: FontAwesomeIcons.comment,
                  text: '120',
                  onTap: () {},
                ),
                ButtonActionCard(
                  isIconOnly: true,
                  icon: (despesa.favorito ?? false)
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  iconColor: (despesa.favorito ?? false) ? Colors.yellow : null,
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
          ),
        ],
      ),
    );
  }
}
