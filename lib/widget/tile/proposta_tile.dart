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
    return CardBase(
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
    );
  }

  Widget _buildLeftContent() {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      child: Row(
        children: <Widget>[
          if (!proposta.visualizado)
            FaIcon(
              FontAwesome5Solid.circle,
              color: theme.primaryColor,
              size: 5,
            ),
          Photo(url: proposta.fotoPolitico),
        ],
      ),
      onTap: () => clickableImage
          ? SimpleRouter.forward(
              PoliticProfilePageConnected(proposta.idPoliticoAutor),
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
        TimelineCardLabel(
          child: Center(
            child: proposta.foiAtualizada ?? false
                ? Text(
                    UPDATE.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  )
                : Text(
                    NEW.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
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
                context.bloc<PostBloc>().isPostFavorite ? Colors.amber : null,
            //text: context.bloc<PostBloc>().isPostFavorite ? SAVED : SAVE,
            // fontSize: 14,
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
