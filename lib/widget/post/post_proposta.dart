import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_router/simple_router.dart';

import '../../bloc/blocs.dart';
import '../../core/routing/route_names.dart';
import '../../extension/formatters.dart';
import '../../i18n/i18n.dart';
import '../../model/proposta_model.dart';
import '../../page/pages.dart';
import '../button_action_card.dart';
import '../card_base.dart';
import '../label_value.dart';
import '../photo.dart';
import '../text_rich.dart';

class PostProposta extends StatelessWidget {
  PostProposta(this.proposta);

  final PropostaModel proposta;

  @override
  Widget build(BuildContext context) {
    return CardBase(
      slotLeft: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Photo(url: proposta.fotoPolitico),
        onTap: () => SimpleRouter.forward(
          PoliticProfilePageConnected(proposta.idPoliticoAutor),
          name: POLITIC_PROFILE_PAGE,
        ),
      ),
      slotCenter: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopContent(),
          _buildCenterContent(),
        ],
      ),
      slotBottom: _buildActions(context),
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
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        children: <Widget>[
          TextRich(
            children: [
              TextSpan(
                text: '${proposta.descricaoTipo}: ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(text: '${proposta.ementa ?? NOT_INFORMED_FEMALE}'),
            ],
          ),
          LabelValue(
            label: DETAILED_MENU,
            value: proposta.ementaDetalhada,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: TRAMITATION,
            value: proposta.descricaoTramitacao,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: DISPATCH,
            value: proposta.despacho,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: SITUATION,
            value: proposta.descricaoSituacao,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: DOCUMENT_TYPE,
            value: proposta.tipoDocumento,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: TYPE_ACRONYM,
            value: proposta.siglaTipo,
            emptyValue: NOT_INFORMED,
          ),
          LabelValue(
            label: PROPOSAL_NUMBER,
            value: proposta.numero,
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: DOCUMENT_DATE,
            value: proposta.dataDocumento.formatDate(),
            emptyValue: NOT_INFORMED_FEMALE,
          ),
          LabelValue(
            label: PRESENTATION_DATE,
            value: proposta.dataApresentacao.formatDate(),
            emptyValue: NOT_INFORMED_FEMALE,
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.only(top: 4),
        child: Row(
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
      ),
    );
  }
}
